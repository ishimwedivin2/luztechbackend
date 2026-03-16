package com.luztechnology.product.service;

import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductBulkService {

    private final ProductRepository productRepository;

    @Transactional
    public List<Product> importProductsFromExcel(MultipartFile file) throws IOException {
        List<Product> products = new ArrayList<>();

        try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rows = sheet.iterator();

            // Skip header
            if (rows.hasNext()) {
                rows.next();
            }

            while (rows.hasNext()) {
                Row currentRow = rows.next();

                Product product = Product.builder()
                        .name(getCellValueAsString(currentRow.getCell(0)))
                        .description(getCellValueAsString(currentRow.getCell(1)))
                        .price(new BigDecimal(getCellValueAsString(currentRow.getCell(2))))
                        .sku(getCellValueAsString(currentRow.getCell(3)))
                        .status(ProductStatus.valueOf(getCellValueAsString(currentRow.getCell(4)).toUpperCase()))
                        .build();

                products.add(product);
            }
        }

        return productRepository.saveAll(products);
    }

    private String getCellValueAsString(Cell cell) {
        if (cell == null)
            return "";
        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> String.valueOf(cell.getNumericCellValue());
            case BOOLEAN -> String.valueOf(cell.getBooleanCellValue());
            default -> "";
        };
    }
}
