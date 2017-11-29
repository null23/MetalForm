package com.exskil.po;

public class Operation {
    private Integer id;

    private String name;

    private String url;

    private Integer parentid;

    public Operation(Integer id, String name, String url, Integer parentid) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.parentid = parentid;
    }

    public Operation() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }
}