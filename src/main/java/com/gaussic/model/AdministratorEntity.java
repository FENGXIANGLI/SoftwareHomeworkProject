package com.gaussic.model;

import javax.persistence.*;

/**
 * Created by fengxiangli on 16/5/25.
 */
@Entity
@Table(name = "administrator", schema = "", catalog = "springdemo")
public class AdministratorEntity {
    private int idadminstrator;
    private String account;
    private String password;
    private Integer type;

    @Id
    @Column(name = "idadminstrator", nullable = false, insertable = true, updatable = true)
    public int getIdadminstrator() {
        return idadminstrator;
    }

    public void setIdadminstrator(int idadminstrator) {
        this.idadminstrator = idadminstrator;
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
    @Column(name = "password", nullable = true, insertable = true, updatable = true, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "type", nullable = true, insertable = true, updatable = true)
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdministratorEntity that = (AdministratorEntity) o;

        if (idadminstrator != that.idadminstrator) return false;
        if (account != null ? !account.equals(that.account) : that.account != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idadminstrator;
        result = 31 * result + (account != null ? account.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
