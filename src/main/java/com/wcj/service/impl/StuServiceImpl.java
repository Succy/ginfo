package com.wcj.service.impl;

import com.wcj.entity.Student;
import com.wcj.mapper.StuMapper;
import com.wcj.service.StuService;
import com.wcj.util.Constant;
import com.wcj.util.POIUtils;
import com.wcj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Succy
 * @date 2017-03-28 22:36
 **/
@Service("stuService")
public class StuServiceImpl implements StuService {
    @Autowired
    private StuMapper stuMapper;

    @Override
    public Student login(String sid, String pwd) throws Exception {
        Student stu = new Student();
        stu.setSid(sid);
        stu.setPwd(pwd);
        try {
            Student result = stuMapper.findStuBySidAndPwd(stu);
            if (result != null) {
                return result;
            }
        } catch (Exception e) {
            throw new Exception("学生登录失败", e);
        }
        return null;
    }

    @Override
    public int importStus(FileInputStream in) throws Exception {
        List<Student> students = POIUtils.importExcel(in);
        if (students != null && !students.isEmpty()) {
            int count = stuMapper.insertStus(students);
            return count;
        }
        return 0;
    }

    @Override
    public Map<String, Object> getStuList(int rows, int page, String searchArg) throws Exception {
        Map<String, Object> result = new HashMap<>();
        try {
            Map<String, Object> args = new HashMap<>();
            args.put(Constant.SEARCH_ARG, searchArg);
            int count = stuMapper.getStuTotalCount(args);
            Map<String, Object> params = new HashMap<>();
            params.put(Constant.ROWS, rows);
            params.put(Constant.PAGE, page * rows);
            if (!StringUtils.isEmpty(searchArg))
                params.put(Constant.SEARCH_ARG, searchArg);
            List<Student> stuList = stuMapper.getStuList(params);
            result.put(Constant.TOTAL, count);
            result.put(Constant.RESULT, stuList);
        } catch (Exception e) {
            throw new Exception("获取学生分页列表信息时发生异常");
        }

        return result;
    }

    @Override
    public List<Student> exportStus() throws Exception {
        int count = stuMapper.getStuTotalCount(null);
        Map<String, Object> params = new HashMap<>();
        params.put(Constant.ROWS, count);
        params.put(Constant.PAGE, 0);
        List<Student> stuList = stuMapper.getStuList(params);
        return stuList;
    }

    @Override
    public Student findStuById(int id) throws Exception {
        return stuMapper.findStuById(id);
    }

    @Override
    public boolean updateStuById(Student stu) throws Exception {
        int id = stu.getId();
        Student stuById = stuMapper.findStuById(id);
        if (stuById != null) {
            stuById.assign(stu);
            return stuMapper.updateStuById(stuById);
        }

        return false;
    }

    @Override
    public boolean delStuById(int id) throws Exception {
        return stuMapper.delStuById(id);
    }
}
