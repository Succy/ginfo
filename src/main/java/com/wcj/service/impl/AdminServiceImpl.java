package com.wcj.service.impl;

import com.wcj.entity.Admin;
import com.wcj.entity.Student;
import com.wcj.mapper.AdminMapper;
import com.wcj.service.AdminService;
import com.wcj.util.Constant;
import com.wcj.util.EncryptorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.rmi.CodebaseAwareObjectInputStream;
import org.springframework.stereotype.Service;

/**
 * @author Succy
 * @date 2017-04-09 14:00
 **/
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper mapper;

    @Override
    public Admin login(String tid, String pwd) throws Exception {
        Admin admin = new Admin();
        admin.setPwd(pwd);
        admin.setTid(tid);
        return mapper.findAdminByTidAndPwd(admin);
    }

    @Override
    public Admin findAdminById(int id) throws Exception {
        return mapper.findAdminById(id);
    }

    @Override
    public boolean updateAdminById(Admin admin) throws Exception {
        // 先查询，再修改
        int id = admin.getId();
        Admin adminById = mapper.findAdminById(id);
        if (adminById != null) {
            adminById.assign(admin);
           return updateAdminById(adminById);
        }

        return false;
    }

    @Override
    public int updatePwd(int id, String oldPwd, String newPwd) throws Exception {
        oldPwd = EncryptorUtils.md5(Constant.SALT, oldPwd);
        newPwd = EncryptorUtils.md5(Constant.SALT, newPwd);
        int rt = Constant.RespCode.ERROR;
        Admin admin = mapper.findAdminById(id);
        if (admin != null) {
            String pwd = admin.getPwd();
            if (pwd.equals(oldPwd)) {
                admin.setPwd(newPwd);
                boolean result = mapper.updateAdminById(admin);
                if (result)
                    rt = Constant.RespCode.OK;

            }else {
                rt = Constant.RespCode.OLD_PWD_ERR;
            }
        }
        return rt;
    }
}
