package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.entity.Product;
import com.oracle.entity.Producttype;
import com.oracle.service.ProductService;
import com.oracle.service.ProductTypeService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

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
    @RequestMapping(value = "/addproduct",method = RequestMethod.POST)
    public String addProduct(Product product){
        product.setDate(new Date());
        productService.addProduct(product);
        return "redirect:/getprobypage";
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
    public String updateProductById(Product product){
        product.setDate(new Date());
        productService.updateProduct(product);
        return "redirect:/getprobypage";
    }
    @RequestMapping("/index")
    public String toShopPage(Model model){
        List<Product> products = productService.getFiveProducts();
        model.addAttribute("products",products);
        return "shop";
    }
    @RequestMapping("/toregisterpage")
    public String toRegisterPage(Model model){
        return "register";
    }
    @RequestMapping(value = "/getproductdetail",method = RequestMethod.GET)
    public String getProductDetail(int id,Model model){
        Product product=productService.getProductDetail(id);
        model.addAttribute("product",product);
        return "productdetail";
    }
    @RequestMapping(value = "/delproduct")
    public String delProduct(int id,Model model){
        productService.delProduct(id);
        return "redirect:/getprobypage";
    }
    @GetMapping("/batchdelproduct")
    public String delBatchProduct(int[] ids) {
        productService.delBatchProduct(ids);
        return "redirect:/getprobypage";
    }
    //实现文件上传
    @PostMapping("/produpload")
    @ResponseBody   //将数据转换成json格式
    public Map<String, String> uploadFile(MultipartFile upimage, HttpServletRequest request) throws IOException {
        //获取文件名
        String fileName = upimage.getOriginalFilename();
        //上传后的文件名(uuid + 文件扩展名)
        String realName = UUID.randomUUID().toString() + fileName.substring(fileName.indexOf("."));
        //服务器路径
        String serverPath = request.getServletContext().getRealPath("/") + "/resources/image_big/";

        Map<String, String> result = new HashMap<>();
        File file = new File(serverPath + realName);
        try {
            //上传文件
            upimage.transferTo(file);
            //返回结果
            result.put("imgurl", request.getContextPath() + "/resources/image_big/" + realName);
            result.put("imgName", realName);
        }
        catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        //json {"imgurl":"上传路径", "imgName":"文件名"}
        return result;
    }
}
