/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.solution.service;

import com.solution.dao.AllViewDao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author raj45
 */
@Service
public class AllViewServiceIMPL implements AllViewService{
    @Autowired AllViewDao viewDao;

    @Transactional
    public List getanyhqldatalist(String query) {
       return viewDao.getanyhqldatalist(query);
    }

    @Transactional
    public Object getspecifichqldata(Class clazz, Object pk) {
        return viewDao.getspecifichqldata(clazz, pk);
    }

    @Override
    public List<Map<String,Object>> getanyjdbcdatalist(String query) {
        return viewDao.getanyjdbcdatalist(query);
    }

    @Transactional
    public int Get_Record_Count(String query){
        return viewDao.Get_Record_Count(query);
    }
   
    @Transactional
    public int Get_Page_Count(String query, int PageSize){
        return viewDao.Get_Page_Count(query, PageSize);
    }

    
}
