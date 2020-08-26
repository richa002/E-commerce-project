/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Acer
 */
public class Offerbean {

    public String getOfferid() {
        return offerid;
    }

    public void setOfferid(String offerid) {
        this.offerid = offerid;
    }
    private String offerid;
    private  String offername;
    private int discount;
    private String catagory;
    private String image;
    private Date startdate;
    
   
    private Date lastdate; 
    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }
    
   
    public String getOffername() {
        return offername;
    }

    public void setOffername(String offername) {
        this.offername = offername;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getCatagory() {
        return catagory;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}

