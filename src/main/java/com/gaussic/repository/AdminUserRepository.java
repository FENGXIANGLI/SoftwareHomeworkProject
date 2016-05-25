package com.gaussic.repository;

import com.gaussic.model.AdministratorEntity;
import com.sun.tracing.dtrace.Attributes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by fengxiangli on 16/5/17.
 */
public interface AdminUserRepository extends JpaRepository<AdministratorEntity,Integer> {
    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update AdministratorEntity us set us.account=:qAccount, us.password=:qPassword, us.type=:qType, us.idadminstrator =:qIdAdminstrator where us.idadminstrator =:qIdAdminstrator")
    public void updateAdminUser(@Param("qAccount") String account, @Param("qPassword") String password, @Param("qType") Integer type , @Param("qIdAdminstrator") Integer id);
}


//private int idadminstrator;
//private String account;
//private String password;
//private Integer type;