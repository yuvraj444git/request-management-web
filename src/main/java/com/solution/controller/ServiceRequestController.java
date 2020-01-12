/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.google.gson.Gson;
import com.solution.model.ServiceInwardCheck;
import com.solution.model.ServiceInwardCheckArray;
import com.solution.model.ServiceRequest;
import com.solution.model.ServiceSpareParts;
import com.solution.model.ServiceSparePartsArray;
import com.solution.service.AllInsertService;
import com.solution.service.AllUpdateService;
import com.solution.service.AllViewService;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class ServiceRequestController {

    @Autowired
    AllViewService viewService;

    @Autowired
    AllInsertService insertService;

    @Autowired
    AllUpdateService updateService;

    @RequestMapping("viewServiceRequestGrid")
    public ModelAndView viewEmployeeGrid(HttpSession session) {
        ModelAndView mav = new ModelAndView("ViewServiceRequestGrid");
        mav.addObject("servicerequestlist", viewService.getanyjdbcdatalist("select sr.*,c.name custname,c.contact_no,csn.serialno currserialno from t_service_request sr inner join m_customers c on sr.cust_id=c.id inner join m_cust_serial_no csn on sr.cust_prd_serial_id=csn.id where sr.isdelete<>'Y' order by id desc "));
        return mav;
    }

    @RequestMapping("addNewServiceRequest")
    public ModelAndView addNewServiceRequest(
            @RequestParam(value = "custid", required = false) String custid,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("AddServiceRequest");
        mav.addObject("customersdt", viewService.getanyjdbcdatalist("SELECT \n"
                + "    cust.*, GROUP_CONCAT(csn.serialno) allserials\n"
                + "FROM\n"
                + "    m_customers cust\n"
                + "        LEFT JOIN\n"
                + "    m_cust_serial_no csn ON csn.cust_id = cust.id\n"
                + "WHERE\n"
                + "    cust.isdelete <> 'Y'\n"
                + "GROUP BY cust.id"));
        if (custid != null && !custid.toString().equals("")) {
            mav.addObject("custselected", viewService.getanyjdbcdatalist("SELECT \n"
                    + "    cust.*, GROUP_CONCAT(csn.serialno) allserials\n"
                    + "FROM\n"
                    + "    m_customers cust\n"
                    + "        LEFT JOIN\n"
                    + "    m_cust_serial_no csn ON csn.cust_id = cust.id\n"
                    + "WHERE\n"
                    + "    cust.isdelete <> 'Y' and cust.id='" + custid + "'\n"
                    + "GROUP BY cust.id"));
        }
        return mav;
    }

    //insertServiceRequest
    @RequestMapping("insertServiceRequest")
    public ModelAndView insertServiceRequest(
            @ModelAttribute ServiceRequest serviceRequest,
            @ModelAttribute ServiceInwardCheckArray inwardCheckArray,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewServiceRequestGrid");
        serviceRequest.setService_status("Inward");
        String pid = "AVR" + insertService.getmaxcount("t_service_request", "ref_id", 4);
        serviceRequest.setRef_id(pid);
        serviceRequest.setAddedby(Long.parseLong(session.getAttribute("USERID").toString()));
        insertService.insert(serviceRequest);

        for (int i = 0; inwardCheckArray.getComponent() != null && i < inwardCheckArray.getComponent().length; i++) {
            ServiceInwardCheck serviceInwardCheck = new ServiceInwardCheck();
            serviceInwardCheck.setService_id(serviceRequest.getId());
            serviceInwardCheck.setComponent(inwardCheckArray.getComponent()[i]);

            if (inwardCheckArray.getDescription() != null) {
                serviceInwardCheck.setDescription(inwardCheckArray.getDescription()[i]);
            }
            insertService.insert(serviceInwardCheck);
        }
        return mav;
    }

    //editServiceRequest
    @RequestMapping("editServiceRequest")
    public ModelAndView editServiceRequest(
            @RequestParam(value = "id") String serviceid,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("EditServiceRequest");
        mav.addObject("customersdt", viewService.getanyjdbcdatalist("SELECT \n"
                + "    cust.*, GROUP_CONCAT(csn.serialno) allserials\n"
                + "FROM\n"
                + "    m_customers cust\n"
                + "        LEFT JOIN\n"
                + "    m_cust_serial_no csn ON csn.cust_id = cust.id\n"
                + "WHERE\n"
                + "    cust.isdelete <> 'Y'\n"
                + "GROUP BY cust.id"));
        mav.addObject("servicerequest", viewService.getanyjdbcdatalist("SELECT \n"
                + "    sr.*,c.name custname,c.contact_no,c.address,csn.serialno,csn.product_name,csn.model_name\n"
                + "FROM\n"
                + "    t_service_request sr\n"
                + "        INNER JOIN\n"
                + "    m_customers c ON c.id = sr.cust_id\n"
                + "        INNER JOIN\n"
                + "    m_cust_serial_no csn ON csn.id = sr.cust_prd_serial_id\n"
                + "WHERE\n"
                + "    sr.isdelete <> 'Y' AND sr.id = '" + serviceid + "'").get(0));
        mav.addObject("servicerequestinward", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_inward_check\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        mav.addObject("servicespares", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_spare\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        mav.addObject("allcustserial", viewService.getanyjdbcdatalist("SELECT \n"
                + "    csn.*\n"
                + "FROM\n"
                + "    t_service_request sr\n"
                + "        INNER JOIN\n"
                + "    m_cust_serial_no csn ON csn.cust_id = sr.cust_id\n"
                + "WHERE\n"
                + "    sr.isdelete <> 'Y' AND sr.id = '" + serviceid + "'\n"
                + "        AND csn.isdelete <> 'Y'"));
        return mav;
    }

    @RequestMapping("updateServiceRequest")
    public ModelAndView updateServiceRequest(
            @ModelAttribute ServiceRequest serviceRequest,
            @ModelAttribute ServiceInwardCheckArray inwardCheckArray,
            @ModelAttribute ServiceSparePartsArray sparePartsArray,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:viewServiceRequestGrid");

//        String pid = "AVR" + insertService.getmaxcount("t_service_request", "ref_id", 4);
//        serviceRequest.setRef_id(pid);
        if (!serviceRequest.getAction_by_engg().toString().trim().equals("")) {
            if (serviceRequest.getService_status().equals("Inward")) {
                String modifydate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
                serviceRequest.setService_status("Inprogress");
                serviceRequest.setEngg_date(modifydate);
                serviceRequest.setEngg_id(session.getAttribute("USERID").toString());
            }
        }
        updateService.update(serviceRequest);

        for (int i = 0; inwardCheckArray.getSic_id() != null && i < inwardCheckArray.getSic_id().length; i++) {
            ServiceInwardCheck serviceInwardCheck = new ServiceInwardCheck();
            serviceInwardCheck.setId(Long.parseLong(inwardCheckArray.getSic_id()[i].toString()));
            serviceInwardCheck.setService_id(serviceRequest.getId());
            serviceInwardCheck.setComponent(inwardCheckArray.getOldcomponent()[i]);

            if (inwardCheckArray.getOlddescription() != null && inwardCheckArray.getOlddescription().length > i) {
                serviceInwardCheck.setDescription(inwardCheckArray.getOlddescription()[i]);
            }
            updateService.update(serviceInwardCheck);
        }
        for (int i = 0; inwardCheckArray.getComponent() != null && i < inwardCheckArray.getComponent().length; i++) {
            ServiceInwardCheck serviceInwardCheck = new ServiceInwardCheck();
            serviceInwardCheck.setService_id(serviceRequest.getId());
            serviceInwardCheck.setComponent(inwardCheckArray.getComponent()[i]);

            if (inwardCheckArray.getDescription() != null && inwardCheckArray.getDescription().length > i) {
                serviceInwardCheck.setDescription(inwardCheckArray.getDescription()[i]);
            }
            insertService.insert(serviceInwardCheck);
        }

        for (int i = 0; sparePartsArray.getOldsp_id() != null && i < sparePartsArray.getOldsp_id().length; i++) {
            ServiceSpareParts spareParts = new ServiceSpareParts();
            spareParts.setId(Long.parseLong(sparePartsArray.getOldsp_id()[i].toString()));
            spareParts.setService_id(serviceRequest.getId());
            spareParts.setPartno(sparePartsArray.getOldpartno()[i]);

            if (sparePartsArray.getOldpart_desc() != null && sparePartsArray.getOldpart_desc().length > i) {
                spareParts.setPart_desc(sparePartsArray.getOldpart_desc()[i]);
            }
            spareParts.setQty(sparePartsArray.getOldqty()[i]);
            spareParts.setDefective_serial(sparePartsArray.getOlddefective_serial()[i]);
            spareParts.setReplaced_serial(sparePartsArray.getOldreplaced_serial()[i]);
            spareParts.setAddedby(Long.parseLong(sparePartsArray.getSp_addedby()[i].toString()));
            updateService.update(spareParts);
        }
        for (int i = 0; sparePartsArray.getPartno() != null && i < sparePartsArray.getPartno().length; i++) {
            ServiceSpareParts spareParts = new ServiceSpareParts();
            spareParts.setService_id(serviceRequest.getId());
            spareParts.setPartno(sparePartsArray.getPartno()[i]);

            if (sparePartsArray.getPart_desc() != null && sparePartsArray.getPart_desc().length > i) {
                spareParts.setPart_desc(sparePartsArray.getPart_desc()[i]);
            }
            spareParts.setQty(sparePartsArray.getQty()[i]);
            spareParts.setDefective_serial(sparePartsArray.getDefective_serial()[i]);
            spareParts.setReplaced_serial(sparePartsArray.getReplaced_serial()[i]);
            spareParts.setAddedby(Long.parseLong(session.getAttribute("USERID").toString()));
            insertService.insert(spareParts);
        }
        return mav;
    }

    @RequestMapping("viewInwardSlip")
    public ModelAndView viewInwardSlip(
            @RequestParam(value = "id") String serviceid,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("ViewInwardSlip");
        mav.addObject("servicerequest", viewService.getanyjdbcdatalist("SELECT \n"
                + "    sr.*,c.name custname,c.contact_no,c.address,csn.serialno,csn.product_name,csn.model_name\n"
                + "FROM\n"
                + "    t_service_request sr\n"
                + "        INNER JOIN\n"
                + "    m_customers c ON c.id = sr.cust_id\n"
                + "        INNER JOIN\n"
                + "    m_cust_serial_no csn ON csn.id = sr.cust_prd_serial_id\n"
                + "WHERE\n"
                + "    sr.isdelete <> 'Y' AND sr.id = '" + serviceid + "'").get(0));
        mav.addObject("servicerequestinward", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_inward_check\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        mav.addObject("servicespares", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_spare\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        return mav;
    }

    @RequestMapping("viewOutwardSlip")
    public ModelAndView viewOutwardSlip(
            @RequestParam(value = "id") String serviceid,
            HttpSession session) {
        ModelAndView mav = new ModelAndView("ViewOutwardSlip");
        mav.addObject("servicerequest", viewService.getanyjdbcdatalist("SELECT \n"
                + "    sr.*,c.name custname,c.contact_no,c.address,csn.serialno,csn.product_name,csn.model_name\n"
                + "FROM\n"
                + "    t_service_request sr\n"
                + "        INNER JOIN\n"
                + "    m_customers c ON c.id = sr.cust_id\n"
                + "        INNER JOIN\n"
                + "    m_cust_serial_no csn ON csn.id = sr.cust_prd_serial_id\n"
                + "WHERE\n"
                + "    sr.isdelete <> 'Y' AND sr.id = '" + serviceid + "'").get(0));
        mav.addObject("servicerequestinward", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_inward_check\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        mav.addObject("servicespares", viewService.getanyjdbcdatalist("SELECT \n"
                + "    *\n"
                + "FROM\n"
                + "    t_service_spare\n"
                + "WHERE\n"
                + "    isdelete <> 'Y' AND service_id = '" + serviceid + "'"));
        return mav;
    }

    //getAjaxUpdateOutward
    @RequestMapping(value = "getAjaxUpdateOutward")
    public void getAjaxUpdateOutward(@RequestParam(value = "servicerequest") String servicerequest,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        updateService.updateanyjdbcdatalist("update t_service_request set service_status='Outward',modifydate=now() where id='" + servicerequest + "'");
        jsondata = new Gson().toJson("updated");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

}
