package com.wcj.entity;

import com.wcj.util.StringUtils;

/**
 * @author Succy
 * @date 2017-03-26 18:07
 **/

public class Admin {
    private Integer id;
    private String name;
    private String tid;
    private String dept;
    private String pwd;
    private String title;

    public Admin() {
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
        this.name = name;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void assign(Admin admin) {
        if (!StringUtils.isEmpty(admin.getPwd())) {
            this.pwd = admin.getPwd();
        }
        if (!StringUtils.isEmpty(admin.getDept())) {
            this.dept = admin.getDept();
        }
        if (!StringUtils.isEmpty(admin.getTid())) {
            this.tid = admin.getTid();
        }
        if (!StringUtils.isEmpty(admin.getTitle())) {
            this.title = admin.getTitle();
        }
        if (!StringUtils.isEmpty(admin.getName())) {
            this.name = admin.getName();
        }
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tid='" + tid + '\'' +
                ", dept='" + dept + '\'' +
                ", pwd='" + pwd + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
