package com.oracle.service;

import com.oracle.entity.PageBean;

import java.util.HashMap;

public interface ProductService {
    public HashMap<String,Object> getAllProduct();
    public PageBean<HashMap<String,Object>> getAllProductByPage(int page,int pagesize);
}
