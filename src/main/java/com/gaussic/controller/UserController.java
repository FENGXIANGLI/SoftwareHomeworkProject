package com.gaussic.controller;

        import com.gaussic.model.BookInfoEntity;
        import com.gaussic.model.UserEntity;
        import com.gaussic.repository.BookInfoEntityRepository;
        import com.gaussic.repository.UserRepository;
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

/**
 * Created by fengxiangli on 16/5/8.
 */
@Controller
class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    BookInfoEntityRepository bookInfoEntityRepository;

    Set<Integer> user_IdSet = new HashSet<Integer>();

    private Map<Long, UserEntity> userMap = new ConcurrentHashMap<Long, UserEntity>();

    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public String registerPage(HttpServletRequest request){
        request.getSession().removeAttribute("error");
        request.getSession().removeAttribute("rightValue");
        return "user/register";
    }

    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    public String register(HttpServletRequest request,@Valid @ModelAttribute("registerUser")UserEntity userEntity, BindingResult result, String birthday){

        try {
            System.out.println("hereTest");
            request.getSession().getAttribute("gender_1");

            SimpleDateFormat bartDateFormat = new SimpleDateFormat("MM dd yyyy");
            java.util.Date date = bartDateFormat.parse(birthday);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            System.out.println(sqlDate.getTime());
            userEntity.setBirthday(sqlDate);

            request.getSession().removeAttribute("error");
            request.getSession().removeAttribute("rightValue");

            if (result.hasErrors()){
                System.out.println("error");
                List<ObjectError> objectError= result.getAllErrors();
                List<String> errorArray = new ArrayList<String>();

                Boolean sqlError = false;
                System.out.println(objectError.get(0).getDefaultMessage());
                if (objectError.get(0).getDefaultMessage().contains("'java.lang.String' to required type 'java.sql.Date'")&& objectError.size() == 1){
                    sqlError = true;
                }
                if (sqlError){
                    request.getSession().setAttribute("error",objectError.get(0).getDefaultMessage());
                    return "/user/register";
                }
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
            request.getSession().setAttribute("rightValue","注册成功!");
            System.out.println("registerSucceed");
            return "/user/register";
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
       return "/user/register";
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
        session.setAttribute("alreadyLogin","YES");

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
        modelMap.addAttribute("userGender", loginEntity.getUserGender());

        List<BookInfoEntity> bookInfoEntityList = bookInfoEntityRepository.findAll();
        modelMap.addAttribute("bookNumber",bookInfoEntityList.size());

        return "/user/userProfile";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginByGet(HttpServletRequest request){
        if (request.getSession().getAttribute("alreadyLogin") != null){
            return "/user/userProfile";
        }
        return "/index";
    }

//    @RequestMapping(value = "/user/userProfile/{id}", method = RequestMethod.POST)
//    public String userPlatform(@PathVariable("id") Integer userId, ModelMap modelmap){
//        UserEntity userEntity = userRepository.findOne(userId);
//        modelmap.addAttribute("user",userEntity);
//        modelmap.addAttribute("userId",userId);
//        return "/user/userProfile";
//    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/login";
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
                    String userAccount = request.getSession().getAttribute("userName").toString();
                    request.getSession().setAttribute("imgAddress",userAccount+"_portrait.jpg");
                    modelMap.addAttribute("imgAddress",userAccount+"_portrait.jpg");
                    System.out.println("userAccount:"+userAccount);
                    String path="/Users/fengxiangli/baiduCloud/百度云同步盘/大学课程/大四下/软工/模板及参考书/参考代码/sprProjects/SpringMVCDemo/src/main/webapp/WEB-INF/images/"+userAccount+"_portrait.jpg";
                    //上传
                    file.transferTo(new File(path));
                }
            }
        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "redirect:/user/userProfile";
    }

    @RequestMapping(value = "/user/userProfile",method = RequestMethod.GET)
    public String userFileRedirect(ModelMap modelMap, HttpServletRequest request){
        if (request.getSession().getAttribute("userName") == null){
            return "redirect:/login";
        }

        if(request.getSession().getAttribute("imgAddress")!= null){
            modelMap.addAttribute("imgAddress",request.getSession().getAttribute("imgAddress"));
        }
        return "/user/userProfile";
    }
}
