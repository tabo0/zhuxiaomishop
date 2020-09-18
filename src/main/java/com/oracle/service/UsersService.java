package com.oracle.service;


import com.oracle.entity.PageBean;
import com.oracle.entity.Users;

import java.util.HashMap;

public interface UsersService {
    public HashMap<String,Object>  login(String uname, String upass);
    public PageBean<Users> getUsers(int currentPage, int pageSize);
}
