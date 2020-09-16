package com.oracle.controller;

import com.oracle.service.CarShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class CarShopController {
    @Autowired
    private CarShopService carShopService;
    @RequestMapping(value = "/addcarshop")
    public String addCarShop(int customerid,int pid,int numbers){
        carShopService.addCarShop(customerid,pid,numbers);
        return "redirect:showcarshopbycustomerid?customerid="+customerid;
    }
    @RequestMapping(value = "/showcarshopbycustomerid")
    public String ShowCarShop(int customerid, Model model){
        List<HashMap<String,Object>> carlist=carShopService.getCarShop(customerid);
        model.addAttribute("carlist",carlist);
        return "carshop";
    }
    @RequestMapping(value = "/deletecarshop")
    public String delCarShop(int cid,int customerid){
        carShopService.delCarShopByCidAndCustomerId(cid,customerid);
        return "redirect:showcarshopbycustomerid?customerid="+customerid;
    }

}
