package com.luztechnology.product.service;

import com.luztechnology.product.dto.ProductBulkImportResponse;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public class ProductBulkService {

    private final ProductRepository productRepository;

    @Transactional
    public ProductBulkImportResponse importProductsFromExcel(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("Import file is required");
        }

        ProductBulkImportResponse response = ProductBulkImportResponse.builder().build();

        try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);

            for (int index = 1; index <= sheet.getLastRowNum(); index++) {
                Row row = sheet.getRow(index);
                if (row == null || isBlankRow(row)) {
                    continue;
                }

                int rowNumber = index + 1;
                try {
                    ImportRow importRow = parseRow(row);
                    Product product = productRepository.findBySku(importRow.sku())
                            .orElseGet(Product::new);
                    boolean isNew = product.getId() == null;

                    product.setName(importRow.name());
                    product.setDescription(importRow.description());
                    product.setPrice(importRow.price());
                    product.setSku(importRow.sku());
                    product.setStatus(importRow.status());

                    productRepository.save(product);
                    if (isNew) {
                        response.setCreatedCount(response.getCreatedCount() + 1);
                    } else {
                        response.setUpdatedCount(response.getUpdatedCount() + 1);
                    }
                } catch (IllegalArgumentException ex) {
                    response.setSkippedCount(response.getSkippedCount() + 1);
                    response.getErrors().add(ProductBulkImportResponse.RowError.builder()
                            .rowNumber(rowNumber)
                            .message(ex.getMessage())
                            .build());
                }
            }
        }

        return response;
    }

    @Transactional(readOnly = true)
    public byte[] exportProductsToExcel() throws IOException {
        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Products");
            createHeaderRow(sheet);

            int rowIndex = 1;
            for (Product product : productRepository.findAll()) {
                Row row = sheet.createRow(rowIndex++);
                row.createCell(0).setCellValue(product.getName());
                row.createCell(1).setCellValue(product.getDescription() == null ? "" : product.getDescription());
                row.createCell(2).setCellValue(product.getPrice() == null ? "" : product.getPrice().toPlainString());
                row.createCell(3).setCellValue(product.getSku());
                row.createCell(4).setCellValue(product.getStatus() == null ? "" : product.getStatus().name());
            }

            for (int column = 0; column < 5; column++) {
                sheet.autoSizeColumn(column);
            }

            workbook.write(outputStream);
            return outputStream.toByteArray();
        }
    }

    private void createHeaderRow(Sheet sheet) {
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Name");
        header.createCell(1).setCellValue("Description");
        header.createCell(2).setCellValue("Price");
        header.createCell(3).setCellValue("SKU");
        header.createCell(4).setCellValue("Status");
    }

    private ImportRow parseRow(Row row) {
        String name = getCellValueAsString(row.getCell(0)).trim();
        String description = getCellValueAsString(row.getCell(1)).trim();
        String priceValue = getCellValueAsString(row.getCell(2)).trim();
        String sku = getCellValueAsString(row.getCell(3)).trim();
        String statusValue = getCellValueAsString(row.getCell(4)).trim();

        if (name.isBlank()) {
            throw new IllegalArgumentException("Name is required");
        }
        if (sku.isBlank()) {
            throw new IllegalArgumentException("SKU is required");
        }
        if (priceValue.isBlank()) {
            throw new IllegalArgumentException("Price is required");
        }

        BigDecimal price;
        try {
            price = new BigDecimal(priceValue);
        } catch (NumberFormatException ex) {
            throw new IllegalArgumentException("Price must be a valid number");
        }
        if (price.compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException("Price cannot be negative");
        }

        ProductStatus status;
        try {
            status = ProductStatus.valueOf(statusValue.toUpperCase(Locale.ROOT));
        } catch (IllegalArgumentException ex) {
            throw new IllegalArgumentException("Status must be one of ACTIVE, DRAFT, ARCHIVED");
        }

        return new ImportRow(name, description, price, sku, status);
    }

    private String getCellValueAsString(Cell cell) {
        if (cell == null)
            return "";
        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> BigDecimal.valueOf(cell.getNumericCellValue()).stripTrailingZeros().toPlainString();
            case BOOLEAN -> String.valueOf(cell.getBooleanCellValue());
            case FORMULA -> cell.getCellFormula();
            default -> "";
        };
    }

    private boolean isBlankRow(Row row) {
        for (int column = 0; column < 5; column++) {
            if (!getCellValueAsString(row.getCell(column)).trim().isBlank()) {
                return false;
            }
        }
        return true;
    }

    private record ImportRow(String name, String description, BigDecimal price, String sku, ProductStatus status) {
    }
}
