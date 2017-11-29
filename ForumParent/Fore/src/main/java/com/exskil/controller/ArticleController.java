package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.Article;
import com.exskil.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.UUIDUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LENOVO on 2017/5/26.
 */
@Controller
@RequestMapping("article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("beforearticle")
    public String  beforeaddarticle(){
        return "article/addarticle";
    }

    @RequestMapping("addarticle")
    public void addNews(Article article) throws Exception{
        article.setUserID(this.getCurrentUser().getId());
        article.setDate(new Date());
        articleService.addArticle(article);
    }

    @RequestMapping(value = "addImage", method = RequestMethod.POST)
    @ResponseBody
    public Object addImage(@RequestParam MultipartFile file, HttpServletRequest request) throws IOException {
        /** 要求返回的JSON格式
         * {
         "code": 0
         ,"msg": ""
         ,"data": {
         "src": "http://cdn.abc.com/123.jpg"
         }
         */
        String path = request.getSession().getServletContext().getRealPath("uploadImage/");
        String newFileName = UUIDUtil.getUUID() + ".jpg";
        file.transferTo(new File(path, newFileName));

        System.out.println(file.getSize());
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        Map data = new HashMap();
        data.put("src","../uploadImage/" + newFileName);
        map.put("data",data);
        JSONObject jsonObject = JSONObject.fromObject(map);
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }

    @RequestMapping("listarticle")
    public ModelAndView listarticle(@RequestParam(value="pageNum",required=false,defaultValue="1")Integer pageNum) throws Exception{
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();
        List<Article> list = articleService.listArticle();
        PageInfo<Article> pagehelper = new PageInfo<Article>(list);
        mv.setViewName("main/articlelist");
        mv.addObject("pagehelper",pagehelper);

        return mv;
    }

    @RequestMapping("showarticle")
    public ModelAndView shownews(Integer articleID) throws Exception{
        ModelAndView mv = new ModelAndView();
        Article article = articleService.getArticleInfo(articleID);
        mv.addObject("article",article);
        mv.setViewName("main/article");
        return mv;
    }
}
