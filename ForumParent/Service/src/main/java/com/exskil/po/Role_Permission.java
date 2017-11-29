package com.exskil.po;

public class Role_Permission {
    private Integer rid;

    private Integer pid;

    public Role_Permission(Integer rid, Integer pid) {
        this.rid = rid;
        this.pid = pid;
    }

    public Role_Permission() {
        super();
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}