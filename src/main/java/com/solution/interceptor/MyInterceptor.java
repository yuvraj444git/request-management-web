/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.interceptor;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author ADMIN
 */
public class MyInterceptor extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws IOException {
        StringBuffer pageName = request.getRequestURL();
        String requestMapping = pageName.substring(pageName.lastIndexOf("/"));

        if (requestMapping.endsWith("/theme.custom.js")
                || requestMapping.endsWith("/theme.init.js")
                || requestMapping.endsWith("/modernizr.js")
                || requestMapping.endsWith("/theme.js")
                || requestMapping.endsWith("/theme.css")
                || requestMapping.endsWith("/default.css")
                || requestMapping.endsWith("/bootstrap.css")
                || requestMapping.endsWith("/theme-custom.css")
                || requestMapping.equals("/") || requestMapping.endsWith("/Login") || requestMapping.endsWith("/verifyLogin")) {
            return true;
        } else if (request.getSession().getAttribute("EMPLOYEENAME") != null) {
            return true;
        } else {
            response.sendRedirect("Login");
            return false;
        }
    }

}
