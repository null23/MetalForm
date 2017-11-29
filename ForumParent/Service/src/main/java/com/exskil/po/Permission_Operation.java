package com.exskil.po;

public class Permission_Operation {
    private Integer pid;

    private Integer oid;

    public Permission_Operation(Integer pid, Integer oid) {
        this.pid = pid;
        this.oid = oid;
    }

    public Permission_Operation() {
        super();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }
}