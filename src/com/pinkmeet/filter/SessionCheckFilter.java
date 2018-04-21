package com.pinkmeet.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by mars on 2018/4/21.
 */
@WebFilter(filterName = "SessionCheckFilter",urlPatterns = "/*")
public class SessionCheckFilter implements Filter {

    String encoding;
    private String sessionKey;
    private String foewardUrl;

    public void destroy() {
        this.encoding = null;

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
//        if (encoding == null)
//            encoding = "utf-8";
//        req.setCharacterEncoding(encoding);
//
//
//
//
//        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {
        this.encoding = config.getInitParameter("encoding");
    }

}
