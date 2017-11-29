package com.exskil.service.impl;

import com.exskil.mapper.PostMapper;
import com.exskil.mapper.ReplyMapper;
import com.exskil.po.Reply;
import com.exskil.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/15.
 */
@Service
public class ReplyServiceImpl implements ReplyService {
@Autowired
private PostMapper postMapper;

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public void addReply(Reply reply) throws Exception {
        replyMapper.insert(reply);
    }

    @Override
    public List<Reply> listReplies(Integer postID) throws Exception {
        List<Reply> replies =  replyMapper.listReplysByPost(postID);
        return replies;
    }

    @Override
    public int getUnreadMessage(Integer userID) throws Exception {
        int unreadmsg = replyMapper.findUnReadMsg(userID);
        return unreadmsg;
    }

    @Override
    public List<Reply> getHisoryMessage(Integer curUserID) throws Exception {
        List<Reply> hisorymsg = replyMapper.listReplyByUser(curUserID);
        return hisorymsg;
    }

    @Override
    public void updateUnread(Integer curUserID) {
       replyMapper.updateUnReadMsg(curUserID);
    }

    @Override
    public int getRepliesByPost(int postID) {
        return replyMapper.selectRepliesByPost(postID);
    }

    @Override
    public void deleteReply(int replyID) {
        replyMapper.deleteReply(replyID);
    }


}
