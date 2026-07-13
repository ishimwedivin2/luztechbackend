package com.luztechnology.product;

import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.finance.repository.TaxRateRepository;
import com.luztechnology.finance.service.TaxRateService;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
@RequiredArgsConstructor
public class DataSeeder implements ApplicationRunner {

    private final CategoryRepository categoryRepository;
    private final TaxRateRepository taxRateRepository;

    private static final List<String[]> DEFAULT_CATEGORIES = List.of(
        new String[]{"Networking",         "Routers, switches, access points and network equipment"},
        new String[]{"Laptops",            "Notebooks and portable computers"},
        new String[]{"Desktops & PCs",     "Desktop computers and all-in-one systems"},
        new String[]{"Monitors",           "Computer monitors and display screens"},
        new String[]{"Printers & Scanners","Printers, scanners and multifunction devices"},
        new String[]{"Storage",            "Hard drives, SSDs and external storage"},
        new String[]{"Components",         "CPUs, RAM, GPUs and PC components"},
        new String[]{"Accessories",        "Keyboards, mice, headsets and peripherals"},
        new String[]{"Servers",            "Server hardware and rack equipment"},
        new String[]{"Smart Home & IoT",   "Smart devices, cameras and IoT equipment"}
    );

    @Override
    public void run(ApplicationArguments args) {
        seedTaxRates();
        for (String[] entry : DEFAULT_CATEGORIES) {
            String name = entry[0];
            if (categoryRepository.findByName(name).isEmpty()) {
                categoryRepository.save(
                    Category.builder()
                        .name(name)
                        .description(entry[1])
                        .build()
                );
            }
        }
    }

    private void seedTaxRates() {
        seedTaxRate(TaxRateService.DEFAULT_VAT_CODE, "VAT 18%", BigDecimal.valueOf(0.18), "Standard VAT rate");
        seedTaxRate("REDUCED_10", "Reduced tax 10%", BigDecimal.valueOf(0.10), "Reduced tax rate");
        seedTaxRate("NO_VAT", "No VAT", BigDecimal.ZERO, "Tax exempt");
    }

    private void seedTaxRate(String code, String name, BigDecimal rate, String description) {
        if (taxRateRepository.findByCode(code).isEmpty()) {
            taxRateRepository.save(TaxRate.builder()
                    .code(code)
                    .name(name)
                    .rate(rate)
                    .description(description)
                    .active(true)
                    .build());
        }
    }
}
