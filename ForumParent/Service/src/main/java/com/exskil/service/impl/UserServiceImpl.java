package com.exskil.service.impl;

import com.exskil.mapper.UserMapper;
import com.exskil.po.User;
import com.exskil.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.MD5Util;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUserByLoginName(String loginName) throws Exception{
        User user = userMapper.findUserByLoginName(loginName);

        return user;
    }

    @Override
    public void addUser(User user) throws Exception{
        String password = user.getPassword();
        password = MD5Util.EncoderByMd5(password);
        user.setPassword(password);

        userMapper.addUser(user);
    }

    @Override
    public List<User> listUser() {
        List<User> users = userMapper.listUser();
        return users;
    }

    @Override
    public User getUserByID(Integer userID) {
        User user = userMapper.getUserByID(userID);
        return user;
    }
}
