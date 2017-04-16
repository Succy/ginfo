package com.wcj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.wcj.entity.Admin;
import com.wcj.entity.Student;
import com.wcj.service.AdminService;
import com.wcj.service.StuService;
import com.wcj.util.Constant;
import com.wcj.util.EncryptorUtils;
import com.wcj.util.POIUtils;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * @author Succy
 * @date 2017-03-26 17:13
 **/
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private StuService stuService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login.action")
    public String login(String sid, String pwd, boolean isStu, HttpSession session) {
        pwd = EncryptorUtils.md5(Constant.SALT, pwd);
        // ModelAndView mdv = new ModelAndView();
        try {
            if (isStu) {
                // 学生登录
                Student student = stuService.login(sid, pwd);
                if (student != null) {
                    session.setAttribute("student", student);
                    session.setAttribute("msg", null);
                    return "redirect:/jsp/index.jsp";
                } else {
                    session.setAttribute("msg", "用户名或密码错误");
                    return "redirect:/login.jsp";
                }
            } else {
                // 管理员登录
                Admin admin = adminService.login(sid, pwd);
                if (admin != null) {
                    session.setAttribute("admin", admin);
                    session.setAttribute("msg", null);
                    return "redirect:/jsp/admin/admin.jsp";
                } else {
                    session.setAttribute("msg", "用户名或密码错误");
                    return "redirect:/login.jsp";
                }
            }
        } catch (Exception e) {
            session.setAttribute("msg", "用户名或密码错误");
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("/updateInfo.action")
    public
    @ResponseBody
    JSONObject updateInfo(Student stu, HttpSession session) {
        //System.out.println("stu  ==> "+stu);
        JSONObject json = new JSONObject();
        boolean success = Constant.FAILURE;
        try {
            success = stuService.updateStuById(stu);
            Student stuById = stuService.findStuById(stu.getId());
            session.setAttribute("student", stuById);
            json.put("msg", "更新用户信息成功");

        } catch (Exception e) {
            json.put("msg", "更新用户信息失败，请稍后重试");
        }
        json.put("success", success);
        return json;
    }

    @RequestMapping("/forgetPwd.action")
    public
    @ResponseBody
    JSONObject forgetPwd(String email, String sid, String pwd, boolean isStu) {
        JSONObject json = new JSONObject();
        boolean success = Constant.FAILURE;

        try {
            if (isStu) {
                Student stu = new Student();
                stu.setSid(sid);
                stu.setEmail(email);
                Student student = stuService.findStuBySidAndEmail(stu);
                // String pwd = stu.getPwd();
                pwd = EncryptorUtils.md5(Constant.SALT, pwd);
                student.setPwd(pwd);
                success = stuService.updateStuById(student);
            } else {
                Admin admin = new Admin();
                admin.setTid(sid);
                admin.setEmail(email);
                Admin adminByTidAndEmail = adminService.findAdminByTidAndEmail(admin);
                //String pwd = admin.getPwd();
                pwd = EncryptorUtils.md5(Constant.SALT, pwd);
                adminByTidAndEmail.setPwd(pwd);
                success = adminService.updateAdminById(adminByTidAndEmail);
            }
            json.put("msg", "修改密码成功");
        } catch (Exception e) {
            json.put("msg", "修改密码失败，请稍后重试");
        }
        json.put("success", success);
        return json;
    }

    @RequestMapping("/updatePwd.action")
    public
    @ResponseBody
    JSONObject updatePwd(int id, String oldPwd, String newPwd, boolean isStu) {
        JSONObject json = new JSONObject();
        boolean success = Constant.FAILURE;
        int rt;
        try {
            if (isStu) {
                rt = stuService.updateStuPwd(id, oldPwd, newPwd);
            } else {
                rt = adminService.updatePwd(id, oldPwd, newPwd);
            }
            if (rt == Constant.RespCode.OK) {
                success = true;
                json.put("msg", "修改密码成功");
            } else if (rt == Constant.RespCode.OLD_PWD_ERR) {
                json.put("msg", "旧密码错误");
            } else {
                json.put("msg", "网络错误，请稍后重试");
            }
        } catch (Exception e) {
            json.put("msg", "网络错误，请稍后重试");
        }
        json.put("success", success);

        return json;
    }

    @RequestMapping("/logout.action")
    public String logout(boolean isStu, HttpSession session) {
        if (isStu) {
            session.setAttribute("student", null);
        } else {
            session.setAttribute("admin", null);
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/uploadAvatar.action")
    public
    @ResponseBody
    JSONObject uploadAvatar(MultipartFile avatarFile, int id) {
        JSONObject json = new JSONObject();
        boolean success = false;
        String pictureFile_name = avatarFile.getOriginalFilename();
        String suffix = pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
        suffix = suffix.toLowerCase();
        List<String> suffixList = Arrays.asList(".jpg", ".png", ".bmp", ".jpeg");
        if (!suffixList.contains(suffix)) {
            json.put("success", success);
            json.put("msg", "图片格式不正确");
            return json;
        }
        //新文件名称
        String newFileName = EncryptorUtils.md5(Constant.SALT, pictureFile_name) + suffix;
        String baseDir = "I:/idea_vd/avatar";
        File unloadAvatar = new File(baseDir + "/" + newFileName);
        if (!unloadAvatar.exists()) {
            unloadAvatar.mkdirs();
        }
        try {
            avatarFile.transferTo(unloadAvatar);
            String avatPath = "static/avatar/" + newFileName;
            Student student = new Student();
            student.setId(id);
            student.setAvatar(avatPath);
            success = stuService.updateStuById(student);
            json.put("avatar", avatPath);
        } catch (Exception e) {
            success = false;
        }
        String msg = success ? "图片上传成功" : "图片上传失败";
        json.put("success", success);
        json.put("msg", msg);
        return json;
    }

    @RequestMapping("/delStu.action")
    public
    @ResponseBody
    JSONObject delStu(int id) {
        JSONObject json = new JSONObject();
        boolean success;
        try {
            success = stuService.delStuById(id);
        } catch (Exception e) {
            success = Constant.FAILURE;
        }
        String msg = success ? "删除学生信息成功" : "删除学生信息失败";
        json.put("success", success);
        json.put("msg", msg);
        return json;
    }

    @RequestMapping("/getStuById.action")
    public String getStuById(int id, HttpServletRequest request) {
        try {
            Student stu = stuService.findStuById(id);
            if (stu != null) {
                request.setAttribute("student", stu);
                return "forward:/jsp/index.jsp";
            }
        }catch (Exception e) {

        }
        return "";
    }

    @RequestMapping("/importStus.action")
    public
    @ResponseBody
    JSONObject importStus(MultipartFile file) {
        JSONObject json = new JSONObject();
        boolean success = false;
        String pictureFile_name = file.getOriginalFilename();
        String suffix = pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
        if (!".xls".equalsIgnoreCase(suffix)) {
            json.put("success", success);
            json.put("msg", "上传文件格式不正确");
            return json;
        }
        //新文件名称
        String newFileName = UUID.randomUUID().toString() + suffix;

        String baseDir = "src/main/tmp";
        File excelFile = new File(baseDir + "/" + newFileName);
        if (!excelFile.exists()) {
            excelFile.mkdirs();
        }
        try {
            file.transferTo(excelFile);
            FileInputStream fin = new FileInputStream(excelFile);
            int count = stuService.importStus(fin);
            json.put("count", count);
            success = true;
        } catch (Exception e) {
            success = false;
        }
        String msg = success ? "学生信息导入成功" : "学生信息导入失败";
        json.put("success", success);
        json.put("msg", msg);
        return json;
    }

    @RequestMapping("/getStuList.action")
    public
    @ResponseBody
    Map<String, Object> getStuList(int rows, int page, String searchArg) {
        Map<String, Object> result = new HashMap<>();
        result.put(Constant.TOTAL, 0);
        result.put(Constant.RESULT, null);

        try {
            result = stuService.getStuList(rows, page, searchArg);
            result.put("success", Constant.SUCCESS);
        } catch (Exception e) {
            result.put("success", Constant.FAILURE);
        }
        return result;
    }

    @RequestMapping("/exportStus.action")
    public ResponseEntity<byte[]> exportStus() {
        ResponseEntity<byte[]> respEntity = null;
        try {
            //src/main/webapp
            String path = "src/main/tmp";
            File baseDir = new File(path);
            if (!baseDir.exists()) {
                baseDir.mkdirs();
            }
            String outFileName = path + "/学生信息.xls";

            List<Student> students = stuService.exportStus();
            FileOutputStream out = new FileOutputStream(outFileName);
            String[] headers = {Constant.Info.Stu.SID, Constant.Info.Stu.NAME, Constant.Info.Stu.GRADE, Constant.Info.Stu.BIRTH,
                    Constant.Info.Stu.NATION, Constant.Info.Stu.EMAIL, Constant.Info.Stu.QQ, Constant.Info.Stu.MOBI,
                    Constant.Info.Stu.SCHOOL, Constant.Info.Stu.COLLAGE, Constant.Info.Stu.GENDER,
                    Constant.Info.Stu.MAJOR, Constant.Info.Stu.POLITICS_STATUS, Constant.Info.Stu.ADDRESS};

            boolean success = POIUtils.exportExcel(students, headers, out);
            if (success) {
                File file = new File(outFileName);
                HttpHeaders httpHeaders = new HttpHeaders();
                String fileName = new String("学生信息.xls".getBytes("UTF-8"), "iso-8859-1");
                httpHeaders.setContentDispositionFormData("attachment", fileName);
                httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                respEntity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), httpHeaders, HttpStatus.CREATED);
                // 删除临时文件
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return respEntity;
    }
}
