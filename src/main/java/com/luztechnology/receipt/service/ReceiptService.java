package com.luztechnology.receipt.service;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.receipt.dto.ReceiptItemResponse;
import com.luztechnology.receipt.dto.ReceiptResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReceiptService {

    private final OrderService orderService;

    @Transactional(readOnly = true)
    public ReceiptResponse getReceipt(UUID orderId) {
        return toReceipt(orderService.getOrderById(orderId));
    }

    @Transactional(readOnly = true)
    public byte[] generateReceiptPdf(UUID orderId) throws DocumentException {
        ReceiptResponse receipt = getReceipt(orderId);

        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);

        document.open();

        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Font sectionFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA, 11);

        Paragraph header = new Paragraph("Luz Technology Receipt", headerFont);
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);
        document.add(new Paragraph(" "));

        document.add(new Paragraph("Receipt No: " + receipt.getReceiptNumber(), bodyFont));
        document.add(new Paragraph("Order No: " + receipt.getOrderNumber(), bodyFont));
        document.add(new Paragraph("Channel: " + receipt.getOrderChannel(), bodyFont));
        document.add(new Paragraph("Customer: " + receipt.getCustomerName(), bodyFont));
        if (receipt.getCashierEmail() != null) {
            document.add(new Paragraph("Cashier: " + receipt.getCashierEmail(), bodyFont));
        }
        document.add(new Paragraph("Payment: " + receipt.getPaymentMethod(), bodyFont));
        document.add(new Paragraph("Issued: " + receipt.getIssuedAt(), bodyFont));
        document.add(new Paragraph(" "));

        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);
        table.addCell(headCell("Item"));
        table.addCell(headCell("Qty"));
        table.addCell(headCell("Unit Price"));
        table.addCell(headCell("Subtotal"));

        for (ReceiptItemResponse item : receipt.getItems()) {
            table.addCell(new PdfPCell(new Phrase(item.getProductName(), bodyFont)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getQuantity()), bodyFont)));
            table.addCell(new PdfPCell(new Phrase(formatAmount(item.getUnitPrice()), bodyFont)));
            table.addCell(new PdfPCell(new Phrase(formatAmount(item.getSubTotal()), bodyFont)));
        }

        document.add(table);
        document.add(new Paragraph(" "));
        addAmountLine(document, "Subtotal: ", receipt.getSubTotalAmount(), bodyFont);
        if (receipt.getDiscountAmount() != null && receipt.getDiscountAmount().compareTo(BigDecimal.ZERO) > 0) {
            String discountLabel = receipt.getCouponCode() != null
                    ? "Discount (" + receipt.getCouponCode() + "): "
                    : "Discount: ";
            addAmountLine(document, discountLabel, receipt.getDiscountAmount().negate(), bodyFont);
        }
        BigDecimal taxRatePct = receipt.getTaxRate() != null
                ? receipt.getTaxRate().multiply(BigDecimal.valueOf(100)).setScale(0, RoundingMode.HALF_UP)
                : BigDecimal.valueOf(18);
        addAmountLine(document, "Tax (" + taxRatePct.toPlainString() + "%): ", receipt.getTaxAmount(), bodyFont);
        addAmountLine(document, "Total Paid: ", receipt.getTotalAmount(), headerFont);

        document.close();
        return out.toByteArray();
    }

    private ReceiptResponse toReceipt(Order order) {
        List<ReceiptItemResponse> items = order.getOrderItems().stream()
                .map(this::toReceiptItem)
                .toList();

        return ReceiptResponse.builder()
                .orderId(order.getId())
                .receiptNumber("RCPT-" + order.getOrderNumber())
                .orderNumber(order.getOrderNumber())
                .orderChannel(order.getOrderChannel())
                .customerName(customerName(order))
                .cashierEmail(order.getCashier() == null ? null : order.getCashier().getEmail())
                .paymentMethod(order.getPaymentMethod())
                .paymentReference(order.getPaymentReference())
                .subTotalAmount(nullToZero(order.getSubTotalAmount()))
                .discountAmount(nullToZero(order.getDiscountAmount()))
                .couponCode(order.getCouponCode())
                .taxRate(nullToZero(order.getTaxRate()))
                .taxAmount(nullToZero(order.getTaxAmount()))
                .totalAmount(order.getTotalAmount())
                .issuedAt(order.getCreatedAt())
                .items(items)
                .build();
    }

    private ReceiptItemResponse toReceiptItem(OrderItem item) {
        return ReceiptItemResponse.builder()
                .productId(item.getProduct().getId())
                .productName(item.getProduct().getName())
                .sku(item.getProduct().getSku())
                .quantity(item.getQuantity())
                .unitPrice(item.getUnitPrice())
                .subTotal(item.getSubTotal())
                .build();
    }

    private String customerName(Order order) {
        if (order.getCustomer() == null) {
            return "Walk-in customer";
        }
        return order.getCustomer().getFirstName() + " " + order.getCustomer().getLastName();
    }

    private BigDecimal nullToZero(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }

    private PdfPCell headCell(String text) {
        PdfPCell cell = new PdfPCell(new Phrase(text, FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell;
    }

    private String formatAmount(BigDecimal amount) {
        if (amount == null) return "0";
        return "RWF " + String.format("%,.0f", amount);
    }

    private void addAmountLine(Document document, String label, BigDecimal amount, Font font) throws DocumentException {
        Paragraph paragraph = new Paragraph(label + formatAmount(amount), font);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        document.add(paragraph);
    }
}
