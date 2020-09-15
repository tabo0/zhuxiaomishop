package com.oracle.entity;
public class Customer {
    private Integer cid;
    private String cname;
    private String cpass;
    private String csex;
    private Integer cage;
    private String realname;
    private String phone;
    public Customer() {
        super();
    }
    public Customer(Integer cid,String cname,String cpass,String csex,Integer cage,String realname,String phone) {
        super();
        this.cid = cid;
        this.cname = cname;
        this.cpass = cpass;
        this.csex = csex;
        this.cage = cage;
        this.realname = realname;
        this.phone = phone;
    }
    public Integer getCid() {
        return this.cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return this.cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCpass() {
        return this.cpass;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public String getCsex() {
        return this.csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public Integer getCage() {
        return this.cage;
    }

    public void setCage(Integer cage) {
        this.cage = cage;
    }

    public String getRealname() {
        return this.realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
