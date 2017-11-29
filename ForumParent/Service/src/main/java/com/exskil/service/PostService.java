package com.exskil.service;

import com.exskil.po.Post;
import com.exskil.po.Top;
import javafx.geometry.Pos;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
public interface PostService {
    public List<Post> listPost() throws Exception;
    public Post getPostInfo(Integer postID) throws Exception;
    public Post postInfo_test() throws Exception;
    public void insert(Post post)throws Exception;
    public void update(Post post)throws Exception;
    public void updateReply_Date(Post post);

    //更新访问量
    public void updateViews(Integer postID);

    //查询热帖
    public List<Post> listHotPost();

    //更新回复量
    public void updateReplies(Post post);

    //删除帖子
    public void deletePost(int postID);

    //查询自己的帖子
    public List<Post> listPostByUser(int userID);

    //查询回收站里的帖子
    public List<Post> listMyRevycle(int userID);

    //恢复帖子状态
    public void recoverPost(int postID);

    //查询置顶帖
    public List<Post> listTopPost();

    //添加置顶帖
    public void addTopPost(int postID);

    //删除置顶帖
    public void deleteTopPost(int postID);
}
