package com.oracle.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface CarShopMapper {
    int addCarShop(@Param("customerid") int customerid,@Param("pid")int pid,@Param("numbers")int numbers);
    int getCarShopByCustomerIdAndPid(@Param("customerid") int customerid,@Param("pid") int pid );
    int updateCarShopByCustomerIdAndPid(@Param("customerid") int customerid,@Param("pid")int pid,@Param("numbers")int numbers );
    List<HashMap<String,Object>> getCarShop(@Param("customerid") int customerid);
    int delCarShopByCidAndCustomerId(@Param("cid")int cid,@Param("customerid") int customerid);
}
