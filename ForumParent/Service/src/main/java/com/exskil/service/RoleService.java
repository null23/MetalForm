package com.exskil.service;

import com.exskil.po.Role;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/6.
 */
public interface RoleService {
    //遍历role集合
    public List<Role> listRoles();

    //根据id获取role
    public Role getRoleByID(int roleID);
}
