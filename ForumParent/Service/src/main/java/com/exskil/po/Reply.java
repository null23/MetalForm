package com.exskil.po;

import java.util.Date;

/**
 * Created by LENOVO on 2017/5/20.
 */
public class Reply {
    private Integer id;
    private String content;
    private Post post;
    private User user;
    private User to_user;
    private Integer is_read;
    private Date date;

    private Integer userID;
    private Integer postID;
    private Integer plateID;
    private Integer to_userID;
    public Reply() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getTo_user() {
        return to_user;
    }

    public void setTo_user(User to_user) {
        this.to_user = to_user;
    }

    public Integer getIs_read() {
        return is_read;
    }

    public void setIs_read(Integer is_read) {
        this.is_read = is_read;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getPostID() {
        return postID;
    }

    public void setPostID(Integer postID) {
        this.postID = postID;
    }

    public Integer getPlateID() {
        return plateID;
    }

    public void setPlateID(Integer plateID) {
        this.plateID = plateID;
    }

    public Integer getTo_userID() {
        return to_userID;
    }

    public void setTo_userID(Integer to_userID) {
        this.to_userID = to_userID;
    }
}
