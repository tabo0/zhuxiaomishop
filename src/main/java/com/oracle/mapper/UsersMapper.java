package com.oracle.mapper;

import com.oracle.entity.PageBean;
import com.oracle.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UsersMapper {
    public HashMap<String,Object> login(@Param("uname")String uname, @Param("upass")String upass);
    public  int getRowCount();
    public List<Users> getUsers(@Param("page")int currentPage, @Param("pagesize")int pageSize);
}
