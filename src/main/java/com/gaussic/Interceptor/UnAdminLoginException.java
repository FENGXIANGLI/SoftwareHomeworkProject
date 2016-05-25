package com.gaussic.Interceptor;

import java.io.IOException;

/**
 * Created by fengxiangli on 16/5/13.
 */
public class UnAdminLoginException extends Exception{

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public UnAdminLoginException() {
        super();
        // TODO Auto-generated constructor stub
    }

    public UnAdminLoginException(String message) throws IOException {
        super(message);
        // TODO Auto-generated constructor stub
    }


}
