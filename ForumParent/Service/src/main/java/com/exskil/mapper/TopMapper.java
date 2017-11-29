package com.exskil.mapper;

import com.exskil.po.Top;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/20.
 */
public interface TopMapper {
    //添加置顶帖
    public int insert(Top top);

    //删除置顶帖
    public int deleteTopPost(int tid);

    //查询置顶帖集合
    public List<Top> listTopPosts();

    //查询顶置贴详细信息
    public Top getTopInfo();
}
