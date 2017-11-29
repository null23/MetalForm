package com.exskil.service;

import com.exskil.po.Article;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/26.
 */
public interface ArticleService {
    //添加新闻
    public void addArticle(Article news) throws Exception;

    //查询所有新闻
    public List<Article> listArticle() throws Exception;

    //查询某新闻信息
    public Article getArticleInfo(Integer newsID) throws Exception;

    //首页新闻
    public List<Article> listArticleMain() throws Exception;
}
