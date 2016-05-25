package com.gaussic.Interceptor;

/**
 * Created by fengxiangli on 16/5/13.
 */
import java.io.IOException;


/**
 * @author lfx
 *
 * 2015-8-17上午10:57:24
 *
 *UnLoginException
 *登录失败异常类
 */
public class UnLoginException extends Exception{

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public UnLoginException() {
        super();
        // TODO Auto-generated constructor stub
    }

    public UnLoginException(String message) throws IOException {
        super(message);
        // TODO Auto-generated constructor stub
    }


}
