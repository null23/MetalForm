package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.*;
import com.exskil.service.*;
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
 * Created by LENOVO on 2017/6/20.
 */
@Controller
@RequestMapping("post")
public class PostController extends BaseController{

    @Autowired
    private PostService postService;

    @Autowired
    private TopService topService;

    @Autowired
    private PlateService plateService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private GagService gagService;

    //帖子列表
    @RequestMapping("listpost")
    private ModelAndView listPost(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum) throws Exception {
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();

        //调用service方法查询帖子列表
        List<Post> list = postService.listPost();
        PageInfo<Post> pagehelper = new PageInfo<Post>(list);

        //按时间排序
        List<Top> topList = topService.listTopPost();

        //回复热帖
        List<Post> hotList = postService.listHotPost();

        //未读消息数量
        if(this.getCurrentUser() != null){
            int unreadMsg = replyService.getUnreadMessage(this.getCurrentUser().getId());
            mv.addObject("unreadMsg",unreadMsg);
        }

        mv.setViewName("jie/index");
        mv.addObject("topList",topList);
        mv.addObject("hotList",hotList);
        mv.addObject("pagehelper",pagehelper);
        return mv;
    }

    //上传图片方法
    @RequestMapping(value = "addImage", method = RequestMethod.POST)
    @ResponseBody
    public Object addImage(@RequestParam MultipartFile file, HttpServletRequest request) throws IOException {
        System.out.println("postimage");
        /** 要求返回的JSON格式
         * {
         "code": 0
         ,"msg": ""
         ,"data": {
         "src": "http://cdn.abc.com/123.jpg"
         }
         */

        String path = request.getSession().getServletContext().getRealPath("uploadImage/");

        //图片获取随机名称
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

    @RequestMapping("beforeaddpost")
    public ModelAndView beforeaddpost() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Gag> gags = gagService.listGag();

        for (Gag gag:gags){
            if (gag.getUser().getId() == this.getCurrentUser().getId()){
                mv.setViewName("error/gag");
                return mv;
            }
        }

        List<Plate> plateList =  plateService.getPlates();
        mv.setViewName("jie/add");
        mv.addObject("plateList",plateList);

        //当前由用户登录，则显示未读消息
        if(this.getCurrentUser() != null){
            int unreadMsg = replyService.getUnreadMessage(this.getCurrentUser().getId());
            mv.addObject("unreadMsg",unreadMsg);
        }
        return mv;
    }

    @RequestMapping("addpost")
    public String addPost(Post post) throws Exception{
        post.setUserID(this.getCurrentUser().getId());
        post.setDate(new Date());
        post.setReply_date(new Date());

        //调用service方法存储帖子
        postService.insert(post);
        return "redirect:listpost.action";
    }

    @RequestMapping("test")
    public ModelAndView test() throws Exception{
        ModelAndView mv = new ModelAndView("post/test");
        return mv;
    }

    //添加了个unreadmsg，但是这个明显要写到一个模板里
    @RequestMapping("showpost")
    public ModelAndView showPost(Integer postID) throws Exception{
        //回复热帖
        List<Post> hotList = postService.listHotPost();

        //更新浏览量
        postService.updateViews(postID);

        ModelAndView mv = new ModelAndView();
        Post post = postService.getPostInfo(postID);

        //当前由用户登录，则显示未读消息
        if(this.getCurrentUser() != null){
            int unreadMsg = replyService.getUnreadMessage(this.getCurrentUser().getId());
            mv.addObject("unreadMsg",unreadMsg);
        }

        List<Reply> replies = replyService.listReplies(postID);
//        int unreadMsg = replyService.getUnreadMessage(this.getCurrentUser().getId());
        mv.addObject("post",post);
        mv.addObject("replies",replies);
//        mv.addObject("unreadMsg",unreadMsg);
        mv.addObject("hotList",hotList);
        mv.setViewName("jie/detail");
        return mv;
    }

    @RequestMapping("deletepost")
    private String deletepost(int postID){
        postService.deletePost(postID);

        return "redirect:listpost.action";
    }

    @RequestMapping("mypost")
    private ModelAndView mypost(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();
        List<Post> list = postService.listPostByUser(this.getCurrentUser().getId());
        PageInfo<Post> pagehelper = new PageInfo<Post>(list);

        mv.setViewName("user/mypost");
        mv.addObject("pagehelper",pagehelper);
        return mv;
    }

    @RequestMapping("myrecycle")
    private ModelAndView myrecycle(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();
        List<Post> list = postService.listMyRevycle(this.getCurrentUser().getId());
        PageInfo<Post> pagehelper = new PageInfo<Post>(list);

        mv.setViewName("user/myrecycle");
        mv.addObject("pagehelper",pagehelper);
        return mv;
    }

    @RequestMapping("recoverpost")
    private String recoverpost(int postID){
        postService.recoverPost(postID);
        return "redirect:listpost.action";
    }
}
