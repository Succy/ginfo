package com.wcj.mapper;

import com.wcj.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("StuMapper")
public interface StuMapper {
    Student findStuBySidAndPwd(Student student) throws Exception;
    int insertStus(List<Student> list) throws Exception;
    List<Student> getStuList(Map<String, Object> args) throws Exception;
    int getStuTotalCount(Map<String, Object> args) throws Exception;
}
