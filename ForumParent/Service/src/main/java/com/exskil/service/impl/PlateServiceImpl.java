package com.exskil.service.impl;

import com.exskil.mapper.PlateMapper;
import com.exskil.po.Plate;
import com.exskil.service.PlateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/14.
 */
@Service
public class PlateServiceImpl implements PlateService{

    @Autowired
    private PlateMapper plateMapper;

    @Override
    public List<Plate> getPlates() {
        List<Plate> plates = plateMapper.listPlate();
        return plates;
    }
}
