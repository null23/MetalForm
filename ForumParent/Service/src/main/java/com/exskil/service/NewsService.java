package com.exskil.service;

import com.exskil.po.News;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/26.
 */
public interface NewsService {
    //添加新闻
    public void addNews(News news) throws Exception;

    //查询所有新闻
    public List<News> listNews() throws Exception;

    //查询某新闻信息
    public News getNewsInfo(Integer newsID) throws Exception;

    //首页新闻
    public List<News> listNewsMain() throws Exception;
}
