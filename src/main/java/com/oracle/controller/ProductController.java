package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;
import com.oracle.entity.Producttype;
import com.oracle.service.ProductService;
import com.oracle.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;
    @RequestMapping(value = "/getprobypage",method = RequestMethod.GET)
    public String showproduct(@RequestParam(name="page",defaultValue="1")int page,String name,Model model,
                              @RequestParam(name="typeid",defaultValue="-1")int typeid){
        int pagesize=5;
        PageBean<HashMap<String,Object>> products=productService.getAllProductByPage(page,pagesize,name,typeid);
        List<Producttype> ptlist=productTypeService.getAllProductType();
        model.addAttribute("ptlist",ptlist);
        model.addAttribute("products",products);
        model.addAttribute("name",name);
        model.addAttribute("typeid",typeid);
        return "product";
    }
    @RequestMapping(value = "/addproductpage",method = RequestMethod.GET)
    public String toAddProductPage(Model model){
        List<Producttype> list=productTypeService.getAllProductType();
        model.addAttribute("ptlist",list);
        return "addproduct";
    }
    @RequestMapping(value = "/getproductbyid",method = RequestMethod.GET)
    public String getProductById(int id,Model model){
        Product product=productService.getProductById(id);
        model.addAttribute("product",product);
        List<Producttype> list=productTypeService.getAllProductType();
        model.addAttribute("ptlist",list);
        return "updateproduct";
    }
    @RequestMapping(value = "/updateproduct",method = RequestMethod.POST)
    public String getProductById(Product product){
        product.setDate(new Date());
        productService.updateProduct(product);
        return "rediret:getprobypage";
    }
}
