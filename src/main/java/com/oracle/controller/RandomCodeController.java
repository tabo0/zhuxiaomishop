package com.oracle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class RandomCodeController {
    @RequestMapping(value = "/randomcode",method = RequestMethod.POST)
    public void getAuthCode(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        session.setAttribute("rdmCode","12345");
    }
}
