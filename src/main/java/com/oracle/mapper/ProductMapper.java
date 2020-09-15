package com.oracle.mapper;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ProductMapper {
    public HashMap<String,Object> getAllProduct();
    public List<HashMap<String,Object>> getAllProductByPage(@Param("page") int page,@Param("pagesize") int pagesize,
                                                            @Param("name") String name,@Param("typeid")int typeid);
    public int getRowCount(@Param("name") String name,@Param("typeid")int typeid);
    public Product getProductById(@Param("id") int id);
    public int updateProduct(Product product);
}
