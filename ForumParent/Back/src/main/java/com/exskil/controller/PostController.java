package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.Plate;
import com.exskil.po.Post;
import com.exskil.po.Reply;
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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;
/**
 * Created by LENOVO on 2017/5/10.
 */
@Controller
@RequestMapping("post")
public class PostController extends BaseController{

    @Autowired
    private PostService postService;

    @Autowired
    private PlateService plateService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private TopService topService;

    @RequiresPermissions("post")
    @RequestMapping("listpost")
    public ModelAndView listPost(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum) throws Exception{
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();
        List<Post> list = postService.listPost();
        //按时间排序
        List<Top> topList = topService.listTopPost();
        PageInfo<Post> pagehelper = new PageInfo<Post>(list);

        mv.setViewName("post/list");
        mv.addObject("topList",topList);
        mv.addObject("pagehelper",pagehelper);
        return mv;
    }

    //添加了个unreadmsg，但是这个明显要写到一个模板里
    @RequestMapping("showpost")
    public ModelAndView showPost(Integer postID) throws Exception{
        ModelAndView mv = new ModelAndView();
        Post post = postService.getPostInfo(postID);
        List<Reply> replies = replyService.listReplies(postID);
        int unreadMsg = replyService.getUnreadMessage(this.getCurrentUser().getId());
//        System.out.println(replies.size());
        mv.addObject("post",post);
        mv.addObject("replies",replies);
        mv.addObject("unreadMsg",unreadMsg);
        mv.setViewName("post/postinfo");
        return mv;
    }

    @RequiresPermissions("post")
    @RequestMapping("editpost")
    public ModelAndView editPost(Integer postID) throws Exception{
        ModelAndView mv = new ModelAndView();
        Post post = postService.getPostInfo(postID);
        mv.addObject("list",post);
        mv.setViewName("post/edit");
        return mv;
    }

    @RequiresPermissions("post")
    @RequestMapping("deletetoppost")
    public String save(Integer tid) throws Exception{
        System.out.println(tid);
        topService.deleteTopPost(tid);
        return "redirect:listpost.action";
    }

    @RequestMapping("addtoppost")
    public String update(Integer postID)throws  Exception{
        Top top = new Top();
        top.setPostID(postID);
        topService.addTopPost(top);
        return  "redirect:listpost.action";
    }

    @RequestMapping("test")
    public ModelAndView test() throws Exception{
        ModelAndView mv = new ModelAndView("post/test");
        return mv;
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

    @RequiresPermissions("post")
    @RequestMapping("beforeaddpost")
    public ModelAndView beforeaddpost() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Plate> plateList =  plateService.getPlates();
        mv.setViewName("post/addpost");
        mv.addObject("plateList",plateList);
        return mv;
    }

    @RequiresPermissions("post")
    @RequestMapping("addpost")
    public String addPost(Post post) throws Exception{
       post.setUserID(this.getCurrentUser().getId());
       post.setDate(new Date());
       post.setReply_date(new Date());
       postService.insert(post);
       return "post/test";
    }


//    @RequiresPermissions("post")
//    @RequestMapping("addtoppost")
//    private String addtoppost(Integer postID){
//        postService.addTopPost(postID);
//
////        topService.addTopPost(top);
//        return "redirect:listpost.action";
//   }
//
//    @RequiresPermissions("post")
//    @RequestMapping("deletetoppost")
//    private String deletetoppost(int tid){
//        topService.deleteTopPost(tid);
//
//        return "redirect:listpost.action";
//   }

//    @RequestMapping("topposts")
//    private ModelAndView topposts() throws Exception {
//        ModelAndView mv = new ModelAndView();
//        List<Post> topPosts = postService.listPost();
//        mv.setViewName("post/listtoppost");
//
//        return mv;
//    }

    @RequiresPermissions("post")
    @RequestMapping("caonimade")
    public String caonimade(){
        topService.listTopPost();

        return "";
    }
}
