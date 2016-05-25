package com.gaussic.controller;

import Utils.CommonUtils;
import com.gaussic.model.AdministratorEntity;
import com.gaussic.model.BookInfoEntity;
import com.gaussic.model.TransactionEntity;
import com.gaussic.model.UserEntity;
import com.gaussic.repository.AdminUserRepository;
import com.gaussic.repository.BookInfoEntityRepository;
import com.gaussic.repository.TransactionEntityRepository;
import com.gaussic.repository.UserRepository;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
import java.util.List;

/**
 * Created by fengxiangli on 16/5/17.
 */
@Controller
public class RootAdminController {
    Set<Integer> adminUser_IdSet = new HashSet<Integer>();

    @Autowired
    AdminUserRepository adminUserRepository;

    @Autowired
    BookInfoEntityRepository bookInfoEntityRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    TransactionEntityRepository transactionEntityRepository;

    @RequestMapping(value = "/admin/adminUsers/managers" ,method = RequestMethod.GET)
    public String rootAdminManagers(ModelMap modelMap) {
        List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
        modelMap.addAttribute("adminUserList",administratorEntityList);
        return "/rootAdmin/adminUsers";
    }

    @RequestMapping(value = "/admin/adminUsers/users" ,method = RequestMethod.GET)
    public String rootAdminUsers(ModelMap modelMap) {
        List<UserEntity> userEntityList = userRepository.findAll();
        modelMap.addAttribute("userList",userEntityList);
        return "/rootAdmin/users";
    }

    @RequestMapping(value = "/admin/adminUsers/books" ,method = RequestMethod.GET)
    public String rootAdminBooks(ModelMap modelMap) {
        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        modelMap.addAttribute("bookList",bookInfoEntityList);
        return "/rootAdmin/books";
    }

    @RequestMapping(value = "/admin/adminUsers/transactions" ,method = RequestMethod.GET)
    public String rootAdminTransactions(ModelMap modelMap) {
        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAll();
        modelMap.addAttribute("transactionList",transactionEntityList);
        return "/rootAdmin/transactions";
    }

    @RequestMapping(value = "/admin/adminUsers/logout" ,method = RequestMethod.GET)
    public String rootAdminLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/serverLogin";
    }

    @RequestMapping(value = "/admin/adminUsers/add" ,method = RequestMethod.GET)
    public String addAdminUser(){
        return "/rootAdmin/addAdminUser";
    }

    @RequestMapping(value = "/admin/adminUsers/add", method = RequestMethod.POST)
    public String addAdminUserPost(ModelMap modelMap, @ModelAttribute("adminUser")AdministratorEntity administratorEntity){
        List<AdministratorEntity> adminUserList = adminUserRepository.findAll();
        for (AdministratorEntity adminUserOne:adminUserList) {
            adminUser_IdSet.add(adminUserOne.getIdadminstrator());
        }
        try {
            Integer tempId = CommonUtils.getRandomExcept(100000, adminUser_IdSet);
            administratorEntity.setIdadminstrator(tempId);
            adminUserRepository.saveAndFlush(administratorEntity);
            adminUserList = adminUserRepository.findAll();
            modelMap.addAttribute("adminUserList",adminUserList);
        }catch (Exception e) {
            System.out.println(e.getMessage());
            return "/rootAdmin/adminUsers";
        }
            return "/rootAdmin/adminUsers";

    }

    @RequestMapping(value = "/admin/adminUsers/search", method = RequestMethod.POST)
    public String searchBook(HttpServletRequest request, ModelMap modelMap){
        String testString = request.getParameter("adminUsersSearchContent");
        List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
        List<AdministratorEntity> returnAdministratorEntityList = new LinkedList<AdministratorEntity>();
        for (AdministratorEntity administratorEntity:administratorEntityList){
            System.out.println("搜索内容:  " +testString);
            System.out.println("管理员account:  " + administratorEntity.getAccount());
            if (administratorEntity.getAccount().contains(testString)){
                returnAdministratorEntityList.add(administratorEntity);
            }
        }
        modelMap.addAttribute("adminUserList", returnAdministratorEntityList);
        return "/rootAdmin/adminUsers";
    }
    @RequestMapping(value = "/admin/adminUsers/delete/{id}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer userId, ModelMap modelMap){
        // 删除id为userId的用户
        adminUserRepository.delete(userId);
        // 立即刷新
        adminUserRepository.flush();
        List<AdministratorEntity> adminUserList = adminUserRepository.findAll();
        modelMap.addAttribute("adminUserList",adminUserList);
        return "/rootAdmin/adminUsers";
    }

    @RequestMapping(value ="/admin/adminUsers/show/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userId, ModelMap modelMap ){
        // 找到userId表示的用户
        AdministratorEntity adminUserEntity = adminUserRepository.findOne(userId);
        modelMap.addAttribute("adminUser", adminUserEntity);
        return  "/rootAdmin/adminUserDetail";
    }

    // 更新用户信息 页面
    @RequestMapping(value = "/admin/adminUsers/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId, ModelMap modelMap) {

        // 找到userId所表示的用户
        AdministratorEntity adminUserEntity = adminUserRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("adminUser", adminUserEntity);
        return "/rootAdmin/updateAdminUser";
    }
    // 更新用户信息 操作

    @RequestMapping(value = "/admin/adminUsers/updateP", method = RequestMethod.POST)
    public String updateAdminUserPost(@ModelAttribute("adminUser") AdministratorEntity adminUser,ModelMap modelMap){

        // 更新用户信息
        adminUserRepository.updateAdminUser(adminUser.getAccount(),adminUser.getPassword(),adminUser.getType(),adminUser.getIdadminstrator());
        adminUserRepository.flush(); //刷新缓冲区
        List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
        modelMap.addAttribute("adminUserList",administratorEntityList);
        return "/rootAdmin/adminUsers";
    }
    @RequestMapping(value = "/admin/adminUsers/back", method = RequestMethod.GET)
    public String back(ModelMap modelMap){
        List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
        modelMap.addAttribute("adminUserList",administratorEntityList);
        return "/rootAdmin/adminUsers";
    }
}
