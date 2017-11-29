package com.exskil.po;

public class User_Role {
    private Integer uid;

    private Integer rid;

    public User_Role(Integer uid, Integer rid) {
        this.uid = uid;
        this.rid = rid;
    }

    public User_Role() {
        super();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
}