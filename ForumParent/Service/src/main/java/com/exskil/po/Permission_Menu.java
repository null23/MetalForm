package com.exskil.po;

public class Permission_Menu {
    private Integer pid;

    private Integer mid;

    public Permission_Menu(Integer pid, Integer mid) {
        this.pid = pid;
        this.mid = mid;
    }

    public Permission_Menu() {
        super();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
}