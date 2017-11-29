package com.exskil.service.impl;

import com.exskil.mapper.TopMapper;
import com.exskil.po.Top;
import com.exskil.service.TopService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/20.
 */
@Service("topService")
public class TopServiceImpl implements TopService,InitializingBean {

//    SqlSession
    @Autowired
    private TopMapper topMapper;

    @Override
    public void addTopPost(Top top) {
        topMapper.insert(top);
    }

    @Override
    public void deleteTopPost(Integer tid) {
        topMapper.deleteTopPost(tid);
    }

    @Override
    public List<Top> listTopPost() {
        List<Top> topList = topMapper.listTopPosts();
        return topList;
    }

    @Override
    public int caonima() {
        return 1;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("初始化TopServiceImpl");
    }
}
