/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.controller;

import com.google.gson.Gson;
import com.solution.model.ServiceReqTask;
import com.solution.service.AllInsertService;
import com.solution.service.AllUpdateService;
import com.solution.service.AllViewService;
import java.io.IOException;
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
public class ControllerServiceTask {

    @Autowired
    AllViewService viewService;

    @Autowired
    AllInsertService insertService;

    @Autowired
    AllUpdateService updateService;

    @RequestMapping(value = "ajaxInsertServiceTask")
    public void ajaxInsertServiceTask(
            @ModelAttribute ServiceReqTask serviceReqTask,
            HttpSession session,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        serviceReqTask.setAddedby(Long.parseLong(session.getAttribute("USERID").toString()));
        insertService.insert(serviceReqTask);
        jsondata = new Gson().toJson("inserted");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

    @RequestMapping(value = "getAjaxServicePrvTask")
    public void getAjaxServicePrvTask(@RequestParam(value = "serviceid") String serviceid,
            HttpServletResponse response) throws IOException {
        String jsondata = "";
        List<Map<String, Object>> typeList = viewService.getanyjdbcdatalist("select st.*,u.name addedbyname from t_service_task st inner join m_userdetails u on u.id=st.addedby where st.serviceid='" + serviceid + "' and st.isdelete='N'");
        jsondata = new Gson().toJson(typeList);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsondata);
    }

}
