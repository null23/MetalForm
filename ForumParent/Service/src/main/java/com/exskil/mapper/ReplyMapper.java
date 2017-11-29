package com.exskil.mapper;

import com.exskil.po.Reply;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/21.
 */
public interface ReplyMapper {
    //回复
    public void insert(Reply reply);

    //查询此贴所有回复
    public List<Reply> listReplysByPost(Integer postID);

    //查询用户历史消息
    public List<Reply> listReplyByUser(Integer curUserID);

    //查询用户未读消息数量
    public int findUnReadMsg(Integer curUserID);

    //更新未读数据isread=1
    public int updateUnReadMsg(Integer curUserID);

    //查看回复数
    public Integer selectRepliesByPost(Integer postID);

    //删除回复
    public void deleteReply(int replyID);
}
