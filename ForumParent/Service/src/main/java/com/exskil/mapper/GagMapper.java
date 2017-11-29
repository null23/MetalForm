package com.exskil.mapper;

import com.exskil.po.Gag;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/8.
 */
public interface GagMapper {
    //插入记录
    public int insert(Gag gag);

    //查询所有禁言用户
    public List<Gag> listGag();

    //把禁言状态更新为0(解除禁言)
    public int updateGagByUser(Integer gid);

}
