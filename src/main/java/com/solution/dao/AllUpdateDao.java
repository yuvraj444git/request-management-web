/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.solution.dao;

/**
 *
 * @author raj45
 */
public interface AllUpdateDao<T> {
    public void update(T entity);
    
    public void updateanyhqlquery(String query);
    
    public int updateanyjdbcdatalist(String query);
}
