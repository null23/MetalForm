package com.exskil.service.impl;

import com.exskil.mapper.PostMapper;
import com.exskil.mapper.ReplyMapper;
import com.exskil.mapper.TopMapper;
import com.exskil.po.Post;
import com.exskil.po.Top;
import com.exskil.service.PostService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
@Service
public class PostServiceImpl implements PostService,InitializingBean {

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private TopMapper topMapper;

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public List<Post> listPost() throws Exception{
        List<Post> postList = postMapper.listPost();
        for(Post post:postList){
            int postID = post.getId();
            int replies = replyMapper.selectRepliesByPost(postID);
            post.setReplies(replies);
        }
        return postList;
    }

    @Override
    public Post getPostInfo(Integer postID) throws Exception{
        Post postInfo = postMapper.findPostInfo(postID);
        return postInfo;
    }

    @Override
    public Post postInfo_test() throws Exception{
        return null;
    }

    @Override
    public void insert(Post post) throws Exception {
        postMapper.insert(post);
    }

    @Override
    public void update(Post post) throws Exception {
//        postMapper.updateByPrimaryKeySelective(post);
    }

    @Override
    public void updateReply_Date(Post post) {
        postMapper.updateReply_Date(post);
    }

    @Override
    public void updateViews(Integer postID) {
        postMapper.updateViews(postID);
    }

    @Override
    public List<Post> listHotPost() {
        List<Post> hotPost =  postMapper.selectHotPost();
        return hotPost;
    }

    @Override
    public void updateReplies(Post post) {
        int replies = replyMapper.selectRepliesByPost(post.getId());
        post.setReplies(replies);
        postMapper.updateReplies(post);
    }

    @Override
    public void deletePost(int postID) {
        postMapper.deletePost(postID);
    }

    @Override
    public List<Post> listPostByUser(int userID) {
        List<Post> postList = postMapper.listPostByUser(userID);
        return postList;
    }

    @Override
    public List<Post> listMyRevycle(int userID) {
        List<Post> postList = postMapper.listMyRecycle(userID);
        return postList;
    }

    @Override
    public void recoverPost(int postID) {
        postMapper.recoverPost(postID);
        postMapper.updateReplyDate(postID);
    }

    @Override
    public List<Post> listTopPost() {
        List<Post> topPosts = postMapper.lisTopPost();
        return topPosts;
    }

    @Override
    public void addTopPost(int postID) {
        postMapper.addTopPost(postID);
    }

    @Override
    public void deleteTopPost(int postID) {
        postMapper.deletePost(postID);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
//        System.out.println("初始化PostServiceImpl");
    }
}
