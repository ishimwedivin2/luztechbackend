package com.luztechnology.admin.service;

import com.luztechnology.admin.dto.SystemConfigurationRequest;
import com.luztechnology.admin.entity.SystemConfiguration;
import com.luztechnology.admin.repository.SystemConfigurationRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SystemConfigurationService {

    private final SystemConfigurationRepository systemConfigurationRepository;

    @Transactional(readOnly = true)
    public List<SystemConfiguration> getConfigurations() {
        return systemConfigurationRepository.findAll();
    }

    @Transactional(readOnly = true)
    public SystemConfiguration getConfiguration(String key) {
        return systemConfigurationRepository.findByConfigKey(key)
                .orElseThrow(() -> new ResourceNotFoundException("Configuration not found for key: " + key));
    }

    @Transactional
    public SystemConfiguration upsertConfiguration(String key, SystemConfigurationRequest request) {
        if (key == null || key.isBlank()) {
            throw new IllegalArgumentException("Configuration key is required");
        }
        SystemConfiguration configuration = systemConfigurationRepository.findByConfigKey(key)
                .orElseGet(() -> SystemConfiguration.builder().configKey(key).build());
        configuration.setConfigValue(request.getConfigValue());
        configuration.setCategory(request.getCategory());
        configuration.setDescription(request.getDescription());
        configuration.setSensitive(request.isSensitive());
        return systemConfigurationRepository.save(configuration);
    }

    @Transactional
    public void deleteConfiguration(String key) {
        SystemConfiguration configuration = getConfiguration(key);
        systemConfigurationRepository.delete(configuration);
    }
}
