package com.exskil.service.impl;

import com.exskil.mapper.ArticleMapper;
import com.exskil.po.Article;
import com.exskil.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/26.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void addArticle(Article article) throws Exception {
        articleMapper.insert(article);
    }

    @Override
    public List<Article> listArticle() throws Exception {
        List<Article> articleList = articleMapper.listArticle();
        return articleList;
    }

    @Override
    public Article getArticleInfo(Integer articleID) throws Exception {
        Article article = articleMapper.findArticleInfo(articleID);
        return article;
    }

    @Override
    public List<Article> listArticleMain() throws Exception {
        List<Article> articles = articleMapper.listArticleMain();
        return articles;
    }
}
