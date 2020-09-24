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
    //private int getRowCount(){
//        return productTypeMapper.getRowCount();
//    }
    @Override
    public PageBean<Producttype> getAllProductTypeByPage(int page, int pagesize,int typeId,String typeName) {
        List<Producttype> list=productTypeMapper.getProductTypeBypage(page,pagesize,typeId,typeName);
        PageBean<Producttype> pb=new PageBean<>();
        pb.setPage(page);
        pb.setList(list);
        int rowcount=rowcount(typeId,typeName);
        pb.setRowcount(rowcount);
        //System.out.println("+++++="+rowcount);
//        for(Producttype i :list){
//            System.out.println(i.getName());
//        }
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

    @Override
    public Producttype selectProductTypeById(int id) {
        return productTypeMapper.selectProductTypeById(id);
    }

    @Override
    public int updateProductType(Producttype pt) {
        return productTypeMapper.updateProductType(pt);
    }

    @Override
    public int addProtype(Producttype pt) {
        return productTypeMapper.addProtype(pt);
    }

    @Override
    public int delProductType(int id) {
        return productTypeMapper.delProductType(id);
    }

    private int rowcount(int typeId,String typeName){
        return productTypeMapper.getRowCount(typeId,typeName);
    }
}
