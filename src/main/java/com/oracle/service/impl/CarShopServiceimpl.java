package com.oracle.service.impl;

import com.oracle.mapper.CarShopMapper;
import com.oracle.service.CarShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CarShopServiceimpl implements CarShopService {
    @Autowired
    CarShopMapper carShopMapper;
    @Override
    public int addCarShop(int customerid, int pid, int numbers) {
        int count=carShopMapper.getCarShopByCustomerIdAndPid(customerid,pid);
        if(count==0){
            carShopMapper.addCarShop(customerid,pid,numbers);
        }else {
            carShopMapper.updateCarShopByCustomerIdAndPid(customerid,pid,numbers);
        }
        return 1;
    }

    @Override
    public List<HashMap<String, Object>> getCarShop(int customerid) {
        return carShopMapper.getCarShop(customerid);
    }

    @Override
    public int delCarShopByCidAndCustomerId(int cid, int customerid) {
        return carShopMapper.delCarShopByCidAndCustomerId(cid,customerid);
    }
}
