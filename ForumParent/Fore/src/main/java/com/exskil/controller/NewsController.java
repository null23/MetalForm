package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.News;
import com.exskil.service.NewsService;
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
@RequestMapping("news")
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("listnews")
    public ModelAndView listnews(@RequestParam(value="pageNum",required=false,defaultValue="1")Integer pageNum) throws Exception{
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();
        List<News> list = newsService.listNews();
        PageInfo<News> pagehelper = new PageInfo<News>(list);
        mv.setViewName("main/newslist");
        mv.addObject("pagehelper",pagehelper);

        return mv;
    }

    @RequestMapping("shownews")
    public ModelAndView shownews(Integer newsID) throws Exception{
        ModelAndView mv = new ModelAndView();
        News news = newsService.getNewsInfo(newsID);
        mv.addObject("news",news);
        mv.setViewName("main/news");
        return mv;
    }
}
