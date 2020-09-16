package com.oracle.service;

import java.util.HashMap;
import java.util.List;

public interface CarShopService {
    int addCarShop(int customerid,int pid,int numbers);
    List<HashMap<String,Object>> getCarShop(int customerid);
    int delCarShopByCidAndCustomerId(int cid,int customerid);
}
