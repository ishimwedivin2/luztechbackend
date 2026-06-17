package com.luztechnology.admin.service;

import com.luztechnology.admin.entity.SystemBackup;
import com.luztechnology.admin.repository.SystemBackupRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

@Service
@RequiredArgsConstructor
public class SystemBackupService {

    private static final String DUMP_FILE = "database.sql";
    private static final String UPLOADS_DIR = "uploads";

    private final SystemBackupRepository systemBackupRepository;

    @Value("${spring.datasource.url}")
    private String datasourceUrl;

    @Value("${spring.datasource.username}")
    private String datasourceUsername;

    @Value("${spring.datasource.password}")
    private String datasourcePassword;

    @Value("${file.upload-dir:uploads}")
    private String uploadDir;

    @Value("${system.backup-dir:backups}")
    private String backupDir;

    @Value("${system.pg-dump-command:pg_dump}")
    private String pgDumpCommand;

    @Value("${system.psql-command:psql}")
    private String psqlCommand;

    @Transactional
    public SystemBackup createBackup(String requestedName) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd-HHmmss"));
        String backupName = requestedName == null || requestedName.isBlank()
                ? "backup-" + timestamp
                : sanitizeName(requestedName);
        Path backupRoot = Paths.get(backupDir).toAbsolutePath().normalize();
        Path stagingDir = backupRoot.resolve(backupName + "-staging");
        Path zipFile = backupRoot.resolve(backupName + ".zip");

        SystemBackup backup = systemBackupRepository.save(SystemBackup.builder()
                .name(backupName)
                .status("IN_PROGRESS")
                .filePath(zipFile.toString())
                .message("Backup started")
                .build());

        try {
            Files.createDirectories(stagingDir);
            Files.createDirectories(backupRoot);

            runPgDump(stagingDir.resolve(DUMP_FILE));
            copyUploadsToStaging(stagingDir.resolve(UPLOADS_DIR));
            zipDirectory(stagingDir, zipFile);

            backup.setStatus("COMPLETED");
            backup.setSizeBytes(Files.size(zipFile));
            backup.setCompletedAt(LocalDateTime.now());
            backup.setMessage("Database dump and uploaded files backed up successfully");
            return systemBackupRepository.save(backup);
        } catch (Exception ex) {
            backup.setStatus("FAILED");
            backup.setMessage(ex.getMessage());
            return systemBackupRepository.save(backup);
        } finally {
            deleteDirectoryQuietly(stagingDir);
        }
    }

    @Transactional(readOnly = true)
    public List<SystemBackup> getBackups() {
        return systemBackupRepository.findAll();
    }

    @Transactional(readOnly = true)
    public SystemBackup getBackup(UUID id) {
        return systemBackupRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Backup not found with id: " + id));
    }

    @Transactional
    public SystemBackup restoreBackup(UUID id) {
        SystemBackup backup = getBackup(id);
        if (!"COMPLETED".equalsIgnoreCase(backup.getStatus())) {
            throw new IllegalStateException("Only completed backups can be restored");
        }

        Path backupFile = Paths.get(backup.getFilePath()).toAbsolutePath().normalize();
        if (!Files.exists(backupFile)) {
            throw new IllegalStateException("Backup file does not exist: " + backupFile);
        }

        Path restoreDir = Paths.get(backupDir).toAbsolutePath().normalize()
                .resolve("restore-" + id);
        try {
            unzip(backupFile, restoreDir);
            runPsqlRestore(restoreDir.resolve(DUMP_FILE));
            restoreUploads(restoreDir.resolve(UPLOADS_DIR));

            backup.setRestoredAt(LocalDateTime.now());
            backup.setMessage("Backup restored successfully");
            return systemBackupRepository.save(backup);
        } catch (Exception ex) {
            backup.setMessage("Restore failed: " + ex.getMessage());
            systemBackupRepository.save(backup);
            throw new IllegalStateException("Restore failed: " + ex.getMessage(), ex);
        } finally {
            deleteDirectoryQuietly(restoreDir);
        }
    }

    private void runPgDump(Path outputFile) throws IOException, InterruptedException {
        DatabaseTarget target = parsePostgresUrl();
        ProcessBuilder processBuilder = new ProcessBuilder(
                pgDumpCommand,
                "--host", target.host(),
                "--port", target.port(),
                "--username", datasourceUsername,
                "--dbname", target.database(),
                "--clean",
                "--if-exists",
                "--no-owner",
                "--no-privileges",
                "--file", outputFile.toString());
        processBuilder.environment().put("PGPASSWORD", datasourcePassword);
        runProcess(processBuilder, "pg_dump");
    }

    private void runPsqlRestore(Path dumpFile) throws IOException, InterruptedException {
        if (!Files.exists(dumpFile)) {
            throw new IllegalStateException("Database dump not found in backup");
        }
        DatabaseTarget target = parsePostgresUrl();
        ProcessBuilder processBuilder = new ProcessBuilder(
                psqlCommand,
                "--host", target.host(),
                "--port", target.port(),
                "--username", datasourceUsername,
                "--dbname", target.database(),
                "--file", dumpFile.toString());
        processBuilder.environment().put("PGPASSWORD", datasourcePassword);
        runProcess(processBuilder, "psql restore");
    }

    private void runProcess(ProcessBuilder processBuilder, String label) throws IOException, InterruptedException {
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();
        String output = new String(process.getInputStream().readAllBytes());
        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new IllegalStateException(label + " failed with exit code " + exitCode + ": " + output);
        }
    }

    private void copyUploadsToStaging(Path targetUploadsDir) throws IOException {
        Path uploads = Paths.get(uploadDir).toAbsolutePath().normalize();
        if (!Files.exists(uploads)) {
            Files.createDirectories(targetUploadsDir);
            return;
        }
        copyDirectory(uploads, targetUploadsDir);
    }

    private void restoreUploads(Path sourceUploadsDir) throws IOException {
        if (!Files.exists(sourceUploadsDir)) {
            return;
        }
        Path uploads = Paths.get(uploadDir).toAbsolutePath().normalize();
        Files.createDirectories(uploads);
        copyDirectory(sourceUploadsDir, uploads);
    }

    private void copyDirectory(Path source, Path target) throws IOException {
        Files.walk(source).forEach(path -> {
            try {
                Path relative = source.relativize(path);
                Path destination = target.resolve(relative).normalize();
                if (Files.isDirectory(path)) {
                    Files.createDirectories(destination);
                } else {
                    Files.createDirectories(destination.getParent());
                    Files.copy(path, destination, StandardCopyOption.REPLACE_EXISTING);
                }
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        });
    }

    private void zipDirectory(Path sourceDir, Path zipFile) throws IOException {
        try (ZipOutputStream zipOutputStream = new ZipOutputStream(Files.newOutputStream(zipFile))) {
            Files.walk(sourceDir)
                    .filter(path -> !Files.isDirectory(path))
                    .forEach(path -> {
                        try {
                            String entryName = sourceDir.relativize(path).toString().replace("\\", "/");
                            zipOutputStream.putNextEntry(new ZipEntry(entryName));
                            Files.copy(path, zipOutputStream);
                            zipOutputStream.closeEntry();
                        } catch (IOException ex) {
                            throw new RuntimeException(ex);
                        }
                    });
        }
    }

    private void unzip(Path zipFile, Path targetDir) throws IOException {
        Files.createDirectories(targetDir);
        try (ZipInputStream zipInputStream = new ZipInputStream(Files.newInputStream(zipFile))) {
            ZipEntry entry;
            while ((entry = zipInputStream.getNextEntry()) != null) {
                Path destination = targetDir.resolve(entry.getName()).normalize();
                if (!destination.startsWith(targetDir)) {
                    throw new IllegalStateException("Invalid zip entry: " + entry.getName());
                }
                if (entry.isDirectory()) {
                    Files.createDirectories(destination);
                } else {
                    Files.createDirectories(destination.getParent());
                    Files.copy(zipInputStream, destination, StandardCopyOption.REPLACE_EXISTING);
                }
                zipInputStream.closeEntry();
            }
        }
    }

    private void deleteDirectoryQuietly(Path path) {
        if (path == null || !Files.exists(path)) {
            return;
        }
        try {
            Files.walk(path)
                    .sorted(Comparator.reverseOrder())
                    .forEach(item -> {
                        try {
                            Files.deleteIfExists(item);
                        } catch (IOException ignored) {
                        }
                    });
        } catch (IOException ignored) {
        }
    }

    private DatabaseTarget parsePostgresUrl() {
        String raw = datasourceUrl.substring("jdbc:".length());
        URI uri = URI.create(raw);
        String database = uri.getPath() == null ? "" : uri.getPath().replaceFirst("/", "");
        if (database.isBlank()) {
            throw new IllegalStateException("Could not determine PostgreSQL database name from datasource URL");
        }
        int port = uri.getPort() == -1 ? 5432 : uri.getPort();
        return new DatabaseTarget(uri.getHost(), String.valueOf(port), database);
    }

    private String sanitizeName(String value) {
        String sanitized = value.replaceAll("[^a-zA-Z0-9._-]", "-");
        return sanitized.isBlank() ? "backup-" + System.currentTimeMillis() : sanitized;
    }

    private record DatabaseTarget(String host, String port, String database) {
    }
}
