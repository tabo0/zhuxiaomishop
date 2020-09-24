package com.oracle.controller;

import com.oracle.entity.Customer;
import com.oracle.service.CustomerService;
import com.oracle.util.MD5Util;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;
    @RequestMapping(value = "/doregister",method = RequestMethod.POST)
    public String doRegister(String cname, String cpass, String yzm, HttpSession session, Model model){
        String rdmcode=(String) session.getAttribute("rdmCode");
        //rdmcode="12345";
        int count=customerService.checkCname(cname);
        if(count>0){
            model.addAttribute("error","Account exists please modify");
            return "register";
        }
        if(!rdmcode.equalsIgnoreCase(yzm)){
            model.addAttribute("error","rdmcode not right");
            return "register";
        }
        customerService.customerRegister(cname, MD5Util.getMd5Str(cpass));
        return "customerlogin";
    }

    @RequestMapping(value = "/docheckcname",method = RequestMethod.POST)
    @ResponseBody()
    public Map<String,String> doCheckcname(String cname){
        int count=customerService.checkCname(cname);
        Map<String,String > map=new HashMap<>();
        if(count>0){
            map.put("info","Account exists please modify");
        }else{
            map.put("info","Account can be used");
        }
        return map;
    }
    @RequestMapping("/tocustomerloginpage")
    public String toCustomerLoginPage(){
        return "customerlogin";
    }
    @RequestMapping(value = "/customerlogin",method = RequestMethod.POST)
    public String customerLogin(String cname, String cpass, String yzm, HttpSession session, Model model){
        String rdmcode=(String) session.getAttribute("rdmCode");
        //rdmcode="12345";
        if(!rdmcode.equalsIgnoreCase(yzm)){
            model.addAttribute("error","rdmcode not right");
            return "customerlogin";
        }
        Customer customer= customerService.customerLogin(cname, MD5Util.getMd5Str(cpass));
        if(!Objects.isNull(customer)){
            session.setAttribute("customer",customer);
            return "redirect:/index.jsp";
        }else {
            model.addAttribute("error","Incorrect username or password");
            return "customerlogin";
        }

    }
    @RequestMapping(value = "/customerlogout")
    public String customerLogout(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
