package com.exskil.service.impl;

import com.exskil.mapper.NewsMapper;
import com.exskil.po.News;
import com.exskil.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/26.
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public void addNews(News news) throws Exception {
        newsMapper.insert(news);
    }

    @Override
    public List<News> listNews() throws Exception {
        List<News> newsList = newsMapper.listNews();
        return newsList;
    }

    @Override
    public News getNewsInfo(Integer newsID) throws Exception {
        News news = newsMapper.findNewsInfo(newsID);
        return news;
    }

    @Override
    public List<News> listNewsMain() throws Exception {
        List<News> news = newsMapper.listNewsMain();
        return news;
    }
}
