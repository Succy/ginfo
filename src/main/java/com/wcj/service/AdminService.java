package com.wcj.service;

import com.wcj.entity.Admin;

public interface AdminService {
    Admin login(String tid, String pwd) throws Exception;
    Admin findAdminById(int id) throws Exception;
    boolean updateAdminById(Admin admin) throws Exception;
    int updatePwd(int id, String oldPwd, String newPwd) throws Exception;
}
