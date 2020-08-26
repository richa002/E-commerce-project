/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Acer
 */
public class Product {
    private String catagory;
    private String name;
    private int quantity;
    private int price;
    private String image;
    private String feature;
    private String image1;
    private String image2;
    private String pid;
    private int newprice;
    private int discount;
  private String homepage;

    @Override
    public String toString() {
        return "Product{" + "catagory=" + catagory + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", image=" + image + ", feature=" + feature + ", image1=" + image1 + ", image2=" + image2 + ", pid=" + pid + ", newprice=" + newprice + ", discount=" + discount + ", homepage=" + homepage + '}';
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }
    public int getNewprice() {
        return newprice;
    
    }
    public void setNewprice(int newprice) {
        this.newprice = newprice;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }
    
    
}
