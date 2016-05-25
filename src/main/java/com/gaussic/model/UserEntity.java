package com.gaussic.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by fengxiangli on 16/5/25.
 */
@Entity
@Table(name = "user", schema = "", catalog = "springdemo")
public class UserEntity {
    private int id;
    private String nickname;
    private String password;
    private String firstName;
    private String lastName;
    private String account;
    private Integer userGender;
    private String department;
    private Integer studentId;
    private Float debt;
    private Integer allowAmountBookNum;
    private Integer borrowBookNum;
    private Date birthday;
    private Integer defaultTimes;
    private Integer defaultTotalDay;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nickname", nullable = true, insertable = true, updatable = true, length = 45)
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Basic
    @Column(name = "password", nullable = true, insertable = true, updatable = true, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "first_name", nullable = true, insertable = true, updatable = true, length = 45)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "last_name", nullable = true, insertable = true, updatable = true, length = 45)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Basic
    @Column(name = "account", nullable = true, insertable = true, updatable = true, length = 45)
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Basic
    @Column(name = "userGender", nullable = true, insertable = true, updatable = true)
    public Integer getUserGender() {
        return userGender;
    }

    public void setUserGender(Integer userGender) {
        this.userGender = userGender;
    }

    @Basic
    @Column(name = "department", nullable = true, insertable = true, updatable = true, length = 45)
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Basic
    @Column(name = "studentId", nullable = true, insertable = true, updatable = true)
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    @Basic
    @Column(name = "debt", nullable = true, insertable = true, updatable = true, precision = 0)
    public Float getDebt() {
        return debt;
    }

    public void setDebt(Float debt) {
        this.debt = debt;
    }

    @Basic
    @Column(name = "allowAmountBookNum", nullable = true, insertable = true, updatable = true)
    public Integer getAllowAmountBookNum() {
        return allowAmountBookNum;
    }

    public void setAllowAmountBookNum(Integer allowAmountBookNum) {
        this.allowAmountBookNum = allowAmountBookNum;
    }

    @Basic
    @Column(name = "borrowBookNum", nullable = true, insertable = true, updatable = true)
    public Integer getBorrowBookNum() {
        return borrowBookNum;
    }

    public void setBorrowBookNum(Integer borrowBookNum) {
        this.borrowBookNum = borrowBookNum;
    }

    @Basic
    @Column(name = "birthday", nullable = true, insertable = true, updatable = true)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Basic
    @Column(name = "defaultTimes", nullable = true, insertable = true, updatable = true)
    public Integer getDefaultTimes() {
        return defaultTimes;
    }

    public void setDefaultTimes(Integer defaultTimes) {
        this.defaultTimes = defaultTimes;
    }

    @Basic
    @Column(name = "defaultTotalDay", nullable = true, insertable = true, updatable = true)
    public Integer getDefaultTotalDay() {
        return defaultTotalDay;
    }

    public void setDefaultTotalDay(Integer defaultTotalDay) {
        this.defaultTotalDay = defaultTotalDay;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (id != that.id) return false;
        if (nickname != null ? !nickname.equals(that.nickname) : that.nickname != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
        if (account != null ? !account.equals(that.account) : that.account != null) return false;
        if (userGender != null ? !userGender.equals(that.userGender) : that.userGender != null) return false;
        if (department != null ? !department.equals(that.department) : that.department != null) return false;
        if (studentId != null ? !studentId.equals(that.studentId) : that.studentId != null) return false;
        if (debt != null ? !debt.equals(that.debt) : that.debt != null) return false;
        if (allowAmountBookNum != null ? !allowAmountBookNum.equals(that.allowAmountBookNum) : that.allowAmountBookNum != null)
            return false;
        if (borrowBookNum != null ? !borrowBookNum.equals(that.borrowBookNum) : that.borrowBookNum != null)
            return false;
        if (birthday != null ? !birthday.equals(that.birthday) : that.birthday != null) return false;
        if (defaultTimes != null ? !defaultTimes.equals(that.defaultTimes) : that.defaultTimes != null) return false;
        if (defaultTotalDay != null ? !defaultTotalDay.equals(that.defaultTotalDay) : that.defaultTotalDay != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nickname != null ? nickname.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (account != null ? account.hashCode() : 0);
        result = 31 * result + (userGender != null ? userGender.hashCode() : 0);
        result = 31 * result + (department != null ? department.hashCode() : 0);
        result = 31 * result + (studentId != null ? studentId.hashCode() : 0);
        result = 31 * result + (debt != null ? debt.hashCode() : 0);
        result = 31 * result + (allowAmountBookNum != null ? allowAmountBookNum.hashCode() : 0);
        result = 31 * result + (borrowBookNum != null ? borrowBookNum.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        result = 31 * result + (defaultTimes != null ? defaultTimes.hashCode() : 0);
        result = 31 * result + (defaultTotalDay != null ? defaultTotalDay.hashCode() : 0);
        return result;
    }
}
