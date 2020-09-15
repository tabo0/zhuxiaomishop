package com.oracle.controller;

import com.oracle.service.UsersService;
import com.oracle.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
}
