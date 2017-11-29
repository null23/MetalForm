package com.exskil.service;

import com.exskil.po.Gag;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/8.
 */
public interface GagService {
    //插入一条禁言记录
    public void insert(Gag gag);

    //查询所有被禁言的用户
    public List<Gag> listGag();

    //解除禁言
    public void updateGagByUser(Integer userID);
}
