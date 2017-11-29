package com.exskil.service;

import com.exskil.po.User_Role;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/6.
 */
public interface User_RoleService {
    public void addUser_Role(User_Role user_role);

    public List<User_Role> listUser_Role();
}
