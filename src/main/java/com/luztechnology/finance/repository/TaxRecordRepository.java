package com.luztechnology.finance.repository;

import com.luztechnology.finance.entity.TaxRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TaxRecordRepository extends JpaRepository<TaxRecord, UUID> {
    Optional<TaxRecord> findByReferenceIdAndTaxType(String referenceId, String taxType);

    List<TaxRecord> findByTaxDateBetween(LocalDate startDate, LocalDate endDate);
}
