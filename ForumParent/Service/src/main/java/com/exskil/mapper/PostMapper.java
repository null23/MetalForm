package com.exskil.mapper;

import com.exskil.po.Post;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/21.
 */
public interface PostMapper {
    //插入
    public void insert(Post post) throws Exception;

    //查询帖子详细信息
    public Post findPostInfo(Integer postID) throws Exception;

    //帖子列表
    public List<Post> listPost();

    //更新帖子最后回复时间
    public void updateReply_Date(Post post);

    //更新点击量
    public void updateViews(Integer postID);

    //按照回复数查询热帖
    public List<Post> selectHotPost();

    //更新回复量
    public void updateReplies(Post post);

    //删除帖子
    public void deletePost(int postID);

    //查询自己发布的帖子
    public List<Post> listPostByUser(int userID);

    //查询回收站里的帖子
    public List<Post> listMyRecycle(int userID);

    //恢复帖子
    public void recoverPost(int postID);

    //更新帖子时间
    public void updateReplyDate(int postID);

    //查询所有顶置贴
    public List<Post> lisTopPost();

    //设置为顶置贴
    public void addTopPost(int postID);

    //取消顶置贴
    public void deleteTopPost();
}
