package com.luztechnology.finance.service;

import com.luztechnology.finance.dto.TaxSummaryResponse;
import com.luztechnology.finance.entity.TaxRecord;
import com.luztechnology.finance.repository.TaxRecordRepository;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TaxService {

    private static final String SALES_TAX_TYPE = "SALES_TAX";
    private static final String PENDING_STATUS = "PENDING";

    private final TaxRecordRepository taxRecordRepository;

    @Value("${app.tax.sales-rate:0.18}")
    private BigDecimal salesTaxRate;

    public BigDecimal getTaxRate() {
        return salesTaxRate;
    }

    public BigDecimal calculateTax(BigDecimal taxableAmount) {
        if (taxableAmount == null) {
            return BigDecimal.ZERO;
        }
        return taxableAmount.multiply(salesTaxRate).setScale(2, RoundingMode.HALF_UP);
    }

    @Transactional
    public TaxRecord recordTaxForPaidOrder(Order order) {
        if (order.getStatus() != OrderStatus.PAID) {
            throw new IllegalStateException("Tax can only be recorded for paid orders");
        }

        if (order.getOrderItems() != null && order.getOrderItems().stream().anyMatch(item -> item.getAppliedTaxRate() != null)) {
            TaxRecord last = null;
            Map<BigDecimal, List<com.luztechnology.order.entity.OrderItem>> byRate = order.getOrderItems().stream()
                    .collect(Collectors.groupingBy(item -> item.getAppliedTaxRate() == null ? BigDecimal.ZERO : item.getAppliedTaxRate()));
            for (Map.Entry<BigDecimal, List<com.luztechnology.order.entity.OrderItem>> entry : byRate.entrySet()) {
                last = recordTaxGroup(order, entry.getKey(), entry.getValue());
            }
            return last;
        }

        String referenceId = order.getOrderNumber();
        TaxRecord taxRecord = taxRecordRepository.findByReferenceIdAndTaxType(referenceId, SALES_TAX_TYPE)
                .orElseGet(TaxRecord::new);

        LocalDate taxDate = order.getCreatedAt() == null ? LocalDate.now() : order.getCreatedAt().toLocalDate();
        taxRecord.setTaxType(SALES_TAX_TYPE);
        taxRecord.setTaxableAmount(safe(order.getSubTotalAmount()).subtract(safe(order.getDiscountAmount())).max(BigDecimal.ZERO));
        taxRecord.setTaxRate(order.getTaxRate());
        taxRecord.setAmount(order.getTaxAmount());
        taxRecord.setOrderId(order.getId());
        taxRecord.setOrderNumber(order.getOrderNumber());
        taxRecord.setTaxDate(taxDate);
        taxRecord.setFilingDate(taxDate.withDayOfMonth(taxDate.lengthOfMonth()));
        taxRecord.setStatus(PENDING_STATUS);
        taxRecord.setReferenceId(referenceId);

        return taxRecordRepository.save(taxRecord);
    }

    private TaxRecord recordTaxGroup(
            Order order,
            BigDecimal taxRate,
            List<com.luztechnology.order.entity.OrderItem> items) {
        String rateLabel = taxRate.multiply(BigDecimal.valueOf(100)).setScale(0, RoundingMode.HALF_UP).toPlainString();
        String taxType = SALES_TAX_TYPE + "_" + rateLabel;
        String referenceId = order.getOrderNumber() + "-" + rateLabel;
        TaxRecord taxRecord = taxRecordRepository.findByReferenceIdAndTaxType(referenceId, taxType)
                .orElseGet(TaxRecord::new);
        LocalDate taxDate = order.getCreatedAt() == null ? LocalDate.now() : order.getCreatedAt().toLocalDate();
        BigDecimal taxableAmount = items.stream()
                .map(item -> safe(item.getSubTotal()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxAmount = items.stream()
                .map(item -> safe(item.getLineTaxAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        taxRecord.setTaxType(taxType);
        taxRecord.setTaxableAmount(taxableAmount);
        taxRecord.setTaxRate(taxRate);
        taxRecord.setAmount(taxAmount);
        taxRecord.setOrderId(order.getId());
        taxRecord.setOrderNumber(order.getOrderNumber());
        taxRecord.setTaxDate(taxDate);
        taxRecord.setFilingDate(taxDate.withDayOfMonth(taxDate.lengthOfMonth()));
        taxRecord.setStatus(PENDING_STATUS);
        taxRecord.setReferenceId(referenceId);
        return taxRecordRepository.save(taxRecord);
    }

    @Transactional(readOnly = true)
    public List<TaxRecord> getTaxRecords(LocalDate startDate, LocalDate endDate) {
        return taxRecordRepository.findByTaxDateBetween(startDate, endDate);
    }

    @Transactional(readOnly = true)
    public TaxSummaryResponse getTaxSummary(LocalDate startDate, LocalDate endDate) {
        List<TaxRecord> records = getTaxRecords(startDate, endDate);
        BigDecimal taxableSales = records.stream()
                .map(record -> record.getTaxableAmount() == null ? BigDecimal.ZERO : record.getTaxableAmount())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxCollected = records.stream()
                .map(TaxRecord::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return TaxSummaryResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .taxableSales(taxableSales)
                .taxCollected(taxCollected)
                .totalRecords(records.size())
                .status(PENDING_STATUS)
                .build();
    }

    @Transactional(readOnly = true)
    public byte[] exportTaxRecordsCsv(LocalDate startDate, LocalDate endDate) {
        StringBuilder csv = new StringBuilder();
        csv.append("Tax Type,Order Number,Reference ID,Tax Date,Filing Date,Taxable Amount,Tax Rate,Tax Amount,Status\n");
        for (TaxRecord record : getTaxRecords(startDate, endDate)) {
            csv.append(csvValue(record.getTaxType())).append(',')
                    .append(csvValue(record.getOrderNumber())).append(',')
                    .append(csvValue(record.getReferenceId())).append(',')
                    .append(csvValue(record.getTaxDate())).append(',')
                    .append(csvValue(record.getFilingDate())).append(',')
                    .append(csvValue(record.getTaxableAmount())).append(',')
                    .append(csvValue(record.getTaxRate())).append(',')
                    .append(csvValue(record.getAmount())).append(',')
                    .append(csvValue(record.getStatus())).append('\n');
        }
        return csv.toString().getBytes(StandardCharsets.UTF_8);
    }

    private String csvValue(Object value) {
        if (value == null) {
            return "";
        }
        String text = value.toString();
        if (text.contains(",") || text.contains("\"") || text.contains("\n")) {
            return "\"" + text.replace("\"", "\"\"") + "\"";
        }
        return text;
    }

    private BigDecimal safe(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }
}
