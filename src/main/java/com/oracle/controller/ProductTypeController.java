package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
public class ProductTypeController {
    @Autowired
    ProductTypeService productTypeService;
    @RequestMapping("/toproducttypepage")
    public String getProductTypeByPage(@RequestParam(name="page",defaultValue = "1")int page, Model model){
        int pagesize=5;
        PageBean<Producttype> producttypes=productTypeService.getAllProductTypeByPage(page,pagesize);
        model.addAttribute("producttypes",producttypes);
        return "producttype";
    }
}
