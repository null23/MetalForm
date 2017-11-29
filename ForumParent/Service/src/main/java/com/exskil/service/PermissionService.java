package com.exskil.service;

import com.exskil.po.Menu;
import com.exskil.po.Operation;
import com.exskil.po.User;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/30.
 */
public interface PermissionService {
    //获取当前用户的菜单
    public List<Menu> getCurUserMenu(User user);

    //获取当前用户操作
    public List<Operation> listOperations(User user);

}
