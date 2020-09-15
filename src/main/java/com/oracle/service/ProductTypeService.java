package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;

import java.util.List;

public interface ProductTypeService {
    public PageBean<Producttype> getAllProductTypeByPage(int page, int pagesize);
    public List<Producttype> getAllProductType();
}
