package com.oracle.service.impl;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;
import com.oracle.mapper.ProductMapper;
import com.oracle.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public HashMap<String, Object> getAllProduct() {
        return productMapper.getAllProduct();
    }

    @Override
    public PageBean<HashMap<String, Object>> getAllProductByPage(int page,int pagesize,String name,int typeid) {
        List<HashMap<String,Object>> list=productMapper.getAllProductByPage(page,pagesize,name,typeid);
        PageBean<HashMap<String ,Object>> pb=new PageBean<>();
        pb.setPage(page);
        pb.setList(list);
        int rowcount=rowcount(name,typeid);
        if(rowcount%pagesize==0){
            pb.setPages(rowcount/pagesize);
        }else{
            pb.setPages(rowcount/pagesize+1);
        }

        return pb;
    }

    @Override
    public Product getProductById(int id) {
        return productMapper.getProductById(id);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateProduct(product);
    }

    @Override
    public List<Product> getFiveProducts() {
        return productMapper.getFiveProducts();
    }

    @Override
    public int delProduct(int id) {
        return productMapper.delProduct(id);
    }

    @Override
    public Product getProductDetail(int id) {
        return productMapper.getProductDetail(id);
    }

    @Override
    public int delBatchProduct(int[] ids) {
        return productMapper.delBatchProduct(ids);
    }

    private int rowcount(String name,int typeid){
        return productMapper.getRowCount(name,typeid);
    }
}
