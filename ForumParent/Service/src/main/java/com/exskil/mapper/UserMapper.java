package com.exskil.mapper;

import com.exskil.po.User;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/19.
 */
public interface UserMapper {
    public int addUser(User user);
    public User getUserByID(Integer userID);
    public User findUserByLoginName(String loginName);
    public List<User> listUser();
}
