package com.exskil.mapper;

import com.exskil.po.Article;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/21.
 */
public interface ArticleMapper {
    //添加
    public void insert(Article article) throws Exception;

    //查询列表
    public List<Article> listArticle() throws Exception;

    //查询某文章详细信息
    public Article findArticleInfo(Integer newsID) throws Exception;

    //首页文章
    public List<Article> listArticleMain() throws Exception;
}
