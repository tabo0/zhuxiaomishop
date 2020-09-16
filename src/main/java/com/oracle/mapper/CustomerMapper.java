package com.oracle.mapper;

import com.oracle.entity.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    public int customerRegister(@Param("cname") String cname,@Param("cpass") String cpass);
    public int checkCname(@Param("cname")String cname);
    public Customer customerLogin(@Param("cname") String cname,@Param("cpass") String cpass);
}
