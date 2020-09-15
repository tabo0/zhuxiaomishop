package com.oracle.entity;
public class Orderdetail {
    private Integer odid;
    private String oid;
    private Integer pid;
    private Integer pnumber;
    private Double ptotal;
    public Orderdetail() {
        super();
    }
    public Orderdetail(Integer odid,String oid,Integer pid,Integer pnumber,Double ptotal) {
        super();
        this.odid = odid;
        this.oid = oid;
        this.pid = pid;
        this.pnumber = pnumber;
        this.ptotal = ptotal;
    }
    public Integer getOdid() {
        return this.odid;
    }

    public void setOdid(Integer odid) {
        this.odid = odid;
    }

    public String getOid() {
        return this.oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Integer getPid() {
        return this.pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPnumber() {
        return this.pnumber;
    }

    public void setPnumber(Integer pnumber) {
        this.pnumber = pnumber;
    }

    public Double getPtotal() {
        return this.ptotal;
    }

    public void setPtotal(Double ptotal) {
        this.ptotal = ptotal;
    }

}
