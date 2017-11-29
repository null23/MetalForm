package com.exskil.mapper;

import com.exskil.po.News;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/26.
 */
public interface NewsMapper {
    //添加
    public void insert(News news) throws Exception;

    //查询列表
    public List<News> listNews() throws Exception;

    //查询某新闻详细信息
    public News findNewsInfo(Integer newsID) throws Exception;

    //首页新闻
    public List<News> listNewsMain() throws Exception;
}
