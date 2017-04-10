package com.wcj.test;

import com.wcj.entity.Student;
import com.wcj.mapper.StuMapper;
import com.wcj.util.Constant;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Succy
 * @date 2017-04-08 10:42
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-*.xml")
public class StuMapperTest {
    @Autowired
    StuMapper mapper;

    @Test
    public void testPagination() throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put(Constant.ROWS, 10);
        params.put(Constant.PAGE, 0);
        params.put(Constant.SEARCH_ARG, "软件工程");
        List<Student> stuList = mapper.getStuList(params);
        stuList.forEach(System.out::println);
    }

    @Test
    public void testGetToalCount() throws Exception {
        Map<String, Object> args = new HashMap<>();
        args.put(Constant.SEARCH_ARG, "201300406132");
        int count = mapper.getStuTotalCount(args);
        System.out.println("count = " + count);
    }

    @Test
    public void testFindStuById() throws Exception {
        Student student = mapper.findStuById(2);
        System.out.println("student = " + student);
    }

    @Test
    public void testUpdateStuById() throws Exception {
        // 先查询，再修改
        Student student = mapper.findStuById(2);
        System.out.println(student);
        student.setAddress("广西柳州市城中区东环大道268号");

        boolean success = mapper.updateStuById(student);
        System.out.println("success=" + success);
    }

}
