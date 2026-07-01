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

    private static final MediaType EXCEL =
            MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

    // ── Sales Report ─────────────────────────────────────────

    @GetMapping("/sales")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<byte[]> downloadSalesReport(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        try {
            byte[] data = reportService.generateSalesReportExcel(startDate, endDate);
            return ResponseEntity.ok()
                    .contentType(EXCEL)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "attachment; filename=\"Sales_Report_" + startDate + "_to_" + endDate + ".xlsx\"")
                    .body(data);
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    // ── Inventory Report ─────────────────────────────────────

    @GetMapping("/inventory")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<byte[]> downloadInventoryReport() {
        try {
            byte[] data = reportService.generateInventoryReportExcel();
            String filename = "Inventory_Report_" + LocalDate.now() + ".xlsx";
            return ResponseEntity.ok()
                    .contentType(EXCEL)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"")
                    .body(data);
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    // ── Orders Report ─────────────────────────────────────────

    @GetMapping("/orders")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<byte[]> downloadOrdersReport(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        try {
            byte[] data = reportService.generateOrdersReportExcel(startDate, endDate);
            return ResponseEntity.ok()
                    .contentType(EXCEL)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "attachment; filename=\"Orders_Report_" + startDate + "_to_" + endDate + ".xlsx\"")
                    .body(data);
        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    // ── Invoice PDF ──────────────────────────────────────────

    @GetMapping("/invoices/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'CUSTOMER')")
    public ResponseEntity<byte[]> downloadInvoice(@PathVariable UUID orderId) {
        try {
            byte[] pdfData = reportService.generateInvoicePdf(orderId);
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "attachment; filename=\"Invoice_" + orderId + ".pdf\"")
                    .body(pdfData);
        } catch (DocumentException e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/delivery-notes/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<byte[]> downloadDeliveryNote(@PathVariable UUID orderId) {
        try {
            byte[] pdfData = reportService.generateDeliveryNotePdf(orderId);
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "attachment; filename=\"Delivery_Note_" + orderId + ".pdf\"")
                    .body(pdfData);
        } catch (DocumentException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
