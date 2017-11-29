package com.exskil.service;

import com.exskil.po.Menu;
import com.exskil.po.User;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/29.
 */
public interface MenuService {
    /**
     * 查询当前用户对应的菜单
     */
    public List<Menu> getMenu(User user);
}
