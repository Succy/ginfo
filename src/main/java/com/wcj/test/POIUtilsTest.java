package com.wcj.test;

import com.wcj.entity.Student;
import com.wcj.mapper.StuMapper;
import com.wcj.util.Constant;
import com.wcj.util.EncryptorUtils;
import com.wcj.util.POIUtils;
import com.wcj.util.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Succy
 * @date 2017-04-03 11:29
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-*.xml")
public class POIUtilsTest {
    @Autowired
    private StuMapper mapper;

    @Test
    public void testExportExcel() {
        try {
            //  String inFileName = "I:\\excel\\软件134（已修改）.xls";
            String outFileName = "I:\\excel\\test1.xls";
            FileInputStream fin = new FileInputStream(outFileName);
            List<Student> students = POIUtils.importExcel(fin);
            if (students != null && !students.isEmpty()) {

                for (Student student : students) {
                    if (StringUtils.isEmpty(student.getPwd())) {
                        student.setPwd(EncryptorUtils.md5(Constant.SALT, "123456"));
                    }
                    System.out.println(student);
                }


                Map<String, List<Student>> map = new HashMap<>();
                map.put("stus", students);
                System.out.println("mapper" + mapper);
                int row = mapper.insertStus(students);
                System.out.println("success count: " + row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testMapper() throws Exception{
        System.out.println(mapper);
    }

    @Test
    public void testImportExcel() {
        try {
            String inFileName = "I:\\excel\\软件134（已修改）.xls";
            String outFileName = "I:\\excel\\test1.xls";
            FileInputStream fin = new FileInputStream(outFileName);
            List<Student> students = POIUtils.importExcel(fin);
            if (students != null && !students.isEmpty()) {
                //FileOutputStream out = new FileOutputStream(outFileName);
                //String[] headers = {Constant.Info.Stu.SID, Constant.Info.Stu.NAME, Constant.Info.Stu.GRADE, Constant.Info.Stu.BIRTH,
                //        Constant.Info.Stu.NATION, Constant.Info.Stu.EMAIL, Constant.Info.Stu.QQ, Constant.Info.Stu.MOBI,
                //        Constant.Info.Stu.SCHOOL, Constant.Info.Stu.COLLAGE, Constant.Info.Stu.GENDER,
                //        Constant.Info.Stu.MAJOR, Constant.Info.Stu.POLITICS_STATUS, Constant.Info.Stu.ADDRESS};
                //
                //boolean success = POIUtils.exportExcel(students, headers, out);
                //System.out.println("is success: " + success);
                for (Student stu : students) {
                    System.out.println(stu);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
