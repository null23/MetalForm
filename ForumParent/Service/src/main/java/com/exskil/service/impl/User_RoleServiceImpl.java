package com.exskil.service.impl;

import com.exskil.mapper.User_RoleMapper;
import com.exskil.po.User_Role;
import com.exskil.service.User_RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/6.
 */
@Service
public class User_RoleServiceImpl implements User_RoleService {
    @Autowired
    private User_RoleMapper user_roleMapper;

    @Override
    public void addUser_Role(User_Role user_role) {
        user_roleMapper.insert(user_role);
    }

    @Override
    public List<User_Role> listUser_Role() {
        List<User_Role> user_roles = user_roleMapper.selectByExample(null);
        return user_roles;
    }
}
