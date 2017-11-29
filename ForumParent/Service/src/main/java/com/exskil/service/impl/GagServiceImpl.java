package com.exskil.service.impl;

import com.exskil.mapper.GagMapper;
import com.exskil.po.Gag;
import com.exskil.service.GagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/8.
 */
@Service
public class GagServiceImpl implements GagService {
    @Autowired
    private GagMapper gagMapper;

    @Override
    public void insert(Gag gag) {
        gagMapper.insert(gag);
    }

    @Override
    public List<Gag> listGag() {
        List<Gag> gags = gagMapper.listGag();
        return gags;
    }

    @Override
    public void updateGagByUser(Integer userID) {
        gagMapper.updateGagByUser(userID);
    }
}
