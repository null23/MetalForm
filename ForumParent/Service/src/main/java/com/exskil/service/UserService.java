package com.exskil.service;

import com.exskil.po.User;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
public interface UserService {
    //通过登录名获取user
    public User findUserByLoginName(String loginName) throws Exception;

    //用户注册
    public void addUser(User user) throws Exception;

    //查询用户列表
    public List<User> listUser();

    //通过主键值获得user
    public User getUserByID(Integer userID);
}
