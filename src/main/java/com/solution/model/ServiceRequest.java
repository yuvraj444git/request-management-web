/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solution.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity(name = "t_service_request")
@Table(name = "t_service_request")
public class ServiceRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String request_date, ref_id, financial_year, service_status, amount;
    private long cust_id, cust_prd_serial_id, addedby;

    private String issue_by_cust, condtion_product, accessories_recd, action_by_engg, engg_date, engg_id, isdelete = "N";

    private String modifydate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

    private String prdtype;

    public String getPrdtype() {
        return prdtype;
    }

    public void setPrdtype(String prdtype) {
        this.prdtype = prdtype;
    }

    public String getModifydate() {
        return modifydate;
    }

    public void setModifydate(String modifydate) {
        this.modifydate = modifydate;
    }

    public ServiceRequest() {
    }

    public String getEngg_id() {
        return engg_id;
    }

    public void setEngg_id(String engg_id) {
        this.engg_id = engg_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRequest_date() {
        return request_date;
    }

    public void setRequest_date(String request_date) {
        this.request_date = request_date;
    }

    public String getRef_id() {
        return ref_id;
    }

    public void setRef_id(String ref_id) {
        this.ref_id = ref_id;
    }

    public String getFinancial_year() {
        return financial_year;
    }

    public void setFinancial_year(String financial_year) {
        this.financial_year = financial_year;
    }

    public String getService_status() {
        return service_status;
    }

    public void setService_status(String service_status) {
        this.service_status = service_status;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public long getCust_id() {
        return cust_id;
    }

    public void setCust_id(long cust_id) {
        this.cust_id = cust_id;
    }

    public long getCust_prd_serial_id() {
        return cust_prd_serial_id;
    }

    public void setCust_prd_serial_id(long cust_prd_serial_id) {
        this.cust_prd_serial_id = cust_prd_serial_id;
    }

    public long getAddedby() {
        return addedby;
    }

    public void setAddedby(long addedby) {
        this.addedby = addedby;
    }

    public String getIssue_by_cust() {
        return issue_by_cust;
    }

    public void setIssue_by_cust(String issue_by_cust) {
        this.issue_by_cust = issue_by_cust;
    }

    public String getCondtion_product() {
        return condtion_product;
    }

    public void setCondtion_product(String condtion_product) {
        this.condtion_product = condtion_product;
    }

    public String getAccessories_recd() {
        return accessories_recd;
    }

    public void setAccessories_recd(String accessories_recd) {
        this.accessories_recd = accessories_recd;
    }

    public String getAction_by_engg() {
        return action_by_engg;
    }

    public void setAction_by_engg(String action_by_engg) {
        this.action_by_engg = action_by_engg;
    }

    public String getEngg_date() {
        return engg_date;
    }

    public void setEngg_date(String engg_date) {
        this.engg_date = engg_date;
    }

    public String getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(String isdelete) {
        this.isdelete = isdelete;
    }

}
