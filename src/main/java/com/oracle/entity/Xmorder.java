package com.oracle.entity;
public class Xmorder {
    private String oid;
    private Integer customerid;
    private Integer addressid;
    private Double totalprice;
    private String remarks;
    private String status;
    private java.util.Date odate;
    public Xmorder() {
        super();
    }
    public Xmorder(String oid,Integer customerid,Integer addressid,Double totalprice,String remarks,String status,java.util.Date odate) {
        super();
        this.oid = oid;
        this.customerid = customerid;
        this.addressid = addressid;
        this.totalprice = totalprice;
        this.remarks = remarks;
        this.status = status;
        this.odate = odate;
    }
    public String getOid() {
        return this.oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Integer getCustomerid() {
        return this.customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getAddressid() {
        return this.addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Double getTotalprice() {
        return this.totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public java.util.Date getOdate() {
        return this.odate;
    }

    public void setOdate(java.util.Date odate) {
        this.odate = odate;
    }

}
