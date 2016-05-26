package com.gaussic.repository;

import com.gaussic.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

/**
 * Created by fengxiangli on 2016/4/18.
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update UserEntity us set us.birthday=:qBirthday,us.account=:qAccount,us.nickname=:qNickname, us.lastName=:qLastName, us.firstName=:qFirstName,us.password=:qPassword,us.studentId=:qStudentId,us.department=:qDepartment, us.borrowBookNum=:qBorrowBookNum,us.allowAmountBookNum=:qAllowAmountBookNum,us.defaultTimes=:qDefaultTimes,us.defaultTotalDay=:qDefaultTotalDay, us.userGender =:qUserGender where us.id=:qId")
    public void updateUser(@Param("qBirthday")Date birthday,@Param("qAccount") String account,@Param("qNickname") String nickname,  @Param("qLastName") String qLastName, @Param("qFirstName") String firstName
                          , @Param("qPassword") String password,@Param("qStudentId") Integer studentId,@Param("qDepartment") String department,@Param("qBorrowBookNum") Integer borrowBookNum, @Param("qAllowAmountBookNum") Integer allowAmountBookNum, @Param("qDefaultTimes") Integer defaultTimes, @Param("qDefaultTotalDay") Integer defaultTotalDay, @Param("qUserGender") Integer userGender, @Param("qId") Integer id);



    @Transactional
    @Query("from UserEntity us where us.account =:qAccount")
    public UserEntity findByAccountName(@Param("qAccount") String account);

}
