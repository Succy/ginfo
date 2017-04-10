package com.wcj.service;

import com.wcj.entity.Student;

import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

public interface StuService {
    Student login(String sid, String pwd) throws Exception;
    int importStus(FileInputStream in)throws Exception;
    Map<String, Object> getStuList(int rows, int page, String searchArg) throws Exception;
    List<Student> exportStus() throws Exception;
}
