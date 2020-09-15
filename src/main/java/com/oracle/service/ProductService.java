package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;

import java.util.HashMap;

public interface ProductService {
    public HashMap<String,Object> getAllProduct();
    public PageBean<HashMap<String,Object>> getAllProductByPage(int page,int pagesize,String name,int typeid);
    public Product getProductById(int id);
    public int updateProduct(Product product);
}
