package com.oracle.service;

import com.oracle.entity.PageBean;
import com.oracle.entity.Producttype;
import com.oracle.entity.Role;
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
    public PageBean<HashMap<String, Object>> getAllUsersByPage(int page, int pagesize, String uname, int roleid)
    {
        //获取当前页数据
        List<HashMap<String, Object>> list = usersMapper.getAllUsersByPage(page, pagesize, uname, roleid);
        //创建PageBean对象封装数据
        PageBean<HashMap<String, Object>> pb = new PageBean<>();
        //封装当前页码，当前页数据
        pb.setPage(page);
        pb.setList(list);
        //获取总行数
        int rowcount = rowcount(uname, roleid);
        //封装总页数
        if (rowcount % pagesize == 0) {
            pb.setPages(rowcount / pagesize);
        }
        else {
            pb.setPages(rowcount / pagesize + 1);
        }

        return pb;
    }

    public int rowcount(String uname, int roleid)
    {
        return usersMapper.getRowCount(uname, roleid);
    }

    @Override
    public List<Role> getAllRole()
    {
        return usersMapper.getAllRole();
    }

    @Override
    public int delUsers(int uid)
    {
        return usersMapper.delUsers(uid);
    }

    @Override
    public int delBatchUsers(int[] uids)
    {
        return usersMapper.delBatchUsers(uids);
    }

    @Override
    public int addUsers(Users users)
    {
        return usersMapper.addUsers(users);
    }

    @Override
    public Users getUsersById(int uid)
    {
        return usersMapper.getUsersById(uid);
    }

    @Override
    public int updateUsers(Users users)
    {
        return usersMapper.updateUsers(users);
    }
//    private int rowcount(){
//        return usersMapper.getRowCount();
//    }
}
