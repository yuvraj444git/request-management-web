/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ADMIN
 */
@Controller
public class DashboardCotroller {

    @RequestMapping(value = "dashboard")
    public ModelAndView dashboard() {
        ModelAndView mav = new ModelAndView("Dashboard");
        return mav;
    }
}
