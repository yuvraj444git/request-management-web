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
public class ServiceInwardCheckArray {

    private String[] sic_id, component, description;
    private String[] oldcomponent, olddescription;

    public ServiceInwardCheckArray() {
    }

    public ServiceInwardCheckArray(String[] sic_id, String[] component, String[] description, String[] oldcomponent, String[] olddescription) {
        this.sic_id = sic_id;
        this.component = component;
        this.description = description;
        this.oldcomponent = oldcomponent;
        this.olddescription = olddescription;
    }

    public String[] getSic_id() {
        return sic_id;
    }

    public void setSic_id(String[] sic_id) {
        this.sic_id = sic_id;
    }

    public String[] getComponent() {
        return component;
    }

    public void setComponent(String[] component) {
        this.component = component;
    }

    public String[] getDescription() {
        return description;
    }

    public void setDescription(String[] description) {
        this.description = description;
    }

    public String[] getOldcomponent() {
        return oldcomponent;
    }

    public void setOldcomponent(String[] oldcomponent) {
        this.oldcomponent = oldcomponent;
    }

    public String[] getOlddescription() {
        return olddescription;
    }

    public void setOlddescription(String[] olddescription) {
        this.olddescription = olddescription;
    }

}
