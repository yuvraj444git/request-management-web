/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.solution.model.Userdetails;
import com.solution.service.AllViewService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author raj45
 */
@Controller
public class LoginController {

    @Autowired
    AllViewService viewService;

    @RequestMapping(value = {"/", "/Login"})
    public String login() {
        return "Login";
    }

    @RequestMapping(value = "verifyLogin", method = RequestMethod.POST)
    public ModelAndView verifyLogin(@RequestParam(value = "username") String username,
            @RequestParam(value = "pwd") String password,
            HttpSession session) {
        ModelAndView modelAndView = null;
        List<Userdetails> userlist = viewService.getanyhqldatalist("from m_userdetails where username='" + username + "' and password='" + password + "' and isdelete<>'Y' and isactive='Y'");
        if (userlist != null && userlist.size() > 0 && userlist.get(0).getUsername().equals(username) && userlist.get(0).getPassword().equals(password)) {
            session.setAttribute("USERID", userlist.get(0).getId());
            session.setAttribute("EMPLOYEENAME", userlist.get(0).getName());
            session.setAttribute("USERTYPE", userlist.get(0).getType());

//            if (userlist.get(0).getType().equals("Admin") ) {
            modelAndView = new ModelAndView("redirect:/dashboard");
//            }
        } else {
            modelAndView = new ModelAndView("Login", "errmsg", "Authentication error please check your username/password");
        }

        return modelAndView;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        if (request.getSession().getAttribute("EMPLOYEENAME") != null) {
            request.getSession().invalidate();

            return "redirect:/Login";
        }
        return "redirect:" + request.getContextPath() + "/Login";
    }

}
