package com.gaussic.controller;

        import com.gaussic.model.BookInfoEntity;
        import com.gaussic.model.TransactionEntity;
        import com.gaussic.model.UserEntity;
        import com.gaussic.repository.BookInfoEntityRepository;
        import com.gaussic.repository.TransactionEntityRepository;
        import com.gaussic.repository.UserRepository;
        import com.sun.org.apache.xpath.internal.operations.Mod;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.ModelMap;
        import org.springframework.validation.BindingResult;
        import org.springframework.validation.ObjectError;
        import org.springframework.web.bind.annotation.*;

        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpSession;
        import javax.validation.Valid;
        import java.io.File;
        import java.io.IOException;
        import java.text.SimpleDateFormat;
        import java.util.*;
        import java.util.concurrent.ConcurrentHashMap;
        import Utils.CommonUtils;
        import org.springframework.web.multipart.MultipartFile;
        import org.springframework.web.multipart.MultipartHttpServletRequest;
        import org.springframework.web.multipart.commons.CommonsMultipartResolver;
        import org.springframework.web.servlet.mvc.support.RedirectAttributes;

        import Consts.*;

/**
 * Created by fengxiangli on 16/5/8.
 */
@Controller
class UserController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    BookInfoEntityRepository bookInfoEntityRepository;

    @Autowired
    TransactionEntityRepository transactionEntityRepository;

    Set<Integer> user_IdSet = new HashSet<Integer>();


    private Map<Long, UserEntity> userMap = new ConcurrentHashMap<Long, UserEntity>();

    private String Account;

    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public String registerPage(HttpServletRequest request){
        request.getSession().removeAttribute("error");
        request.getSession().removeAttribute("rightValue");
        return "/user/register";
    }

    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    public String register(ModelMap modelMap,HttpServletRequest request,@Valid @ModelAttribute("registerUser")UserEntity userEntity, BindingResult result, String birthday){

        try {
//            confirmPassword
            System.out.println("hereTest");

//            System.out.println("lastNamePassword::"+request.getSession().getAttribute("lastName"));

            if (result.hasErrors()){
                System.out.println("error");
                List<ObjectError> objectError= result.getAllErrors();
                List<String> errorArray = new ArrayList<String>();

                    modelMap.addAttribute("error", objectError.get(0).getDefaultMessage());
                    return "/user/register";
            }

//            System.out.println("confirmPassword::"+request.getSession().getAttribute("confirmPassword"));

            if (!userEntity.getConfirmPassword().equals(userEntity.getPassword())){
                System.out.println("InErrorhereTest");
                modelMap.addAttribute("error","密码不一致!请重新输入");
                return "/user/register";
            }

            List<UserEntity> userList = userRepository.findAll();
            for (UserEntity userTest:userList) {
                user_IdSet.add(userTest.getId());
            }
            System.out.println(userEntity.getFirstName());
            System.out.println(userEntity.getLastName());
            System.out.println(userEntity.getNickname());
            System.out.println("here Gender" + userEntity.getUserGender().toString());
            Integer tempId = CommonUtils.getRandomExcept(100000,user_IdSet);
            userEntity.setId(tempId);
            System.out.println(userEntity.getId());
            // 数据库中添加一个用户，并立即刷新缓存
            userRepository.saveAndFlush(userEntity);
            modelMap.addAttribute("rightValue","注册成功");
            System.out.println("registerSucceed");
            return "/user/register";
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
       return "/user/register";
    }

    @RequestMapping(value = "/user/personalInfoRedirect", method = RequestMethod.GET)
    public String getPersonalInfo(ModelMap modelMap, HttpServletRequest request){
        System.out.println("herePersonalInfo!!!");
        if (request.getSession().getAttribute("userName") == null){
            return "redirect:/login";
        }

        String userAccount = request.getSession().getAttribute("alreadyLogin").toString();
        UserEntity userEntity = userRepository.findByAccountName(userAccount);
        modelMap.addAttribute("consumer",userEntity);
        return "/user/personalInfo";
    }

    @RequestMapping(value = "/user/registerSucceed", method = RequestMethod.GET)
    public  String registerSuccessful(){
        return "user/registerSucceed";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, ModelMap modelMap, RedirectAttributes redirectAttributes){
        HttpSession testSession = request.getSession();
        testSession.setMaxInactiveInterval(1000);

        List<UserEntity> userList = userRepository.findAll();
        Map<String,String[]> userPassUserMap = new HashMap<String, String[]>();
        for (UserEntity user:
             userList) {
            userPassUserMap.put(user.getAccount(),new String[]{user.getPassword(),String.valueOf(user.getId())});
        }

        String inputAccount = request.getParameter("username");
        String inputPassword = request.getParameter("password");
        System.out.println("test" + inputAccount);

        if (!userPassUserMap.containsKey(inputAccount)){
            modelMap.addAttribute("error","用户名不存在");
            System.out.println("用户名不存在");
            return "/index";
        }else if (!userPassUserMap.get(inputAccount)[0].equals(inputPassword)){
            System.out.println("here:"+ userPassUserMap.get(inputAccount)[0]);
            System.out.println("test:"+ inputPassword);
            modelMap.addAttribute("error","密码错误");
            System.out.println("密码错误");
            return "/index";
        }

        HttpSession session = request.getSession();
        session.setAttribute("alreadyLogin",inputAccount);

        String userId = userPassUserMap.get(inputAccount)[1];
        session.setAttribute("userToken", userId);
        session.setAttribute("userName",inputAccount);
        session.removeAttribute("adminUserToken");
        modelMap.addAttribute("userName",inputAccount);
        redirectAttributes.addAttribute("userId",userId);
        modelMap.addAttribute("userId",userId);

        String userAccount = session.getAttribute("userName").toString();

        File file = new File("/Users/fengxiangli/baiduCloud/百度云同步盘/大学课程/大四下/软工/模板及参考书/参考代码/sprProjects/SpringMVCDemo/src/main/webapp/WEB-INF/images/"+userAccount+"_portrait.jpg");

        if (file.exists()){
            request.getSession().setAttribute("imgAddress",userAccount+"_portrait.jpg");
            modelMap.addAttribute("imgAddress",userAccount+"_portrait.jpg");
        }
        System.out.println("userAccount:"+userAccount);
        System.out.println("userAccount:"+modelMap.get("imgAddress"));

        UserEntity loginEntity = userRepository.findOne(Integer.parseInt(userId));

        request.getSession().setAttribute("userGender",loginEntity.getUserGender());

        modelMap.addAttribute("userGender", loginEntity.getUserGender());

        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        session.setAttribute("bookNumbers",bookInfoEntityList.size());

        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAllByAccount(userAccount);
        modelMap.addAttribute("transactionList",transactionEntityList);
        modelMap.addAttribute("pageType",0);

        modelMap.addAttribute("bookList", bookInfoEntityList);

        return "/user/userBookPlatform";
    }

    @RequestMapping(value = "/user/showAllTransaction",method = RequestMethod.GET)
    public String showAllTransaction(ModelMap modelMap ,HttpServletRequest request){
        modelMap.addAttribute("pageType",Consts.ALLTRANSACTION);

        String userAccount = request.getSession().getAttribute("alreadyLogin").toString();

        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAllByAccount(userAccount);
        modelMap.addAttribute("transactionList", transactionEntityList);
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/user/showShouldReturnTransaction",method = RequestMethod.GET)
    public String showReturnTransaction(ModelMap modelMap, HttpServletRequest request){
        modelMap.addAttribute("pageType",Consts.SHOULDRETURNSACTION);
        String userAccount = request.getSession().getAttribute("alreadyLogin").toString();
        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAllSpecifiedTypeByAccountAndReturnOrNot(userAccount, Consts.unReturned);
        modelMap.addAttribute("transactionList", transactionEntityList);
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/user/showFinishedTransaction",method = RequestMethod.GET)
    public String showFinishedTransaction(ModelMap modelMap, HttpServletRequest request){
        modelMap.addAttribute("pageType",Consts.FINISHEDTRANSACTION);
        String userAccount = request.getSession().getAttribute("alreadyLogin").toString();
        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAllSpecifiedTypeByAccountAndReturnOrNot(userAccount, Consts.Finished);
        modelMap.addAttribute("transactionList", transactionEntityList);
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginByGet(HttpServletRequest request, ModelMap modelMap){
        if (request.getSession().getAttribute("alreadyLogin") != null){
            List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAll();
            modelMap.addAttribute("transactionList",transactionEntityList);
            modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
            return "/user/userProfile";
        }

        return "/index";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/login";
    }



    @RequestMapping(value = "/user/userProfile",method = RequestMethod.GET)
    public String userFileRedirect(ModelMap modelMap, HttpServletRequest request){
        if (request.getSession().getAttribute("userName") == null){
            return "redirect:/login";
        }

        if(request.getSession().getAttribute("imgAddress")!= null){
            modelMap.addAttribute("imgAddress",request.getSession().getAttribute("imgAddress"));
        }
        modelMap.addAttribute("pageType",0);
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/SpringMVC006/springUpload")
    public String  springUpload(HttpServletRequest request, ModelMap modelMap) throws IllegalStateException, IOException
    {
        System.out.println("Uploading!RightNow!");
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        String userAccount = request.getSession().getAttribute("userName").toString();
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    System.out.println(file.getOriginalFilename());

                    request.getSession().setAttribute("imgAddress",userAccount+"_portrait.jpg");
                    modelMap.addAttribute("imgAddress",userAccount+"_portrait.jpg");
                    System.out.println("userAccount:"+userAccount);
                    String path="/Users/fengxiangli/baiduCloud/百度云同步盘/大学课程/大四下/软工/模板及参考书/参考代码/sprProjects/SpringMVCDemo/src/main/webapp/WEB-INF/images/"+userAccount+"_portrait.jpg";
                    //上传
                    file.transferTo(new File(path));
                }
            }
        }
        modelMap.addAttribute("imgAddress",request.getSession().getAttribute("imgAddress"));
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/user/modifyPassword/{id}", method = RequestMethod.POST)
    public String updateUser(ModelMap modelMap ,HttpServletRequest request, @PathVariable("id") Integer userId){
        String inputPassword = request.getParameter("modifyPassword");
        String  inputConfirmPassword= request.getParameter("confirmModifyPassword");

        UserEntity userEntity = userRepository.findOne(userId);

        System.out.println("testUserModify:" + inputPassword + inputConfirmPassword);
        if (inputPassword.equals("")||!inputPassword.equals(inputConfirmPassword)){
            System.out.println("hereError");
            modelMap.addAttribute("consumer",userEntity);
            modelMap.addAttribute("resultModify", "修改失败");
            return "/user/personalInfo";
        }else {
            userEntity.setPassword(inputConfirmPassword);
            userRepository.updateUser(userEntity.getBirthday(),userEntity.getAccount(),userEntity.getNickname(),userEntity.getLastName(),userEntity.getFirstName(),userEntity.getPassword(),userEntity.getStudentId(),userEntity.getDepartment(),userEntity.getBorrowBookNum(),userEntity.getAllowAmountBookNum(),userEntity.getDefaultTimes(),userEntity.getDefaultTotalDay(),userEntity.getUserGender(),userEntity.getId());
            modelMap.addAttribute("resultModify", "修改成功");
            modelMap.addAttribute("consumer",userEntity);
            return "/user/personalInfo";
        }
    }

    @RequestMapping(value = "/user/updateProfile/{id}", method = RequestMethod.POST)
    public String updateProfile(@ModelAttribute("updatePersonalUser") UserEntity userUpdateEntity,ModelMap modelMap, @PathVariable("id") Integer userId,HttpServletRequest request){
        UserEntity userEntity = userRepository.findOne(userId);
        modelMap.addAttribute("succeedModify", "succeed!");
        userEntity.setNickname(userUpdateEntity.getNickname());
        userEntity.setLastName(userUpdateEntity.getLastName());
        userEntity.setFirstName(userUpdateEntity.getFirstName());
        userEntity.setDepartment(userUpdateEntity.getDepartment());
        userEntity.setUserGender(userUpdateEntity.getUserGender());
        userRepository.updateUser(userEntity.getBirthday(),userEntity.getAccount(),userEntity.getNickname(),userEntity.getLastName(),userEntity.getFirstName(),userEntity.getPassword(),userEntity.getStudentId(),userEntity.getDepartment(),userEntity.getBorrowBookNum(),userEntity.getAllowAmountBookNum(),userEntity.getDefaultTimes(),userEntity.getDefaultTotalDay(),userEntity.getUserGender(),userEntity.getId());
        modelMap.addAttribute("consumer",userEntity);
        request.getSession().setAttribute("userGender",userUpdateEntity.getUserGender());
        modelMap.addAttribute("userGender",userUpdateEntity.getUserGender());
        return "/user/personalInfo";
    }

    @RequestMapping(value = "/user/borrow/{id}/{userId}" , method = RequestMethod.GET)
    public String userBorrowBook(@PathVariable("id") Integer bookId,@PathVariable("userId") Integer userId,ModelMap modelMap,HttpServletRequest request){
        System.out.println("bookId: " + bookId);

        BookInfoEntity bookInfoEntity = bookInfoEntityRepository.findOne(bookId);
        UserEntity userEntity = userRepository.findOne(userId);

//        成功借出
        if (userEntity.getBorrowBookNum()>=userEntity.getAllowAmountBookNum()){
            modelMap.addAttribute("resultBorrow","借书失败，您借书额度！请及时归还书籍！");
        }
        else if (bookInfoEntity.getAtLibOrNot() > 0){

            Date currentDate = new Date();
            Date shouldReturnDate = CommonUtils.addMonth(currentDate);

            HashSet<Integer> tranIdSet = new HashSet<Integer>();
            List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAll();
            for(TransactionEntity transactionEntity:transactionEntityList){
                tranIdSet.add(transactionEntity.getId());
            }
            TransactionEntity newTransaction = CommonUtils.generateTransaction(bookInfoEntity, userEntity, tranIdSet);

//          更新
            String userAccount = request.getSession().getAttribute("userName").toString();
            Integer renewBorrowTimes = userRepository.findByAccountName(userAccount).getBorrowBookNum() + 1;

            transactionEntityRepository.saveAndFlush(newTransaction);

            bookInfoEntityRepository.updateBorrowPartTimeById(bookInfoEntity.getAtLibOrNot() - 1,shouldReturnDate,userId,bookId);

            userRepository.updateBorrowBookNum(renewBorrowTimes,userAccount);

            modelMap.addAttribute("resultBorrow","成功借书");
        }else {
            modelMap.addAttribute("resultBorrow","不在馆，借书失败");
        }

        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        modelMap.addAttribute("bookList",bookInfoEntityList);
        return "/user/userBookPlatform";
    }

    @RequestMapping(value = "/user/renewBook/{id}/{pageType}", method = RequestMethod.GET)
    public String renewBook(ModelMap modelMap, @PathVariable("id")Integer transactionId, @PathVariable("pageType") Integer pageType, HttpServletRequest request){
        modelMap.addAttribute("pageType",pageType);

        TransactionEntity modifyTransactionEntity = transactionEntityRepository.findById(transactionId);

        Date modifiedDate = CommonUtils.addMonth(modifyTransactionEntity.getShouldReturnTime());

        transactionEntityRepository.updateBorrowTimesById(modifyTransactionEntity.getBorrowTimes()+1,modifiedDate,transactionId);

        bookInfoEntityRepository.updateShouldReturnTimeById(modifiedDate,modifyTransactionEntity.getBookId());

        String userAccount = request.getSession().getAttribute("alreadyLogin").toString();

        List<TransactionEntity> transactionEntityList = transactionEntityRepository.findAllByAccount(userAccount);
        modelMap.addAttribute("transactionList",transactionEntityList);
        modelMap.addAttribute("userGender",request.getSession().getAttribute("userGender"));
        return "/user/userProfile";
    }

    @RequestMapping(value = "/user/bookPlatform/{id}",method = RequestMethod.GET)
    public String allBooks(ModelMap modelMap, @PathVariable("id") Integer type){
        List<BookInfoEntity> bookInfoEntityList;
        if (type == Consts.ALLBOOKS){
            bookInfoEntityList = bookInfoEntityRepository.findAll();
            modelMap.addAttribute("bookList",bookInfoEntityList);
        }else if (type == Consts.AVAILABLEBOOKS){
            bookInfoEntityList = bookInfoEntityRepository.findByAtLibOrNot(Consts.ATLIB);
            modelMap.addAttribute("bookList",bookInfoEntityList);
        }else if (type == Consts.BORROWEDBOOKS){
            bookInfoEntityList = bookInfoEntityRepository.findByAtLibOrNot(Consts.NOTATLIB);
            modelMap.addAttribute("bookList",bookInfoEntityList);
        }
        return "/user/userBookPlatform";
    }

    @RequestMapping(value = "/user/userSearch/{keyword}" , method = RequestMethod.GET)
    public String findBooksByKeyword(ModelMap modelMap, @PathVariable("keyword") String keyword){
        System.out.println("testKeyword" + keyword);
        return "/user/userBookPlatform";

    }


    @RequestMapping(value = "/index.php", method = RequestMethod.GET)
    public String getIndexBook(ModelMap modelMap,@RequestParam("s") String keyword){
//        String keyword = request.getSession().getAttribute("s").toString();
        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        try {
            byte bb[];
            bb = keyword.getBytes("ISO-8859-1"); //以"ISO-8859-1"方式解析name字符串
            keyword= new String(bb, "UTF-8");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            List<BookInfoEntity> returnbookInfoEntityList = new LinkedList<BookInfoEntity>();
            for(BookInfoEntity bookInfoEntity: bookInfoEntityList){
                System.out.println("中文:" + bookInfoEntity.getBookName());
                if (bookInfoEntity.getBookName().contains(keyword)){
                    returnbookInfoEntityList.add(bookInfoEntity);
                }
            }
            System.out.println("keyword: " + keyword);
            System.out.println("hereSearch!!!!");
            modelMap.addAttribute("bookList",returnbookInfoEntityList);
            return "/user/userBookPlatform";
        }
    }


}
