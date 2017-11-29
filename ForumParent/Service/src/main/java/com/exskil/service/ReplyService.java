package com.exskil.service;

import com.exskil.po.Reply;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/15.
 */
public interface ReplyService {
    //添加评论/回复
    public void addReply(Reply reply) throws Exception;

    //查询当前帖子的所有回复
    public List<Reply> listReplies(Integer postID) throws Exception;

    //查询当前用户的所有未读信息
    public int getUnreadMessage(Integer userID) throws Exception;

    //查询当前用户所有的历史回复信息
    public List<Reply> getHisoryMessage(Integer curUserID) throws Exception;

    //把所有当前用户的未读信息置1
    public void updateUnread(Integer curUserID);

    //查询回复量
    public int getRepliesByPost(int postID);

    //删除回复
    public void deleteReply(int replyID);
}
