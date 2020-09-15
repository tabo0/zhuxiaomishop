package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;

public interface ProductTypeService {
    public PageBean<Producttype> getAllProductTypeByPage(int page, int pagesize);
}
