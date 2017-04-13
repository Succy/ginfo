package com.wcj.filter;

import com.wcj.entity.Admin;
import com.wcj.entity.Student;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Succy
 * @date 2017-04-09 14:23
 **/

public class AdminLoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);
        if (session != null) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin != null) {
                chain.doFilter(req, resp);
            } else {
                response.sendRedirect("/login.jsp");
            }
        } else {
            response.sendRedirect("/login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
