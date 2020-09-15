package com.oracle.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.HashMap;

public interface UsersMapper {
    public HashMap<String,Object> login(@Param("uname")String uname, @Param("upass")String upass);
}
