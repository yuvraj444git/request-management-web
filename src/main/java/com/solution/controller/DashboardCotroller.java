/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.solution.service.AllViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ADMIN
 */
@Controller
public class DashboardCotroller {

    @Autowired
    AllViewService viewService;

    @RequestMapping(value = "dashboard")
    public ModelAndView dashboard() {
        ModelAndView mav = new ModelAndView("Dashboard");
        mav.addObject("TotalServiceRequest", viewService.getanyjdbcdatalist("select count(*) totalcount from t_service_request sr inner join m_customers c on sr.cust_id=c.id inner join m_cust_serial_no csn on sr.cust_prd_serial_id=csn.id where sr.isdelete<>'Y'  "));
        mav.addObject("InwardServiceRequest", viewService.getanyjdbcdatalist("select count(*) totalcount from t_service_request sr inner join m_customers c on sr.cust_id=c.id inner join m_cust_serial_no csn on sr.cust_prd_serial_id=csn.id where sr.isdelete<>'Y' and service_status='Inward' "));
        mav.addObject("InprogressServiceRequest", viewService.getanyjdbcdatalist("select count(*) totalcount from t_service_request sr inner join m_customers c on sr.cust_id=c.id inner join m_cust_serial_no csn on sr.cust_prd_serial_id=csn.id where sr.isdelete<>'Y' and service_status='Inprogress' "));
        mav.addObject("OutwardServiceRequest", viewService.getanyjdbcdatalist("select count(*) totalcount from t_service_request sr inner join m_customers c on sr.cust_id=c.id inner join m_cust_serial_no csn on sr.cust_prd_serial_id=csn.id where sr.isdelete<>'Y' and service_status='Outward' "));
        mav.addObject("TotalCustomers", viewService.getanyjdbcdatalist("SELECT \n"
                + "    count(*) totalcount\n"
                + "FROM\n"
                + "    m_customers cust\n"
                + "WHERE\n"
                + "    cust.isdelete <> 'Y'\n"
                + ""));
        return mav;
    }
}
