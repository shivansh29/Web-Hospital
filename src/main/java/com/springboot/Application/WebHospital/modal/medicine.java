package com.springboot.Application.WebHospital.modal;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class medicine {

@Id  
private String name;
private int Quantity;
private String Price;
private String URL;
private Date mfg;
private Date exp;
private String Prescription;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public Date getMfg() {
        return mfg;
    }

    public void setMfg(Date mfg) {
        this.mfg = mfg;
    }

    public Date getExp() {
        return exp;
    }

    public void setExp(Date exp) {
        this.exp = exp;
    }

    public String getPrescription() {
        return Prescription;
    }

    public void setPrescription(String Prescription) {
        this.Prescription = Prescription;
    }
}
