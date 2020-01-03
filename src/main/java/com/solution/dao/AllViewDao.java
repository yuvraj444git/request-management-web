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
public interface AllViewDao<T> {

    public List<T> getanyhqldatalist(String query);

    public T getspecifichqldata(Class clazz, Object pk);

    public List<Map<String, Object>> getanyjdbcdatalist(String query);
    
    public int Get_Record_Count(String query);
    
    public int Get_Page_Count(String query, int PageSize);    
}
