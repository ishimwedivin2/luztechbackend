package com.luztechnology.analytics.service;

import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.luztechnology.analytics.entity.SalesReport;
import com.luztechnology.analytics.repository.SalesReportRepository;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final SalesReportRepository salesReportRepository;
    private final OrderService orderService;

    public byte[] generateSalesReportExcel(LocalDate startDate, LocalDate endDate) throws IOException {
        List<SalesReport> reports = salesReportRepository.findByReportDateBetween(startDate, endDate);

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Sales Report");

            // Header Row
            Row headerRow = sheet.createRow(0);
            headerRow.createCell(0).setCellValue("Date");
            headerRow.createCell(1).setCellValue("Total Orders");
            headerRow.createCell(2).setCellValue("Total Revenue");
            headerRow.createCell(3).setCellValue("Active Customers");
            headerRow.createCell(4).setCellValue("Period");

            // Data Rows
            int rowIdx = 1;
            for (SalesReport report : reports) {
                Row row = sheet.createRow(rowIdx++);
                row.createCell(0).setCellValue(report.getReportDate().toString());
                row.createCell(1).setCellValue(report.getTotalOrders());
                row.createCell(2).setCellValue(report.getTotalRevenue().doubleValue());
                row.createCell(3).setCellValue(report.getActiveCustomers());
                row.createCell(4).setCellValue(report.getReportPeriod());
            }

            workbook.write(out);
            return out.toByteArray();
        }
    }

    public byte[] generateInvoicePdf(UUID orderId) throws DocumentException {
        Order order = orderService.getOrderById(orderId);

        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);

        document.open();

        Font fontHeader = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Font fontParagraph = FontFactory.getFont(FontFactory.HELVETICA, 12);

        // Header
        Paragraph header = new Paragraph("Luz Technology Invoice", fontHeader);
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);
        
        document.add(new Paragraph(" ")); // Blank Line

        // Order Info
        document.add(new Paragraph("Order Reference: " + order.getOrderNumber(), fontParagraph));
        String customerName = order.getCustomer() == null
                ? "Walk-in customer"
                : order.getCustomer().getFirstName() + " " + order.getCustomer().getLastName();
        document.add(new Paragraph("Customer: " + customerName, fontParagraph));
        document.add(new Paragraph("Date: " + order.getCreatedAt().toLocalDate().toString(), fontParagraph));
        document.add(new Paragraph("Payment Status: " + order.getStatus().name(), fontParagraph));
        document.add(new Paragraph("Tax: $" + nullToZero(order.getTaxAmount()), fontParagraph));

        document.add(new Paragraph(" "));

        // Items Table
        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);

        table.addCell(getHeadCell("Item"));
        table.addCell(getHeadCell("Quantity"));
        table.addCell(getHeadCell("Unit Price"));
        table.addCell(getHeadCell("Subtotal"));

        for (OrderItem item : order.getOrderItems()) {
            table.addCell(new PdfPCell(new Phrase(item.getProduct().getName())));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getQuantity()))));
            table.addCell(new PdfPCell(new Phrase("$" + item.getUnitPrice())));
            table.addCell(new PdfPCell(new Phrase("$" + item.getSubTotal())));
        }

        document.add(table);

        document.add(new Paragraph(" "));
        Paragraph total = new Paragraph("Total: $" + order.getTotalAmount(), fontHeader);
        total.setAlignment(Element.ALIGN_RIGHT);
        document.add(total);

        document.close();
        return out.toByteArray();
    }

    private PdfPCell getHeadCell(String text) {
        PdfPCell cell = new PdfPCell(new Phrase(text, FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell;
    }

    private java.math.BigDecimal nullToZero(java.math.BigDecimal value) {
        return value == null ? java.math.BigDecimal.ZERO : value;
    }
}
