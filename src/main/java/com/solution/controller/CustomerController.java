/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.google.gson.Gson;
import com.solution.model.Customer;
import com.solution.model.CustomerSerialNo;
import com.solution.model.CustomerSerialNoArray;
import com.solution.service.AllInsertService;
import com.solution.service.AllUpdateService;
import com.solution.service.AllViewService;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
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
public class CustomerController {

    @Autowired
    AllViewService viewService;

    @Autowired
    AllInsertService insertService;

    @Autowired
    AllUpdateService updateService;

    @RequestMapping("viewCustomerGrid")
    public ModelAndView viewEmployeeGrid(HttpSession session) {
        ModelAndView mav = new ModelAndView("ViewCustomerGrid");
        mav.addObject("customerlist", viewService.getanyjdbcdatalist("SELECT \n"
                + "    cust.*, GROUP_CONCAT(csn.serialno) allserials\n"
                + "FROM\n"
                + "    m_customers cust\n"
                + "        LEFT JOIN\n"
                + "    m_cust_serial_no csn ON csn.cust_id = cust.id\n"
                + "WHERE\n"
                + "    cust.isdelete <> 'Y'\n"
                + "GROUP BY cust.id"));
        return mav;
    }

    @RequestMapping("addCustomer")
    public ModelAndView addCustomer(
            @RequestParam(value = "from", required = false) String frompage
    ) {
        ModelAndView mav = new ModelAndView("AddCustomer");
        mav.addObject("frompage", frompage);
        return mav;
    }

    @RequestMapping("insertCustomer")
    public ModelAndView insertCustomer(
            @ModelAttribute Customer customer,
            @ModelAttribute CustomerSerialNoArray array,
            @RequestParam(value = "frompage", required = false) String frompage,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewCustomerGrid");
        insertService.insert(customer);
        if (frompage != null && !frompage.toString().equals("")) {
            mav = new ModelAndView("redirect:addNewServiceRequest?custid=" + customer.getId());
        }
        for (int i = 0; array.getSerialno() != null && i < array.getSerialno().length; i++) {
            CustomerSerialNo csn = new CustomerSerialNo();

            if (array.getProduct_name() != null) {
                csn.setProduct_name(array.getProduct_name()[i]);
            }

            if (array.getModel_name() != null) {
                csn.setModel_name(array.getModel_name()[i]);
            }

            csn.setSerialno(array.getSerialno()[i]);
            csn.setCust_id(customer.getId());
            insertService.insert(csn);
        }

        return mav;
    }

    @RequestMapping("editCustomer")
    public ModelAndView editCustomer(
            @RequestParam(value = "id", required = true) String id
    ) {
        ModelAndView mav = new ModelAndView("EditCustomer");
        mav.addObject("customerdt", viewService.getanyjdbcdatalist("select * from m_customers where id='" + id + "'").get(0));
        mav.addObject("customerserialdt", viewService.getanyjdbcdatalist("select * from m_cust_serial_no where cust_id='" + id + "' and isdelete<>'Y'"));
        return mav;
    }

    @RequestMapping("updateCustomer")
    public ModelAndView updateCustomer(@ModelAttribute Customer customer,
            @ModelAttribute CustomerSerialNoArray array,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewCustomerGrid");
        updateService.update(customer);
        for (int i = 0; array.getOldserialno() != null && i < array.getOldserialno().length; i++) {
            CustomerSerialNo csn = new CustomerSerialNo();
            csn.setId(Long.parseLong(array.getCsn_id()[i].toString()));

            if (array.getOldproduct_name() != null) {
                csn.setProduct_name(array.getOldproduct_name()[i]);
            }
            if (array.getOldmodel_name() != null) {
                csn.setModel_name(array.getOldmodel_name()[i]);
            }

            csn.setSerialno(array.getOldserialno()[i]);
            csn.setCust_id(customer.getId());
            updateService.update(csn);
        }
        for (int i = 0; array.getSerialno() != null && i < array.getSerialno().length; i++) {
            CustomerSerialNo csn = new CustomerSerialNo();

            if (array.getProduct_name() != null) {
                csn.setProduct_name(array.getProduct_name()[i]);
            }
            if (array.getModel_name() != null) {
                csn.setModel_name(array.getModel_name()[i]);
            }

            csn.setSerialno(array.getSerialno()[i]);
            csn.setCust_id(customer.getId());
            insertService.insert(csn);
        }
        return mav;
    }

    //getAjaxCustSerials
    @RequestMapping(value = "getAjaxCustSerials")
    public void getAjaxCustSerials(@RequestParam(value = "custid") String custid,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        List<CustomerSerialNo> typeList = viewService.getanyhqldatalist("from m_cust_serial_no where cust_id='" + custid + "' and isdelete='N'");
        jsondata = new Gson().toJson(typeList);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

    @RequestMapping(value = "insertAjaxCustSerials")
    public void insertAjaxCustSerials(
            @RequestParam(value = "custid") String custid,
            @RequestParam(value = "model") String model,
            @RequestParam(value = "prdname") String prdname,
            @RequestParam(value = "serial") String serial,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        Map<String, Object> output = new HashMap<>();
        if (custid != null && !custid.equals("")) {
            List<Map<String, Object>> chkSerial = viewService.getanyjdbcdatalist("select * from m_cust_serial_no where cust_id='" + custid + "' and serialno='" + serial + "' and isdelete <>'Y'");
            boolean insertFlag = true;
            if (chkSerial != null && chkSerial.size() > 0) {
                insertFlag = false;
                output.put("result", "duplicate");
            }
            if (insertFlag) {
                CustomerSerialNo csn = new CustomerSerialNo();
                csn.setCust_id(Long.parseLong(custid));
                csn.setModel_name(model);
                csn.setProduct_name(prdname);
                csn.setSerialno(serial);
                insertService.insert(csn);
                output.put("result", "inserted");
                output.put("serialid", csn.getId());
                output.put("serial", csn.getSerialno());
            }
        }
        jsondata = new Gson().toJson(output);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

    @RequestMapping(value = "chkAjaxCustContact")
    public void chkAjaxCustContact(
            @RequestParam(value = "custid", required = false) String custid,
            @RequestParam(value = "contactno") String contactno,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        String query = "";
        query = "select * from m_customers where contact_no='" + contactno + "' and isdelete<>'Y' ";
        if (custid != null && !custid.equals("")) {
            query += " and id not in ('" + custid + "')";
        }
        List<Map<String, Object>> custlst = viewService.getanyjdbcdatalist(query);
        Map<String, Object> output = new HashMap<>();
        if (custlst != null && custlst.size() > 0) {
            output.put("result", "duplicate");
        } else {
            output.put("result", "");
        }
        jsondata = new Gson().toJson(output);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

    @RequestMapping(value = "updateAjaxDeleteCustomer")
    public void updateAjaxDeleteCustomer(@RequestParam(value = "cid") String cid,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        updateService.updateanyjdbcdatalist("update m_customers set isdelete='Y',modifydate=now() where id='" + cid + "'");
        jsondata = new Gson().toJson("deleted");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

}
