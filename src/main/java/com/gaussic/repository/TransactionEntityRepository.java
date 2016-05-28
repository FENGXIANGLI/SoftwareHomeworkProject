package com.gaussic.repository;

import com.gaussic.model.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

/**
 * Created by fengxiangli on 16/5/17.
 */
public interface TransactionEntityRepository extends JpaRepository<TransactionEntity, Integer> {
    @Transactional
    @Query("from TransactionEntity us where us.borrowName =:qAccount")
    public List<TransactionEntity> findAllByAccount(@Param("qAccount") String account);

    @Transactional
    @Query("from TransactionEntity us where us.id =:qId")
    public TransactionEntity findById(@Param("qId") Integer id);

    @Transactional
    @Query("from TransactionEntity us where us.borrowName =:qAccount and us.returnOrNot =:qReturnOrNot")
    public List<TransactionEntity> findAllSpecifiedTypeByAccountAndReturnOrNot(@Param("qAccount") String account,@Param("qReturnOrNot") Integer qReturnOrNot);

    @Modifying
    @Transactional
    @Query("update TransactionEntity us set us.borrowTimes=:qBorrowTimes, us.shouldReturnTime=:qShouldReturnTime where us.id=:qId")
    public void updateBorrowTimesById(@Param("qBorrowTimes") Integer borrowTimes, @Param("qShouldReturnTime")Date shouldReturnTime, @Param("qId") Integer id);

}
