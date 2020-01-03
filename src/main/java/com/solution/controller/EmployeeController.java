/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.solution.model.Userdetails;
import com.solution.service.AllInsertService;
import com.solution.service.AllUpdateService;
import com.solution.service.AllViewService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ADMIN
 */
@Controller
public class EmployeeController {

    @Autowired
    AllViewService viewService;

    @Autowired
    AllInsertService insertService;

    @Autowired
    AllUpdateService updateService;

    @RequestMapping("viewEmployeeGrid")
    public ModelAndView viewEmployeeGrid(HttpSession session) {
        ModelAndView mav = new ModelAndView("ViewEmployeeGrid");
        mav.addObject("employeelist", viewService.getanyjdbcdatalist("select * from m_userdetails where isdelete<>'Y' "));
        return mav;
    }

    @RequestMapping("addEmployee")
    public ModelAndView addCustomer() {
        ModelAndView mav = new ModelAndView("AddEmployee");
        return mav;
    }

    @RequestMapping("insertEmployee")
    public ModelAndView insertEmployee(
            @ModelAttribute Userdetails userdetails,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewEmployeeGrid");
        insertService.insert(userdetails);

        return mav;
    }

    @RequestMapping("editEmployee")
    public ModelAndView editEmployee(
            @RequestParam(value = "id", required = true) String id
    ) {
        ModelAndView mav = new ModelAndView("EditEmployee");
        mav.addObject("userdetailsdt", viewService.getanyjdbcdatalist("select * from m_userdetails where id='" + id + "'").get(0));
        return mav;
    }

    @RequestMapping("updateEmployee")
    public ModelAndView updateEmpployee(@ModelAttribute Userdetails userdetails,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewEmployeeGrid");
        updateService.update(userdetails);
        return mav;
    }
}
