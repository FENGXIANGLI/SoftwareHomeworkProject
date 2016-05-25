package com.gaussic.controller;

        import Utils.CommonUtils;
        import com.gaussic.repository.AdminUserRepository;
        import com.gaussic.model.AdministratorEntity;
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
        import com.gaussic.model.*;
        import org.springframework.web.servlet.mvc.support.RedirectAttributes;

        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpSession;
        import java.util.*;


/**
 * Created by dzkan on 2016/3/8.
 */
@Controller
public class AdminController {

    Set<Integer> user_IdSet = new HashSet<Integer>();

    // 自动装配数据库接口，不需要再写原始的Connection来操作数据库
    @Autowired
    UserRepository userRepository;

    @Autowired
    AdminUserRepository adminUserRepository;

    @Autowired
    BookInfoEntityRepository bookInfoEntityRepository;

    @Autowired
    TransactionEntityRepository transactionEntityRepository;

    private String  loginUserAccount;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request,ModelMap modelMap) {
        if (request.getSession().getAttribute("rootAdminLogin") != null){
            return "/user/userProfile";
        }
        return "index";
    }

    @RequestMapping(value = "/serverLogin", method = RequestMethod.GET)
    public String serverLogin(HttpServletRequest request ,ModelMap modelMap){
        if (request.getSession().getAttribute("adminUserToken")!= null){
            if (request.getSession().getAttribute("adminUserType").equals("1")){
                List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
                modelMap.addAttribute("adminUserList",administratorEntityList);
                return "/rootAdmin/adminUsers";
            }else {
                List<UserEntity> userList = userRepository.findAll();

                modelMap.addAttribute("userList",userList);
                modelMap.addAttribute("adminUserName",request.getSession().getAttribute("adminUserName"));
                return "/admin/users";
            }
        }
        return "/serverLogin";
    }

    @RequestMapping(value = "/serverLogin", method = RequestMethod.POST)
    public String login(HttpServletRequest request, ModelMap modelMap){
        System.out.println("succeed!!");
        HttpSession testSession = request.getSession();
        testSession.setMaxInactiveInterval(1000);

        String inputAccount = request.getParameter("username");
        String inputPassword = request.getParameter("password");

        List<AdministratorEntity> adminUserList = adminUserRepository.findAll();
        Map<String,String[]> userAdminPassUserMap = new HashMap<String, String[]>();
        for (AdministratorEntity adminUser:
                adminUserList) {
            userAdminPassUserMap.put(adminUser.getAccount(),new String[]{adminUser.getPassword(),String.valueOf(adminUser.getIdadminstrator()),adminUser.getType().toString()});
        }

        if (!userAdminPassUserMap.containsKey(inputAccount)){
            modelMap.addAttribute("error","用户名不存在");
            System.out.println("用户名不存在");
            return "/serverLogin";
        }else if (!userAdminPassUserMap.get(inputAccount)[0].equals(inputPassword)){
            System.out.println("here:"+ userAdminPassUserMap.get(inputAccount)[0]);
            System.out.println("test:"+ inputPassword);
            modelMap.addAttribute("error","密码错误");
            System.out.println("密码错误");
            return "/serverLogin";
        }
        System.out.println("succeed!!");
        String adminUserId = userAdminPassUserMap.get(inputAccount)[1];
        String adminUserType = userAdminPassUserMap.get(inputAccount)[2];
        request.getSession().setAttribute("adminUserToken", adminUserId);
        request.getSession().setAttribute("adminUserType", adminUserType);
        request.getSession().removeAttribute("userToken");

        loginUserAccount = inputAccount;

        modelMap.addAttribute("adminUserName",this.loginUserAccount);
        modelMap.addAttribute("adminUserId",adminUserId);
        request.getSession().setAttribute("adminUserName",inputAccount);
        if (adminUserType.equals("1")){
            List<AdministratorEntity> administratorEntityList = adminUserRepository.findAll();
            modelMap.addAttribute("adminUserList",administratorEntityList);
            request.getSession().setAttribute("rootAdminLogin","yes");
            return "/rootAdmin/adminUsers";
        }else {
            List<UserEntity> userEntityList = userRepository.findAll();
            modelMap.addAttribute("userList",userEntityList);
            return "/admin/users";
        }
    }

    @RequestMapping(value = "/admin/user/logout",method = RequestMethod.GET)
    public String adminLogout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/serverLogin";
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap){
        // 查询user表中所有记录


        List<UserEntity> userList = userRepository.findAll();
        for (UserEntity userTest:userList) {
            user_IdSet.add(userTest.getId());
        }
        // 将所有记录传递给要返回的
        modelMap.addAttribute("userList", userList);
        modelMap.addAttribute("adminUserName",this.loginUserAccount);
        // 返回pages目录下的admin/users.jsp页面
        return "/admin/users";
    }

    @RequestMapping(value = "/admin/books", method = RequestMethod.GET)
    public String getBooks(ModelMap modelMap){
        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        modelMap.addAttribute("bookList",bookInfoEntityList);
        modelMap.addAttribute("adminUserName",this.loginUserAccount);
        return "/admin/books";
    }

    @RequestMapping(value = "/admin/transaction", method = RequestMethod.GET)
    public String getTransactions(ModelMap modelMap){
        List<TransactionEntity> transactionEntityList =transactionEntityRepository.findAll();
        modelMap.addAttribute("transactionList",transactionEntityList);
        modelMap.addAttribute("adminUserName",this.loginUserAccount);
        return "/admin/transactions";
    }

    @RequestMapping(value = "/admin/transaction/search", method = RequestMethod.POST)
    public String searchTransaction(HttpServletRequest request, ModelMap modelMap){
        String testString = request.getParameter("transactionSearchContent");
        System.out.println("hereTest:"+ testString);
        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAll();
        List<TransactionEntity> returnTransactionList = new LinkedList<TransactionEntity>();

        for (TransactionEntity transactionEntity:transactionEntityList){
            System.out.println("hereSearchName: " +  transactionEntity.getBookName()+ " " + transactionEntity.getBorrowName());
            if (transactionEntity.getBookName().contains(testString) || transactionEntity.getBorrowName().contains(testString)){
                returnTransactionList.add(transactionEntity);
            }
        }
        modelMap.addAttribute("transactionList",returnTransactionList);
        if(request.getSession().getAttribute("rootAdminLogin") != null){
            return "/rootAdmin/transactions";
        }
        return "/admin/transactions";
    }

    @RequestMapping(value = "/admin/book/search", method = RequestMethod.POST)
    public String searchBook(HttpServletRequest request, ModelMap modelMap){
        String testString = request.getParameter("bookSearchContent");

        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        List<BookInfoEntity> returnBookList = new LinkedList<BookInfoEntity>();
        for (BookInfoEntity bookInfoEntity:bookInfoEntityList){
            if (bookInfoEntity.getBookName().contains(testString)){
                returnBookList.add(bookInfoEntity);
            }
        }
        modelMap.addAttribute("bookList",returnBookList);
        if(request.getSession().getAttribute("rootAdminLogin") != null){
            return "/rootAdmin/books";
        }
        return "/admin/books";
    }

    @RequestMapping(value = "/admin/user/search", method = RequestMethod.POST)
    public String searchUser(HttpServletRequest request, ModelMap modelMap){
        String testString = request.getParameter("userSearchContent");
        System.out.println("ContentString:" + testString);
        List<UserEntity> userAllList = userRepository.findAll();
        List<UserEntity> returnUserList = new LinkedList<UserEntity>();
        for (UserEntity userEntity:userAllList){
            if (userEntity.getAccount().contains(testString)){
                returnUserList.add(userEntity);
            }
        }
        modelMap.addAttribute("userList",returnUserList);
        if(request.getSession().getAttribute("rootAdminLogin") != null){
            return "/rootAdmin/users";
        }
        return "/admin/users";
    }

    @RequestMapping(value = "/admin/users/add", method = RequestMethod.GET)
    public String addUser() {
        // 转到 admin/addUser.jsp页面
        return "/admin/addUser";
    }

    // post请求，处理添加用户请求，并重定向到用户管理页面
    @RequestMapping(value = "/admin/users/addP", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        // 注意此处，post请求传递过来的是一个UserEntity对象，里面包含了该用户的信息
        // 通过@ModelAttribute()注解可以获取传递过来的'user'，并创建这个对象

        // 数据库中添加一个用户，该步暂时不会刷新缓存
        //userRepository.save(userEntity);
        System.out.println(userEntity.getFirstName());
        System.out.println(userEntity.getLastName());
        System.out.println(userEntity.getNickname());
        Integer tempId = CommonUtils.getRandomExcept(100000,user_IdSet);
        userEntity.setId(tempId);
        System.out.println(userEntity.getId());
        // 数据库中添加一个用户，并立即刷新缓存
        userRepository.saveAndFlush(userEntity);

        // 重定向到用户管理页面，方法为 redirect:url
        return "redirect:/admin/users";
    }

    // 查看用户详情
    // @PathVariable可以收集url中的变量，需匹配的变量用{}括起来
    // 例如：访问 localhost:8080/admin/users/show/1 ，将匹配 id = 1
    @RequestMapping(value ="/admin/users/show/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userId, ModelMap modelMap ){
        // 找到userId表示的用户
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("user", userEntity);
        return  "/admin/userDetail";
    }

    // 更新用户信息 页面
    @RequestMapping(value = "/admin/users/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId, ModelMap modelMap) {

        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("user", userEntity);
        return "/admin/updateUser";
    }

    // 更新用户信息 操作
    @RequestMapping(value = "/admin/users/updateP", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("userP") UserEntity user){

        // 更新用户信息
        userRepository.updateUser(user.getNickname(),user .getFirstName(),user.getLastName(),user.getPassword(),user.getId());
        userRepository.flush(); //刷新缓冲区
        return "redirect:/admin/users";
    }

    @RequestMapping(value = "/admin/users/delete/{id}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer userId){
        // 删除id为userId的用户
        userRepository.delete(userId);
        // 立即刷新
        userRepository.flush();
        return "redirect:/admin/users";
    }

    @RequestMapping(value = "/admin/user/bookBorrow/{id}/{userBorrowedName}/{userId}", method = RequestMethod.GET)
    public String showUserBorrowBook(@PathVariable("id") Integer userId, @PathVariable("userBorrowedName") String userBorrowedName, @PathVariable("userId") Integer userPId,ModelMap modelMap){
        System.out.println("Id:" + userId);
        List<BookInfoEntity> bookInfoEntityList =  bookInfoEntityRepository.findByIdBorrowed(userId);
        modelMap.addAttribute("bookList", bookInfoEntityList);

        modelMap.addAttribute("userBorrowedName",userBorrowedName);
        modelMap.addAttribute("userPId",userPId);
        return "/admin/userBorrowBooks";
    }

    @RequestMapping(value = "/admin/books/add", method = RequestMethod.GET)
    public String addBook() {
        // 转到 admin/addUser.jsp页面
        return "/admin/addBook";
    }

    // post请求，处理添加用户请求，并重定向到用户管理页面
    @RequestMapping(value = "/admin/books/addP", method = RequestMethod.POST)
    public String addBookPost(@ModelAttribute("book") BookInfoEntity bookInfoEntity) {
        // 注意此处，post请求传递过来的是一个UserEntity对象，里面包含了该用户的信息
        // 通过@ModelAttribute()注解可以获取传递过来的'user'，并创建这个对象

        // 数据库中添加一个用户，该步暂时不会刷新缓存
        //userRepository.save(userEntity);
        System.out.println(bookInfoEntity.getId());
        // 数据库中添加一个用户，并立即刷新缓存
        bookInfoEntityRepository.saveAndFlush(bookInfoEntity);

        // 重定向到用户管理页面，方法为 redirect:url
        return "redirect:/admin/books";
    }

    @RequestMapping(value = "/admin/books/show/{id}",method = RequestMethod.GET)
    public String showBook(@PathVariable("id") Integer bookId, ModelMap modelMap){
        BookInfoEntity bookInfoEntity  = bookInfoEntityRepository.findOne(bookId);
        modelMap.addAttribute("book",bookInfoEntity);
        return "/admin/bookDetail";
    }

    @RequestMapping(value = "/admin/books/delete/{id}", method = RequestMethod.GET)
    public String deleteBook(@PathVariable("id") Integer bookId, ModelMap modelMap){
        bookInfoEntityRepository.delete(bookId);
        bookInfoEntityRepository.flush();
        return "redirect:/admin/books";
    }

    @RequestMapping(value = "/admin/books/update/{id}", method = RequestMethod.GET)
    public String updateBook(@PathVariable("id") Integer bookId, ModelMap modelMap){
        // 找到userId所表示的用户
        BookInfoEntity bookInfoEntity = bookInfoEntityRepository.findOne(bookId);

        // 传递给请求页面
        modelMap.addAttribute("book", bookInfoEntity);
        return "/admin/updateBook";
    }

    // 更新图书信息 操作
    @RequestMapping(value = "/admin/books/updateP", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("bookP") BookInfoEntity bookInfoEntity){

        // 更新用户信息
        bookInfoEntityRepository.updateBookInfo(bookInfoEntity.getBookName(),bookInfoEntity.getIsbn(),bookInfoEntity.getAuthor(),bookInfoEntity.getPress(),bookInfoEntity.getSummary(),bookInfoEntity.getLocation(),bookInfoEntity.getPrice(),bookInfoEntity.getAtLibOrNot(),bookInfoEntity.getIdBorrowed(),bookInfoEntity.getBookNumber(),bookInfoEntity.getId());
        bookInfoEntityRepository.flush(); //刷新缓冲区
        return "redirect:/admin/boo";
    }

}
