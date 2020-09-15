package com.oracle.entity;
public class Product {
    private Integer id;
    private String name;
    private String content;
    private Integer price;
    private String image;
    private Integer number;
    private Integer typeid;
    private java.util.Date date;
    public Product() {
        super();
    }
    public Product(Integer id,String name,String content,Integer price,String image,Integer number,Integer typeid,java.util.Date date) {
        super();
        this.id = id;
        this.name = name;
        this.content = content;
        this.price = price;
        this.image = image;
        this.number = number;
        this.typeid = typeid;
        this.date = date;
    }
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getPrice() {
        return this.price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getNumber() {
        return this.number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getTypeid() {
        return this.typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public java.util.Date getDate() {
        return this.date;
    }

    public void setDate(java.util.Date date) {
        this.date = date;
    }

}
