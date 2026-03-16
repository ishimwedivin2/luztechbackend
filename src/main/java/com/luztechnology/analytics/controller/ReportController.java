package com.luztechnology.analytics.controller;

import com.lowagie.text.DocumentException;
import com.luztechnology.analytics.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@RestController
@RequestMapping("/api/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @GetMapping("/sales")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<byte[]> downloadSalesReport(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        
        try {
            byte[] reportData = reportService.generateSalesReportExcel(startDate, endDate);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
            headers.setContentDispositionFormData("attachment", "Sales_Report_" + startDate + "_to_" + endDate + ".xlsx");

            return new ResponseEntity<>(reportData, headers, HttpStatus.OK);

        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/invoices/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'CUSTOMER')") // Ideally check if customer owns order
    public ResponseEntity<byte[]> downloadInvoice(@PathVariable UUID orderId) {
        try {
            byte[] pdfData = reportService.generateInvoicePdf(orderId);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", "Invoice_" + orderId + ".pdf");

            return new ResponseEntity<>(pdfData, headers, HttpStatus.OK);

        } catch (DocumentException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
