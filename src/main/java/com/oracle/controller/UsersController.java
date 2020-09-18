package com.oracle.controller;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.entity.Users;
import com.oracle.service.UsersService;
import com.oracle.util.MD5Util;
import com.oracle.webservices.internal.api.message.PropertySet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String userLogin(String uname, String upass, Model model, HttpSession session){
        upass= MD5Util.getMd5Str(upass);
        HashMap<String,Object> users=usersService.login(uname,upass);
        if(Objects.isNull(users)){
            model.addAttribute("info","error");
            return "login";
        }
        session.setAttribute("users",users);
        return "main";
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLoginPage(){
        return "login";
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login";
    }
    @GetMapping("getusersbypage")
    public String getUsersbypage(){
        return "userpage";
    }
    @PostMapping("getusers")
    @ResponseBody
    public Map<String,Object> getUsers(@RequestParam Map<String,Object> map){
        int currentPage=Integer.parseInt((String)map.get("currentPage"));
        int pageSize=Integer.parseInt((String)map.get("pageSize"));
        PageBean<Users> pageBean=usersService.getUsers(currentPage,pageSize);
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("list",pageBean.getList());
        resultMap.put("pageSize",pageSize);
        resultMap.put("pageCount",pageBean.getPages());
        resultMap.put("rowCount",pageBean.getRowcount());
        return resultMap;
    }
}
