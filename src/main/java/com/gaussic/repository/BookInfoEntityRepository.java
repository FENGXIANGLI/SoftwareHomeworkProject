package com.gaussic.repository;

import com.gaussic.model.BookInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fengxiangli on 16/5/17.
 */
public interface BookInfoEntityRepository extends JpaRepository<BookInfoEntity,Integer> {
    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update BookInfoEntity us set  us.bookName =:qBookName, us.isbn =:qIsbn, us.author =:qAuthor, us.press =:qPress, us.summary =:qSummary, us.location =:qLocation, us.price =:qPrice, us.atLibOrNot =:qAtLibOrNot,us.idBorrowed=:qIdBorrowed, us.bookNumber=:qBookNumber where us.id =:qId")
    public void updateBookInfo(@Param("qBookName") String bookName, @Param("qIsbn") Integer isbn, @Param("qAuthor") String author , @Param("qPress") String press,@Param("qSummary") String summary,@Param("qLocation") String location,@Param("qPrice") Double price,@Param("qAtLibOrNot") Integer atLibOrNot,@Param("qIdBorrowed") Integer idBorrowed,@Param("qBookNumber") Integer bookNumber,@Param("qId") Integer id);


//    SELECT * FROM springdemo.bookInfo where bookInfo.id = 11111;
    @Transactional
    @Query("from BookInfoEntity us where us.idBorrowed =:qIdBorrowed")
    public List<BookInfoEntity> findByIdBorrowed(@Param("qIdBorrowed") Integer idBorrowed);

}
