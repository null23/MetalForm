package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.Post;
import com.exskil.po.Reply;
import com.exskil.service.PostService;
import com.exskil.service.ReplyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
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
 * Created by LENOVO on 2017/5/15.
 */
@Controller
@RequestMapping("reply")
public class ReplyController extends BaseController {

    @Autowired
    private ReplyService replyService;

    @Autowired
    private PostService postService;

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
        String path = request.getSession().getServletContext().getRealPath("post/uploadImage");
        String newFileName = UUIDUtil.getUUID() + ".jpg";
        file.transferTo(new File(path, newFileName));

        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        Map data = new HashMap();
        data.put("src","uploadImage/" + newFileName);
        map.put("data",data);
        JSONObject jsonObject = JSONObject.fromObject(map);
//        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }


    //为什么不能在input直接把to_user作为reply的属性呢来获取to_user呢？ 而是必须单独获取
    @RequestMapping("addreply")
    public String addReply(Reply reply, Integer to_userID) throws Exception{
        reply.setUserID(this.getCurrentUser().getId());
        reply.setDate(new Date());
        reply.setIs_read(0);
        reply.setTo_userID(to_userID);
//        System.out.println("toUserID" + reply.getToUser());
        replyService.addReply(reply);

        Post post = new Post();
        post.setReply_date(new Date());
        post.setId(reply.getPostID());
        postService.updateReply_Date(post);
        return "redirect:../post/showpost.action?postID=" + reply.getPostID();
    }

    //查询未读信息并把未读信息置1
    @RequestMapping("historymsg")
    public ModelAndView historyReply(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum) throws Exception {
        PageHelper.startPage(pageNum, 5);
        ModelAndView mv = new ModelAndView();
        int curUserID = this.getCurrentUser().getId();
        List<Reply> list = replyService.getHisoryMessage(curUserID);
        PageInfo<Reply> pagehelper = new PageInfo<Reply>(list);
        mv.setViewName("reply/historyreply");
        mv.addObject("pagehelper",pagehelper);

        //查询未读信息并把未读信息置1
        replyService.updateUnread(curUserID);
        return mv;
    }
}
