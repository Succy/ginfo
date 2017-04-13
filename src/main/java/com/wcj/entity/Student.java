package com.wcj.entity;

import com.wcj.util.Constant;
import com.wcj.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Succy
 * @date 2017-03-26 18:07
 **/

public class Student {
    private Integer id; // 记录id 自增主键
    private String name;// 姓名
    private String sid;// 学号
    private String pwd;// 密码
    private String gender;// 性别
    private String birth;// 生日
    private String nation;// 民族
    private String politics_status;// 政治面貌
    private String school;// 学校
    private String collage;// 学院
    private String major;// 专业
    private String grade;// 班级
    private String mobi;// 手机号
    private String qq;// qq号
    private String email;// 邮箱
    private String avatar;// 头像
    private String address;// 家庭住址

    private Map<String, String> stuMap = new HashMap<>();

    public Student() {
    }

    public Student(Map<String, String> map) {
        this.sid = map.get(Constant.Info.Stu.SID);
        this.name = map.get(Constant.Info.Stu.NAME);
        this.gender = map.get(Constant.Info.Stu.GENDER);
        this.birth = map.get(Constant.Info.Stu.BIRTH);
        this.nation = map.get(Constant.Info.Stu.NATION);
        this.politics_status = map.get(Constant.Info.Stu.POLITICS_STATUS);
        this.school = map.get(Constant.Info.Stu.SCHOOL);
        this.collage = map.get(Constant.Info.Stu.COLLAGE);
        this.major = map.get(Constant.Info.Stu.MAJOR);
        this.grade = map.get(Constant.Info.Stu.GRADE);
        this.mobi = map.get(Constant.Info.Stu.MOBI);
        this.qq = map.get(Constant.Info.Stu.QQ);
        this.email = map.get(Constant.Info.Stu.EMAIL);
        this.address = map.get(Constant.Info.Stu.ADDRESS);
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPolitics_status() {
        return politics_status;
    }

    public void setPolitics_status(String politics_status) {
        this.politics_status = politics_status;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getCollage() {
        return collage;
    }

    public void setCollage(String collage) {
        this.collage = collage;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMobi() {
        return mobi;
    }

    public void setMobi(String mobi) {
        this.mobi = mobi;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    public Map<String, String> getStuMap() {
        stuMap.put(Constant.Info.Stu.SID, this.sid);
        stuMap.put(Constant.Info.Stu.NAME, this.name);
        stuMap.put(Constant.Info.Stu.NATION, this.nation);
        stuMap.put(Constant.Info.Stu.SCHOOL, this.school);
        stuMap.put(Constant.Info.Stu.COLLAGE, this.collage);
        stuMap.put(Constant.Info.Stu.GRADE, this.grade);
        stuMap.put(Constant.Info.Stu.GENDER, this.gender);
        stuMap.put(Constant.Info.Stu.BIRTH, this.birth);
        stuMap.put(Constant.Info.Stu.EMAIL, this.email);
        stuMap.put(Constant.Info.Stu.MOBI, this.mobi);
        stuMap.put(Constant.Info.Stu.QQ, this.qq);
        stuMap.put(Constant.Info.Stu.ADDRESS, this.address);
        stuMap.put(Constant.Info.Stu.POLITICS_STATUS, this.politics_status);
        stuMap.put(Constant.Info.Stu.MAJOR, this.major);
        return this.stuMap;
    }

    /**
     * 使用参数中的对象给this对象赋值
     *
     * @param stu
     */
    public void assign(Student stu) {
        if (!StringUtils.isEmpty(stu.getSid())) {
            this.sid = stu.getSid();
        }
        if (!StringUtils.isEmpty(stu.getName())) {
            this.name = stu.getName();
        }
        if (!StringUtils.isEmpty(stu.getPwd())) {
            this.pwd = stu.getPwd();
        }
        if (!StringUtils.isEmpty(stu.getAddress())) {
            this.address = stu.getAddress();
        }
        if (!StringUtils.isEmpty(stu.getAvatar())) {
            this.avatar = stu.getAvatar();
        }
        if (!StringUtils.isEmpty(stu.getBirth())) {
            this.birth = stu.getBirth();
        }
        if (!StringUtils.isEmpty(stu.getCollage())) {
            this.collage = stu.getCollage();
        }
        if (!StringUtils.isEmpty(stu.getGender())) {
            this.gender = stu.getGender();
        }
        if (!StringUtils.isEmpty(stu.getGrade())) {
            this.grade = stu.getGrade();
        }
        if (!StringUtils.isEmpty(stu.getEmail())) {
            this.email = stu.getEmail();
        }
        if (!StringUtils.isEmpty(stu.getQq())) {
            this.qq = stu.getQq();
        }
        if (!StringUtils.isEmpty(stu.getMajor())) {
            this.major = stu.getMajor();
        }
        if (!StringUtils.isEmpty(stu.getMobi())) {
            this.mobi = stu.getMobi();
        }
        if (!StringUtils.isEmpty(stu.getPolitics_status())) {
            this.politics_status = stu.getPolitics_status();
        }
        if (!StringUtils.isEmpty(stu.getNation())) {
            this.nation = stu.getNation();
        }
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sid='" + sid + '\'' +
                ", pwd='" + pwd + '\'' +
                ", gender='" + gender + '\'' +
                ", birth='" + birth + '\'' +
                ", nation='" + nation + '\'' +
                ", politics_status='" + politics_status + '\'' +
                ", school='" + school + '\'' +
                ", collage='" + collage + '\'' +
                ", major='" + major + '\'' +
                ", grade='" + grade + '\'' +
                ", mobi='" + mobi + '\'' +
                ", qq='" + qq + '\'' +
                ", email='" + email + '\'' +
                ", avatar='" + avatar + '\'' +
                ", address='" + address + '\'' +
                ", stuMap=" + stuMap +
                '}';
    }

}
