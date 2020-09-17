package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;

import java.util.List;

public interface ProductTypeService {
    public PageBean<Producttype> getAllProductTypeByPage(int page, int pagesize,int typeId,String typeName);
    public List<Producttype> getAllProductType();
    public Producttype selectProductTypeById(int id);
    public int updateProductType(Producttype pt);
    public int addProtype(Producttype pt);
}
