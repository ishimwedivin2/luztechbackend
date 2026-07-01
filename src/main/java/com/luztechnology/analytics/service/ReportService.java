package com.luztechnology.analytics.service;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.product.entity.Product;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final OrderRepository orderRepository;
    private final OrderService orderService;
    private final InventoryService inventoryService;

    // ── Sales Report ─────────────────────────────────────────

    @Transactional(readOnly = true)
    public byte[] generateSalesReportExcel(LocalDate startDate, LocalDate endDate) throws IOException {
        LocalDateTime from = startDate.atStartOfDay();
        LocalDateTime to   = endDate.atTime(LocalTime.MAX);

        // Query all orders in the date range that are PAID or beyond (shipped, delivered)
        List<Order> orders = orderRepository.findAll().stream()
                .filter(o -> o.getCreatedAt() != null
                        && !o.getCreatedAt().isBefore(from)
                        && !o.getCreatedAt().isAfter(to)
                        && o.getStatus() != OrderStatus.CANCELLED
                        && o.getStatus() != OrderStatus.PENDING)
                .collect(Collectors.toList());

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {

            // ── Summary sheet ──────────────────────────────
            Sheet summary = workbook.createSheet("Summary");
            CellStyle headerStyle = boldStyle(workbook);

            Row h = summary.createRow(0);
            setCellBold(h, 0, "Metric", headerStyle);
            setCellBold(h, 1, "Value", headerStyle);

            BigDecimal totalRevenue = orders.stream()
                    .map(o -> o.getTotalAmount() != null ? o.getTotalAmount() : BigDecimal.ZERO)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            BigDecimal totalTax = orders.stream()
                    .map(o -> o.getTaxAmount() != null ? o.getTaxAmount() : BigDecimal.ZERO)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            long totalItems = orders.stream()
                    .flatMap(o -> o.getOrderItems() != null ? o.getOrderItems().stream() : java.util.stream.Stream.empty())
                    .mapToLong(OrderItem::getQuantity).sum();
            BigDecimal aov = orders.isEmpty() ? BigDecimal.ZERO
                    : totalRevenue.divide(BigDecimal.valueOf(orders.size()), 2, java.math.RoundingMode.HALF_UP);

            setRow(summary, 1,  "Period",         startDate + " to " + endDate);
            setRow(summary, 2,  "Total Orders",   String.valueOf(orders.size()));
            setRow(summary, 3,  "Total Revenue (RWF)", totalRevenue.toPlainString());
            setRow(summary, 4,  "Total Tax (RWF)", totalTax.toPlainString());
            setRow(summary, 5,  "Total Items Sold", String.valueOf(totalItems));
            setRow(summary, 6,  "Average Order Value (RWF)", aov.toPlainString());
            summary.autoSizeColumn(0);
            summary.autoSizeColumn(1);

            // ── Orders sheet ───────────────────────────────
            Sheet ordersSheet = workbook.createSheet("Orders");
            Row oh = ordersSheet.createRow(0);
            String[] orderCols = {"Order Number", "Date", "Customer", "Channel", "Status",
                    "Subtotal (RWF)", "Discount (RWF)", "Tax (RWF)", "Total (RWF)"};
            for (int i = 0; i < orderCols.length; i++) setCellBold(oh, i, orderCols[i], headerStyle);

            int rowIdx = 1;
            for (Order o : orders) {
                Row r = ordersSheet.createRow(rowIdx++);
                String customer = o.getCustomer() != null
                        ? o.getCustomer().getFirstName() + " " + o.getCustomer().getLastName()
                        : "Walk-in";
                r.createCell(0).setCellValue(o.getOrderNumber());
                r.createCell(1).setCellValue(o.getCreatedAt() != null ? o.getCreatedAt().toLocalDate().toString() : "");
                r.createCell(2).setCellValue(customer);
                r.createCell(3).setCellValue(o.getOrderChannel() != null ? o.getOrderChannel() : "ONLINE");
                r.createCell(4).setCellValue(o.getStatus().name());
                r.createCell(5).setCellValue(val(o.getSubTotalAmount()));
                r.createCell(6).setCellValue(val(o.getDiscountAmount()));
                r.createCell(7).setCellValue(val(o.getTaxAmount()));
                r.createCell(8).setCellValue(val(o.getTotalAmount()));
            }
            for (int i = 0; i < orderCols.length; i++) ordersSheet.autoSizeColumn(i);

            // ── Line items sheet ───────────────────────────
            Sheet itemsSheet = workbook.createSheet("Line Items");
            Row ih = itemsSheet.createRow(0);
            String[] itemCols = {"Order Number", "Date", "Product", "SKU", "Qty", "Unit Price (RWF)", "Subtotal (RWF)"};
            for (int i = 0; i < itemCols.length; i++) setCellBold(ih, i, itemCols[i], headerStyle);

            int iRow = 1;
            for (Order o : orders) {
                if (o.getOrderItems() == null) continue;
                for (OrderItem item : o.getOrderItems()) {
                    Row r = itemsSheet.createRow(iRow++);
                    r.createCell(0).setCellValue(o.getOrderNumber());
                    r.createCell(1).setCellValue(o.getCreatedAt() != null ? o.getCreatedAt().toLocalDate().toString() : "");
                    r.createCell(2).setCellValue(item.getProduct() != null ? item.getProduct().getName() : "—");
                    r.createCell(3).setCellValue(item.getProduct() != null ? item.getProduct().getSku() : "—");
                    r.createCell(4).setCellValue(item.getQuantity());
                    r.createCell(5).setCellValue(val(item.getUnitPrice()));
                    r.createCell(6).setCellValue(val(item.getSubTotal()));
                }
            }
            for (int i = 0; i < itemCols.length; i++) itemsSheet.autoSizeColumn(i);

            workbook.write(out);
            return out.toByteArray();
        }
    }

    // ── Inventory Report ─────────────────────────────────────

    @Transactional(readOnly = true)
    public byte[] generateInventoryReportExcel() throws IOException {
        List<InventoryItem> items = inventoryService.getAllItems();

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Inventory");
            CellStyle headerStyle = boldStyle(workbook);

            Row h = sheet.createRow(0);
            String[] cols = {"SKU", "Product Name", "Quantity", "Low Stock Threshold", "Location", "Status"};
            for (int i = 0; i < cols.length; i++) setCellBold(h, i, cols[i], headerStyle);

            int rowIdx = 1;
            for (InventoryItem item : items) {
                Row r = sheet.createRow(rowIdx++);
                int qty = item.getQuantity() != null ? item.getQuantity() : 0;
                int threshold = item.getLowStockThreshold() != null ? item.getLowStockThreshold() : 5;
                String status = qty == 0 ? "OUT OF STOCK" : qty <= threshold ? "LOW STOCK" : "OK";
                r.createCell(0).setCellValue(item.getSku() != null ? item.getSku() : "—");
                r.createCell(1).setCellValue(item.getProductName() != null ? item.getProductName() : "—");
                r.createCell(2).setCellValue(qty);
                r.createCell(3).setCellValue(threshold);
                r.createCell(4).setCellValue(item.getLocation() != null ? item.getLocation() : "—");
                r.createCell(5).setCellValue(status);
            }
            for (int i = 0; i < cols.length; i++) sheet.autoSizeColumn(i);

            // Summary row at the bottom
            sheet.createRow(rowIdx); // blank
            Row totals = sheet.createRow(rowIdx + 1);
            long totalQty = items.stream().mapToLong(i -> i.getQuantity() != null ? i.getQuantity() : 0).sum();
            long lowCount = items.stream().filter(i -> {
                int q = i.getQuantity() != null ? i.getQuantity() : 0;
                int t = i.getLowStockThreshold() != null ? i.getLowStockThreshold() : 5;
                return q > 0 && q <= t;
            }).count();
            long outCount = items.stream().filter(i -> i.getQuantity() == null || i.getQuantity() == 0).count();
            setCellBold(totals, 0, "TOTALS", headerStyle);
            totals.createCell(2).setCellValue(totalQty);
            totals.createCell(5).setCellValue("Low: " + lowCount + "  Out: " + outCount);

            workbook.write(out);
            return out.toByteArray();
        }
    }

    // ── Orders Report ────────────────────────────────────────

    @Transactional(readOnly = true)
    public byte[] generateOrdersReportExcel(LocalDate startDate, LocalDate endDate) throws IOException {
        LocalDateTime from = startDate.atStartOfDay();
        LocalDateTime to   = endDate.atTime(LocalTime.MAX);

        List<Order> orders = orderRepository.findAll().stream()
                .filter(o -> o.getCreatedAt() != null
                        && !o.getCreatedAt().isBefore(from)
                        && !o.getCreatedAt().isAfter(to))
                .collect(Collectors.toList());

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Orders");
            CellStyle headerStyle = boldStyle(workbook);

            Row h = sheet.createRow(0);
            String[] cols = {"Order Number", "Date", "Customer Name", "Customer Email",
                    "Channel", "Status", "Payment Method", "Subtotal (RWF)",
                    "Discount (RWF)", "Tax (RWF)", "Total (RWF)"};
            for (int i = 0; i < cols.length; i++) setCellBold(h, i, cols[i], headerStyle);

            int rowIdx = 1;
            for (Order o : orders) {
                Row r = sheet.createRow(rowIdx++);
                String name = o.getCustomer() != null
                        ? o.getCustomer().getFirstName() + " " + o.getCustomer().getLastName()
                        : "Walk-in";
                String email = o.getCustomer() != null ? o.getCustomer().getEmail() : "—";
                r.createCell(0).setCellValue(o.getOrderNumber());
                r.createCell(1).setCellValue(o.getCreatedAt() != null ? o.getCreatedAt().toLocalDate().toString() : "");
                r.createCell(2).setCellValue(name);
                r.createCell(3).setCellValue(email);
                r.createCell(4).setCellValue(o.getOrderChannel() != null ? o.getOrderChannel() : "ONLINE");
                r.createCell(5).setCellValue(o.getStatus().name());
                r.createCell(6).setCellValue(o.getPaymentMethod() != null ? o.getPaymentMethod() : "—");
                r.createCell(7).setCellValue(val(o.getSubTotalAmount()));
                r.createCell(8).setCellValue(val(o.getDiscountAmount()));
                r.createCell(9).setCellValue(val(o.getTaxAmount()));
                r.createCell(10).setCellValue(val(o.getTotalAmount()));
            }
            for (int i = 0; i < cols.length; i++) sheet.autoSizeColumn(i);

            workbook.write(out);
            return out.toByteArray();
        }
    }

    // ── Invoice PDF ──────────────────────────────────────────

    public byte[] generateInvoicePdf(UUID orderId) throws DocumentException {
        Order order = orderService.getOrderById(orderId);

        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);
        document.open();

        com.lowagie.text.Font fontHeader    = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        com.lowagie.text.Font fontParagraph = FontFactory.getFont(FontFactory.HELVETICA, 12);

        Paragraph header = new Paragraph("Luz Technology Invoice", fontHeader);
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);
        document.add(new Paragraph(" "));

        String customerName = order.getCustomer() == null
                ? "Walk-in customer"
                : order.getCustomer().getFirstName() + " " + order.getCustomer().getLastName();
        document.add(new Paragraph("Order Reference: " + order.getOrderNumber(), fontParagraph));
        document.add(new Paragraph("Customer: " + customerName, fontParagraph));
        document.add(new Paragraph("Date: " + order.getCreatedAt().toLocalDate(), fontParagraph));
        document.add(new Paragraph("Payment Status: " + order.getStatus().name(), fontParagraph));
        document.add(new Paragraph("Tax (RWF): " + nullToZero(order.getTaxAmount()), fontParagraph));
        document.add(new Paragraph(" "));

        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);
        table.addCell(getHeadCell("Item"));
        table.addCell(getHeadCell("Quantity"));
        table.addCell(getHeadCell("Unit Price (RWF)"));
        table.addCell(getHeadCell("Subtotal (RWF)"));

        for (OrderItem item : order.getOrderItems()) {
            table.addCell(new PdfPCell(new Phrase(item.getProduct().getName())));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getQuantity()))));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getUnitPrice()))));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getSubTotal()))));
        }
        document.add(table);
        document.add(new Paragraph(" "));

        Paragraph total = new Paragraph("Total: RWF " + order.getTotalAmount(), fontHeader);
        total.setAlignment(Element.ALIGN_RIGHT);
        document.add(total);

        document.close();
        return out.toByteArray();
    }

    @Transactional(readOnly = true)
    public byte[] generateDeliveryNotePdf(UUID orderId) throws DocumentException {
        Order order = orderService.getOrderById(orderId);

        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);
        document.open();

        com.lowagie.text.Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        com.lowagie.text.Font sectionFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        com.lowagie.text.Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
        com.lowagie.text.Font smallFont = FontFactory.getFont(FontFactory.HELVETICA, 9);

        addDeliveryNoteHeader(document, order, titleFont, bodyFont, smallFont);
        document.add(new Paragraph(" "));

        String customerName = order.getCustomer() == null
                ? "Walk-in customer"
                : order.getCustomer().getFirstName() + " " + order.getCustomer().getLastName();
        String customerEmail = order.getCustomer() != null ? order.getCustomer().getEmail() : "-";
        String customerPhone = firstNonBlank(order.getDeliveryPhoneNumber(),
                order.getCustomer() != null ? order.getCustomer().getPhoneNumber() : null,
                "-");

        document.add(new Paragraph("Order", sectionFont));
        document.add(new Paragraph("Order Number: " + safe(order.getOrderNumber()), bodyFont));
        document.add(new Paragraph("Order Date: " + (order.getCreatedAt() != null ? order.getCreatedAt().toLocalDate() : "-"), bodyFont));
        document.add(new Paragraph("Status: " + (order.getStatus() != null ? order.getStatus().name() : "-"), bodyFont));
        document.add(new Paragraph(" "));

        document.add(new Paragraph("Customer", sectionFont));
        document.add(new Paragraph("Name: " + customerName, bodyFont));
        document.add(new Paragraph("Phone: " + customerPhone, bodyFont));
        document.add(new Paragraph("Email: " + customerEmail, bodyFont));
        document.add(new Paragraph(" "));

        document.add(new Paragraph("Delivery Address", sectionFont));
        document.add(new Paragraph("Full Delivery Address: " + deliveryAddress(order), sectionFont));
        document.add(new Paragraph("Province: " + valueOrDash(order.getShippingProvince()), bodyFont));
        document.add(new Paragraph("District: " + valueOrDash(order.getShippingDistrict()), bodyFont));
        document.add(new Paragraph("Sector: " + valueOrDash(order.getShippingSector()), bodyFont));
        document.add(new Paragraph("Cell: " + valueOrDash(order.getShippingCell()), bodyFont));
        document.add(new Paragraph("Village: " + valueOrDash(order.getShippingVillage()), bodyFont));
        document.add(new Paragraph("Landmark / Instructions: " + safe(order.getDeliveryInstructions()), bodyFont));
        document.add(new Paragraph(" "));

        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{4f, 2f, 1f, 2f});
        table.addCell(getHeadCell("Product"));
        table.addCell(getHeadCell("SKU"));
        table.addCell(getHeadCell("Qty"));
        table.addCell(getHeadCell("Checked"));

        for (OrderItem item : order.getOrderItems()) {
            Product product = item.getProduct();
            table.addCell(new PdfPCell(new Phrase(product != null ? product.getName() : "Item", bodyFont)));
            table.addCell(new PdfPCell(new Phrase(product != null ? safe(product.getSku()) : "-", bodyFont)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(item.getQuantity()), bodyFont)));
            table.addCell(new PdfPCell(new Phrase(" ", bodyFont)));
        }
        document.add(table);
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Prepared by: ____________________", bodyFont));
        document.add(new Paragraph("Delivered by: ____________________", bodyFont));
        document.add(new Paragraph("Customer signature: _______________", bodyFont));

        document.close();
        return out.toByteArray();
    }

    // ── Helpers ──────────────────────────────────────────────

    private CellStyle boldStyle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setBold(true);
        style.setFont(font);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return style;
    }

    private void setCellBold(Row row, int col, String value, CellStyle style) {
        Cell cell = row.createCell(col);
        cell.setCellValue(value);
        cell.setCellStyle(style);
    }

    private void setRow(Sheet sheet, int rowNum, String label, String value) {
        Row r = sheet.createRow(rowNum);
        r.createCell(0).setCellValue(label);
        r.createCell(1).setCellValue(value);
    }

    private double val(BigDecimal bd) {
        return bd != null ? bd.doubleValue() : 0.0;
    }

    private BigDecimal nullToZero(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }

    private PdfPCell getHeadCell(String text) {
        PdfPCell cell = new PdfPCell(new Phrase(text,
                FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        return cell;
    }

    private String safe(String value) {
        return value == null || value.isBlank() ? "-" : value;
    }

    private String valueOrDash(String value) {
        return value == null || value.isBlank() ? "-" : value;
    }

    private String deliveryAddress(Order order) {
        String structured = java.util.stream.Stream.of(
                        order.getShippingVillage(),
                        order.getShippingCell(),
                        order.getShippingSector(),
                        order.getShippingDistrict(),
                        order.getShippingProvince())
                .filter(value -> value != null && !value.isBlank())
                .collect(java.util.stream.Collectors.joining(", "));
        if (!structured.isBlank()) return structured;
        return safe(order.getShippingAddress());
    }

    private String firstNonBlank(String... values) {
        if (values == null) return "-";
        for (String value : values) {
            if (value != null && !value.isBlank()) return value;
        }
        return "-";
    }

    private void addDeliveryNoteHeader(
            Document document,
            Order order,
            com.lowagie.text.Font titleFont,
            com.lowagie.text.Font bodyFont,
            com.lowagie.text.Font smallFont) throws DocumentException {
        PdfPTable headerTable = new PdfPTable(2);
        headerTable.setWidthPercentage(100);
        headerTable.setWidths(new float[]{1.2f, 4.8f});

        PdfPCell logoCell = new PdfPCell();
        logoCell.setBorder(PdfPCell.NO_BORDER);
        logoCell.setPadding(0);
        logoCell.setPaddingRight(14);
        Image logo = loadLogo();
        if (logo != null) {
            logo.scaleToFit(72f, 72f);
            logoCell.addElement(logo);
        } else {
            logoCell.addElement(new Paragraph("Luz Technology", bodyFont));
        }
        headerTable.addCell(logoCell);

        PdfPCell titleCell = new PdfPCell();
        titleCell.setBorder(PdfPCell.NO_BORDER);
        titleCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        titleCell.setPadding(0);

        Paragraph company = new Paragraph("Luz Technology", titleFont);
        company.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(company);

        Paragraph subtitle = new Paragraph("Delivery Note", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 13));
        subtitle.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(subtitle);

        Paragraph tagline = new Paragraph("Go Digital Securely", smallFont);
        tagline.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(tagline);

        Paragraph orderRef = new Paragraph("Order: " + safe(order.getOrderNumber()), bodyFont);
        orderRef.setAlignment(Element.ALIGN_RIGHT);
        titleCell.addElement(orderRef);

        headerTable.addCell(titleCell);
        document.add(headerTable);

        PdfPTable divider = new PdfPTable(1);
        divider.setWidthPercentage(100);
        PdfPCell line = new PdfPCell(new Phrase(" "));
        line.setBorder(PdfPCell.BOTTOM);
        line.setBorderWidthBottom(1f);
        line.setBorderColorBottom(java.awt.Color.LIGHT_GRAY);
        line.setPaddingTop(6);
        line.setPaddingBottom(6);
        divider.addCell(line);
        document.add(divider);
    }

    private Image loadLogo() {
        for (String candidate : List.of(
                "../ecommerce/public/logo.jpg",
                "ecommerce/public/logo.jpg",
                "src/main/resources/static/logo.jpg")) {
            try {
                Path path = Paths.get(candidate).toAbsolutePath().normalize();
                if (Files.exists(path) && Files.isRegularFile(path)) {
                    return Image.getInstance(path.toString());
                }
            } catch (Exception ignored) {
                // Keep delivery note generation working even if the logo cannot be read.
            }
        }
        return null;
    }
}
