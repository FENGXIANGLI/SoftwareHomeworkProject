package com.gaussic.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by fengxiangli on 16/5/25.
 */
@Entity
@Table(name = "transaction", schema = "", catalog = "springdemo")
public class TransactionEntity {
    private int id;
    private Integer userId;
    private Integer bookId;
    private Timestamp borrowTime;
    private Timestamp shouldReturnTime;
    private Integer borrowTimes;
    private Integer returnOrNot;
    private String returnTime;
    private String bookName;
    private String borrowName;
    private String location;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userId", nullable = true, insertable = true, updatable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "bookId", nullable = true, insertable = true, updatable = true)
    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    @Basic
    @Column(name = "borrowTime", nullable = true, insertable = true, updatable = true)
    public Timestamp getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Timestamp borrowTime) {
        this.borrowTime = borrowTime;
    }

    @Basic
    @Column(name = "shouldReturnTime", nullable = true, insertable = true, updatable = true)
    public Timestamp getShouldReturnTime() {
        return shouldReturnTime;
    }

    public void setShouldReturnTime(Timestamp shouldReturnTime) {
        this.shouldReturnTime = shouldReturnTime;
    }

    @Basic
    @Column(name = "borrowTimes", nullable = true, insertable = true, updatable = true)
    public Integer getBorrowTimes() {
        return borrowTimes;
    }

    public void setBorrowTimes(Integer borrowTimes) {
        this.borrowTimes = borrowTimes;
    }

    @Basic
    @Column(name = "returnOrNot", nullable = true, insertable = true, updatable = true)
    public Integer getReturnOrNot() {
        return returnOrNot;
    }

    public void setReturnOrNot(Integer returnOrNot) {
        this.returnOrNot = returnOrNot;
    }

    @Basic
    @Column(name = "returnTime", nullable = true, insertable = true, updatable = true, length = 45)
    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    @Basic
    @Column(name = "bookName", nullable = true, insertable = true, updatable = true, length = 45)
    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    @Basic
    @Column(name = "borrowName", nullable = true, insertable = true, updatable = true, length = 45)
    public String getBorrowName() {
        return borrowName;
    }

    public void setBorrowName(String borrowName) {
        this.borrowName = borrowName;
    }

    @Basic
    @Column(name = "location", nullable = true, insertable = true, updatable = true, length = 45)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TransactionEntity that = (TransactionEntity) o;

        if (id != that.id) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (bookId != null ? !bookId.equals(that.bookId) : that.bookId != null) return false;
        if (borrowTime != null ? !borrowTime.equals(that.borrowTime) : that.borrowTime != null) return false;
        if (shouldReturnTime != null ? !shouldReturnTime.equals(that.shouldReturnTime) : that.shouldReturnTime != null)
            return false;
        if (borrowTimes != null ? !borrowTimes.equals(that.borrowTimes) : that.borrowTimes != null) return false;
        if (returnOrNot != null ? !returnOrNot.equals(that.returnOrNot) : that.returnOrNot != null) return false;
        if (returnTime != null ? !returnTime.equals(that.returnTime) : that.returnTime != null) return false;
        if (bookName != null ? !bookName.equals(that.bookName) : that.bookName != null) return false;
        if (borrowName != null ? !borrowName.equals(that.borrowName) : that.borrowName != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (bookId != null ? bookId.hashCode() : 0);
        result = 31 * result + (borrowTime != null ? borrowTime.hashCode() : 0);
        result = 31 * result + (shouldReturnTime != null ? shouldReturnTime.hashCode() : 0);
        result = 31 * result + (borrowTimes != null ? borrowTimes.hashCode() : 0);
        result = 31 * result + (returnOrNot != null ? returnOrNot.hashCode() : 0);
        result = 31 * result + (returnTime != null ? returnTime.hashCode() : 0);
        result = 31 * result + (bookName != null ? bookName.hashCode() : 0);
        result = 31 * result + (borrowName != null ? borrowName.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        return result;
    }
}
