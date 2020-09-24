package com.oracle.mapper;

import com.oracle.entity.PageBean;
import com.oracle.entity.Role;
import com.oracle.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UsersMapper {
    public HashMap<String,Object> login(@Param("uname")String uname, @Param("upass")String upass);
    //获取员工信息
    List<HashMap<String, Object>> getAllUsersByPage(@Param("page")int page,
                                                    @Param("pagesize")int pagesize,
                                                    @Param("uname")String uname,
                                                    @Param("roleid")int roleid);

    //获取员工类型
    List<Role> getAllRole();

    //删除员工
    int delUsers(@Param("uid")int uid);

    //批量删除
    int delBatchUsers(int[] uids);

    //添加员工
    int addUsers(@Param("users")Users users);

    //通过id获取员工信息
    Users getUsersById(@Param("uid")int uid);

    //修改员工信息
    int updateUsers(@Param("users")Users users);

    //获取总行数
    int getRowCount(@Param("uname")String uname, @Param("roleid")int roleid);
}
