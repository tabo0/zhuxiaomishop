package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.entity.Users;
import com.oracle.mapper.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UsersSrviceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public HashMap<String,Object>  login(String uname, String upass) {
        return usersMapper.login(uname,upass);
    }

    @Override
    public PageBean<Users> getUsers(int currentPage, int pageSize) {
        List<Users> list=usersMapper.getUsers(currentPage,pageSize);
        PageBean<Users> pb=new PageBean<>();
        pb.setPage(currentPage);
        pb.setList(list);
        int rowcount=rowcount();
        pb.setRowcount(rowcount);
        //System.out.println("+++++="+rowcount);
//        for(Producttype i :list){
//            System.out.println(i.getName());
//        }
        System.out.println(list);
        if(rowcount%pageSize==0){
            pb.setPages(rowcount/pageSize);
        }else{
            pb.setPages(rowcount/pageSize+1);
        }

        return pb;
    }
    private int rowcount(){
        return usersMapper.getRowCount();
    }
}
