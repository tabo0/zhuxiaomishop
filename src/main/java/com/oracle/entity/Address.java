package com.oracle.entity;
public class Address {
    private Integer addressid;
    private Integer customerid;
    private String cnee;
    private String phone;
    private String address;
    public Address() {
        super();
    }
    public Address(Integer addressid,Integer customerid,String cnee,String phone,String address) {
        super();
        this.addressid = addressid;
        this.customerid = customerid;
        this.cnee = cnee;
        this.phone = phone;
        this.address = address;
    }
    public Integer getAddressid() {
        return this.addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getCustomerid() {
        return this.customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getCnee() {
        return this.cnee;
    }

    public void setCnee(String cnee) {
        this.cnee = cnee;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
