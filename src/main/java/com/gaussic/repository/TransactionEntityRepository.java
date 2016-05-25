package com.gaussic.repository;

import com.gaussic.model.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by fengxiangli on 16/5/17.
 */
public interface TransactionEntityRepository extends JpaRepository<TransactionEntity, Integer> {
}
