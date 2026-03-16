package com.luztechnology.inventory.scheduler;

import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.notification.service.MailService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequiredArgsConstructor
public class InventoryAlertScheduler {

    private static final Logger logger = LoggerFactory.getLogger(InventoryAlertScheduler.class);
    private final InventoryService inventoryService;
    private final MailService mailService;
    private final com.luztechnology.inventory.service.ProcurementService procurementService;

    // Run every day at 8 AM
    @Scheduled(cron = "0 0 8 * * *")
    public void checkLowStockAndNotify() {
        logger.info("Starting scheduled low stock check...");
        List<InventoryItem> lowStockItems = inventoryService.getLowStockItems();

        if (!lowStockItems.isEmpty()) {
            Map<String, Object> model = new HashMap<>();
            model.put("items", lowStockItems);
            model.put("count", lowStockItems.size());

            // 1. Create Draft Procurement Orders automatically
            for (InventoryItem item : lowStockItems) {
                // Reorder quantity: 50 defaults for now, or use logic based on threshold.
                Integer reorderQty = item.getLowStockThreshold() * 2;
                procurementService.createDraftOrder(item, reorderQty);
                logger.info("Automatic draft Procurement Order created for SKU: {}", item.getSku());
            }

            // 2. Notify to: admin@luztech.com (from DatabaseSeeder)
            mailService.sendEmail(
                    "admin@luztech.com",
                    "Low Stock Alert & Draft PO Created",
                    "inventory-alert",
                    model);
            logger.info("Low stock notification sent for {} items.", lowStockItems.size());
        } else {
            logger.info("No low stock items found.");
        }
    }
}
