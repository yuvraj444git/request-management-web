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
@Entity(name = "t_service_spare")
@Table(name = "t_service_spare")
public class ServiceSpareParts {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private long service_id, addedby;
    private String qty;
    private String partno, part_desc, defective_serial, replaced_serial, isdelete = "N";
    private String modifydate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

    public ServiceSpareParts() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getService_id() {
        return service_id;
    }

    public void setService_id(long service_id) {
        this.service_id = service_id;
    }

    public long getAddedby() {
        return addedby;
    }

    public void setAddedby(long addedby) {
        this.addedby = addedby;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    public String getPartno() {
        return partno;
    }

    public void setPartno(String partno) {
        this.partno = partno;
    }

    public String getPart_desc() {
        return part_desc;
    }

    public void setPart_desc(String part_desc) {
        this.part_desc = part_desc;
    }

    public String getDefective_serial() {
        return defective_serial;
    }

    public void setDefective_serial(String defective_serial) {
        this.defective_serial = defective_serial;
    }

    public String getReplaced_serial() {
        return replaced_serial;
    }

    public void setReplaced_serial(String replaced_serial) {
        this.replaced_serial = replaced_serial;
    }

    public String getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(String isdelete) {
        this.isdelete = isdelete;
    }

    public String getModifydate() {
        return modifydate;
    }

    public void setModifydate(String modifydate) {
        this.modifydate = modifydate;
    }

}
