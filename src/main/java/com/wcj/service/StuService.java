package com.wcj.service;

import com.wcj.entity.Student;

import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

public interface StuService {
    Student login(String sid, String pwd) throws Exception;

    int importStus(FileInputStream in) throws Exception;

    Map<String, Object> getStuList(int rows, int page, String searchArg) throws Exception;

    List<Student> exportStus() throws Exception;

    Student findStuById(int id) throws Exception;

    boolean updateStuById(Student stu) throws Exception;

    int updateStuPwd(int id, String oldPwd, String newPwd) throws Exception;

    boolean delStuById(int id) throws Exception;

    Student findStuBySidAndEmail(Student stu) throws Exception;
}
