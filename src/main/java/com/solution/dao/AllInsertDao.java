/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.dao;

import java.util.List;
import java.util.Map;

/**
 *
 * @author raj45
 */
public interface AllInsertDao<T> {

    public void insert(T entity);

    public String getmaxcount(String tablename, String columnname, int substringof);

    public int setanyjdbcdatalist(String query);
}
