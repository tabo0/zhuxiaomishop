package com.oracle.service.impl;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.mapper.ProductTypeMapper;
import com.oracle.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class ProductTypeServiceImpl  implements ProductTypeService {
    @Autowired
    ProductTypeMapper productTypeMapper;
    private int getRowCount(){
        return productTypeMapper.getRowCount();
    }
    @Override
    public PageBean<Producttype> getAllProductTypeByPage(int page, int pagesize) {
        List<Producttype> list=productTypeMapper.getProductTypeBypage(page,pagesize);
        PageBean<Producttype> pb=new PageBean<>();
        pb.setPage(page);
        pb.setList(list);
        int rowcount=rowcount();
        System.out.println("+++++="+rowcount);
        for(Producttype i :list){
            System.out.println(i.getName());
        }
        System.out.println(list);
        if(rowcount%pagesize==0){
            pb.setPages(rowcount/pagesize);
        }else{
            pb.setPages(rowcount/pagesize+1);
        }

        return pb;
    }

    @Override
    public List<Producttype> getAllProductType() {
        return productTypeMapper.getAll();
    }

    private int rowcount(){
        return productTypeMapper.getRowCount();
    }
}
