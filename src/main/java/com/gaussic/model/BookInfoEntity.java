package com.gaussic.model;

import javax.persistence.*;

/**
 * Created by fengxiangli on 16/5/25.
 */
@Entity
@Table(name = "bookInfo", schema = "", catalog = "springdemo")
public class BookInfoEntity {
    private int id;
    private String bookName;
    private Integer isbn;
    private String author;
    private String press;
    private String summary;
    private String location;
    private Double price;
    private Integer atLibOrNot;
    private Integer idBorrowed;
    private Integer bookNumber;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "ISBN", nullable = true, insertable = true, updatable = true)
    public Integer getIsbn() {
        return isbn;
    }

    public void setIsbn(Integer isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "author", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "press", nullable = true, insertable = true, updatable = true, length = 45)
    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    @Basic
    @Column(name = "summary", nullable = true, insertable = true, updatable = true, length = 45)
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Basic
    @Column(name = "location", nullable = true, insertable = true, updatable = true, length = 45)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "price", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "atLibOrNot", nullable = true, insertable = true, updatable = true)
    public Integer getAtLibOrNot() {
        return atLibOrNot;
    }

    public void setAtLibOrNot(Integer atLibOrNot) {
        this.atLibOrNot = atLibOrNot;
    }

    @Basic
    @Column(name = "idBorrowed", nullable = true, insertable = true, updatable = true)
    public Integer getIdBorrowed() {
        return idBorrowed;
    }

    public void setIdBorrowed(Integer idBorrowed) {
        this.idBorrowed = idBorrowed;
    }

    @Basic
    @Column(name = "bookNumber", nullable = true, insertable = true, updatable = true)
    public Integer getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(Integer bookNumber) {
        this.bookNumber = bookNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BookInfoEntity that = (BookInfoEntity) o;

        if (id != that.id) return false;
        if (bookName != null ? !bookName.equals(that.bookName) : that.bookName != null) return false;
        if (isbn != null ? !isbn.equals(that.isbn) : that.isbn != null) return false;
        if (author != null ? !author.equals(that.author) : that.author != null) return false;
        if (press != null ? !press.equals(that.press) : that.press != null) return false;
        if (summary != null ? !summary.equals(that.summary) : that.summary != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (atLibOrNot != null ? !atLibOrNot.equals(that.atLibOrNot) : that.atLibOrNot != null) return false;
        if (idBorrowed != null ? !idBorrowed.equals(that.idBorrowed) : that.idBorrowed != null) return false;
        if (bookNumber != null ? !bookNumber.equals(that.bookNumber) : that.bookNumber != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (bookName != null ? bookName.hashCode() : 0);
        result = 31 * result + (isbn != null ? isbn.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (press != null ? press.hashCode() : 0);
        result = 31 * result + (summary != null ? summary.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (atLibOrNot != null ? atLibOrNot.hashCode() : 0);
        result = 31 * result + (idBorrowed != null ? idBorrowed.hashCode() : 0);
        result = 31 * result + (bookNumber != null ? bookNumber.hashCode() : 0);
        return result;
    }
}
