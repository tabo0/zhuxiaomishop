package com.oracle.mapper;

import com.oracle.entity.Producttype;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductTypeMapper {
    List<Producttype> getProductTypeBypage(@Param("page")int page,@Param("pagesize")int pagesize,
                                           @Param("typeId")int typeId,@Param("typeName") String typeName);
    int getRowCount(@Param("typeId")int typeId,@Param("typeName") String typeName);
    List<Producttype> getAll();
}
