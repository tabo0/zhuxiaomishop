package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @RequestMapping(value = "/getprobypage",method = RequestMethod.GET)
    public String showproduct(@RequestParam(name="page",defaultValue="1")int page,Model model){
        int pagesize=5;
        PageBean<HashMap<String,Object>> products=productService.getAllProductByPage(page,pagesize);
        model.addAttribute("products",products);
        return "product";
    }
}
