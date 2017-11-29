package com.exskil.service.impl;

import com.exskil.mapper.RoleMapper;
import com.exskil.po.Role;
import com.exskil.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/6.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> listRoles() {
        List<Role> roles = roleMapper.selectByExample(null);
        return roles;
    }

    @Override
    public Role getRoleByID(int roleID) {
        Role role = roleMapper.selectByPrimaryKey(roleID);
        return role;
    }
}
