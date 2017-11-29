package com.exskil.service;

import com.exskil.po.Top;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/20.
 */
public interface TopService {
    //添加置顶贴
    public void addTopPost(Top top);

    //删除置顶贴
    public void deleteTopPost(Integer tid);

    //获得置顶帖集合
    public List<Top> listTopPost();

    public int caonima();
}
