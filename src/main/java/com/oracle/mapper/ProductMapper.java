package com.oracle.mapper;

import com.oracle.entity.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ProductMapper {
    public HashMap<String,Object> getAllProduct();
    public List<HashMap<String,Object>> getAllProductByPage(@Param("page") int page,@Param("pagesize") int pagesize);
    public int getRowCount();
}
