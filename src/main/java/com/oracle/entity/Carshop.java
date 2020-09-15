package com.oracle.entity;
public class Carshop {
    private Integer id;
    private Integer customerid;
    private Integer productid;
    private Integer numbers;
    public Carshop() {
        super();
    }
    public Carshop(Integer id,Integer customerid,Integer productid,Integer numbers) {
        super();
        this.id = id;
        this.customerid = customerid;
        this.productid = productid;
        this.numbers = numbers;
    }
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerid() {
        return this.customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getProductid() {
        return this.productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getNumbers() {
        return this.numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

}
