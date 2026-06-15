package com.luztechnology.receipt.controller;

import com.lowagie.text.DocumentException;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.receipt.dto.ReceiptResponse;
import com.luztechnology.receipt.service.ReceiptService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/receipts")
@RequiredArgsConstructor
public class ReceiptController {

    private final ReceiptService receiptService;

    @GetMapping("/orders/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ReceiptResponse>> getReceipt(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success(receiptService.getReceipt(orderId)));
    }

    @GetMapping("/orders/{orderId}/pdf")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<byte[]> downloadReceiptPdf(@PathVariable UUID orderId) {
        try {
            byte[] pdfData = receiptService.generateReceiptPdf(orderId);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", "Receipt_" + orderId + ".pdf");

            return new ResponseEntity<>(pdfData, headers, HttpStatus.OK);
        } catch (DocumentException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
