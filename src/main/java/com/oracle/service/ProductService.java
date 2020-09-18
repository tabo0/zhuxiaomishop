package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;

public interface ProductService {
    public HashMap<String,Object> getAllProduct();
    public PageBean<HashMap<String,Object>> getAllProductByPage(int page,int pagesize,String name,int typeid);
    public Product getProductById(int id);
    public int updateProduct(Product product);
    public List<Product> getFiveProducts();
    public int delProduct(int id);
    public Product getProductDetail(int id);
    public int delBatchProduct(int[] ids);
    public  int addProduct(Product product);
}
