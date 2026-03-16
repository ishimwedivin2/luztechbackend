package com.luztechnology.analytics.repository;

import com.luztechnology.analytics.entity.SalesReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface SalesReportRepository extends JpaRepository<SalesReport, UUID> {
    List<SalesReport> findByReportDateBetween(LocalDate startDate, LocalDate endDate);
    
    @Query("SELECT SUM(s.totalRevenue) FROM SalesReport s WHERE s.reportDate BETWEEN :startDate AND :endDate")
    Double calculateTotalRevenueBetween(LocalDate startDate, LocalDate endDate);
}
