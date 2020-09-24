package com.oracle.service;


import com.oracle.entity.PageBean;
import com.oracle.entity.Role;
import com.oracle.entity.Users;

import java.util.HashMap;
import java.util.List;

public interface UsersService {
    public HashMap<String,Object>  login(String uname, String upass);
    PageBean<HashMap<String, Object>> getAllUsersByPage(int page, int pagesize, String uname, int roleid);

    //获取员工类型
    List<Role> getAllRole();

    //删除员工
    int delUsers(int uid);

    //批量删除
    int delBatchUsers(int[] uids);

    //添加员工
    int addUsers(Users users);

    //通过id获取员工信息
    Users getUsersById(int uid);

    //修改员工信息
    int updateUsers(Users users);
}
