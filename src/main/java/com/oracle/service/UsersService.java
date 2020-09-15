package com.oracle.service;


import java.util.HashMap;

public interface UsersService {
    public HashMap<String,Object>  login(String uname, String upass);
}
