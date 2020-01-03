/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.solution.service;

import com.solution.dao.AllInsertDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author raj45
 */
@Service
public class AllInsertServiceIMPL implements AllInsertService{
    @Autowired AllInsertDao insertDao;

    @Transactional
    public void insert(Object entity) {
        insertDao.insert(entity);
    }

    @Transactional
    public String getmaxcount(String tablename, String columnname, int substringof) {
        return insertDao.getmaxcount(tablename, columnname, substringof);
    }

    @Override
    public int setanyjdbcdatalist(String query) {
        return insertDao.setanyjdbcdatalist(query);
    }
    
}
