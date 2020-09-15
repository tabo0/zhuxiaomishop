package com.oracle.controller;

import com.oracle.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Objects;

@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;
    @RequestMapping(value = "/login")
    public String userLogin(String uname, String upass, Model model, HttpSession session){
        HashMap<String,Object> users=usersService.login(uname,upass);
        if(Objects.isNull(users)){
            model.addAttribute("info","error");
            return "login";
        }
        session.setAttribute("users",users);
        return "main";
    }
}
