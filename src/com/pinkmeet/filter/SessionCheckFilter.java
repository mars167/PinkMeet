package com.pinkmeet.filter;

import com.sun.deploy.net.HttpRequest;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by mars on 2018/4/21.
 */
//@WebFilter(filterName = "SessionCheckFilter",urlPatterns = {"/*"})
public class SessionCheckFilter implements Filter {

    String encoding;
    private String sessionKey;
    private String foewardUrl;

    public void destroy() {
        this.encoding = null;

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        if (encoding == null)
//            encoding = "utf-8";
//        req.setCharacterEncoding(encoding);
//
//        chain.doFilter(req,resp)
        HttpSession session = ((HttpServletRequest)req).getSession();

        String path = ((HttpServletRequest)req).getServletPath();
        if((null != session.getAttribute("islogin"))||path.endsWith("Login")||path.endsWith("login.jsp")||path.endsWith("MemberServlet")||path.endsWith("register.jsp")){
           System.out.println("Filter invoked!");
            chain.doFilter(req,resp);
        }
        else{
            System.out.println("invoked!");
            req.getRequestDispatcher("login.jsp").forward(req,resp);

        }
    }

    public void init(FilterConfig config) throws ServletException {
        this.encoding = config.getInitParameter("encoding");
    }

}
