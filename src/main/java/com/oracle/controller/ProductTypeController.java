package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ProductTypeController {
    @Autowired
    ProductTypeService productTypeService;
//    @RequestMapping("/getproducttypepage")
//    public String getProductTypeByPage(@RequestParam(name="page",defaultValue = "1")int page, Model model){
//        int pagesize=5;
//        PageBean<Producttype> producttypes=productTypeService.getAllProductTypeByPage(page,pagesize);
//        model.addAttribute("producttypes",producttypes);
//        return "producttype";
//    }
    @RequestMapping("/toproducttypepage")
    public String toproducttypepage(){
        return "producttype";
    }
    @RequestMapping(value = "/producttype_list_ajax",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAjaxProductTypeByPage(@RequestParam Map<String,Object> map){
        int currentPage=Integer.parseInt((String)map.get("currentPage"));
        int pageSize=5;
        int typeid=Integer.parseInt((String)map.get("typeId"));
        String typeName=(String) map.get("typeName");
        PageBean<Producttype> pageBean=productTypeService.getAllProductTypeByPage(currentPage,pageSize,typeid,typeName);
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("list",pageBean.getList());
        resultMap.put("pageSize",pageSize);
        resultMap.put("pageCount",pageBean.getPages());
        resultMap.put("rowCount",pageBean.getRowcount());
        resultMap.put("tid",typeid);
        resultMap.put("tname",typeName);
        return resultMap;
    }
    @GetMapping("toupdateprotypepage")
    public String selectProductTypeById(int id, Model model){
        model.addAttribute("producttype",productTypeService.selectProductTypeById(id));
        return "updateproducttype";
    }
    @GetMapping("producttypemodify")
    public String productTypeModify(int id, Model model){
        model.addAttribute("producttype",productTypeService.selectProductTypeById(id));
        return "updateproducttype";
    }
    @PostMapping("updateprotype")
    public String updateProductType(Producttype pt){
        productTypeService.updateProductType(pt);
        return "redirect:/toproducttypepage";
    }
    @PostMapping("addprotype")
    public String addProtype(Producttype pt){
        productTypeService.addProtype(pt);
        return "redirect:/toproducttypepage";
    }
    @GetMapping("addproducttypepage")
    public String addPage(){
        return "addproducttype";
    }
}
