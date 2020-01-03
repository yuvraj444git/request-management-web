/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.model;

/**
 *
 * @author ADMIN
 */
public class CustomerSerialNoArray {

    private String[] csn_id, oldserialno,oldproduct_name,oldmodel_name;
    private String[] serialno,product_name,model_name;

    public CustomerSerialNoArray() {
    }

    public String[] getCsn_id() {
        return csn_id;
    }

    public void setCsn_id(String[] csn_id) {
        this.csn_id = csn_id;
    }

    public String[] getOldserialno() {
        return oldserialno;
    }

    public void setOldserialno(String[] oldserialno) {
        this.oldserialno = oldserialno;
    }

    public String[] getSerialno() {
        return serialno;
    }

    public void setSerialno(String[] serialno) {
        this.serialno = serialno;
    }

    public String[] getOldproduct_name() {
        return oldproduct_name;
    }

    public void setOldproduct_name(String[] oldproduct_name) {
        this.oldproduct_name = oldproduct_name;
    }

    public String[] getOldmodel_name() {
        return oldmodel_name;
    }

    public void setOldmodel_name(String[] oldmodel_name) {
        this.oldmodel_name = oldmodel_name;
    }

    public String[] getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String[] product_name) {
        this.product_name = product_name;
    }

    public String[] getModel_name() {
        return model_name;
    }

    public void setModel_name(String[] model_name) {
        this.model_name = model_name;
    }

}
