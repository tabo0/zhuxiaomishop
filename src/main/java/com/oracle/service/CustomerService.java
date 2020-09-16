package com.oracle.service;

import com.oracle.entity.Customer;
import com.oracle.entity.Product;

public interface CustomerService {
    public int customerRegister(String cname,String cpass);
    public int checkCname(String cname);
    public Customer customerLogin(String cname ,String cpass);
    //public Product getProductDetail(int id);
}
