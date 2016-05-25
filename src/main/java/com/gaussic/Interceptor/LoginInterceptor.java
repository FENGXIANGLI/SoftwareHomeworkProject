package com.gaussic.Interceptor;

/**
 * Created by fengxiangli on 16/5/13.
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * @author lyx
 *
 * 2015-8-17上午9:53:23
 *
 *
 *登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handle) throws Exception {

        //创建session
        HttpSession session =request.getSession();

        //无需登录，允许访问的地址
        String[] allowUrls =new String[]{"/login","/register","/serverLogin","/"};

        //获取请求地址
        String url =request.getRequestURL().toString();
        System.out.println(url);
        //获得session中的用户
        String user = (String) session.getAttribute("userToken");
        String admin = (String) session.getAttribute("adminUserToken");

        for (String strUrl : allowUrls) {
            if(url.contains(strUrl))
            {
                System.out.println("returnTrue");
                return true;
            }
        }

        if(url.contains("admin")&& admin == null)
        {
            System.out.println("您尚未登陆管理员账号");
            throw new UnAdminLoginException("你尚未登陆管理员账号");
        }else if (user == null && admin == null){
            //重定向
            System.out.println("您尚未登陆用户账号");
            throw new UnLoginException("你尚未登陆用户账号");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }

}
