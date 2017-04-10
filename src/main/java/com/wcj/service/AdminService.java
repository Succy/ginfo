package com.wcj.service;

import com.wcj.entity.Admin;

public interface AdminService {
    Admin login(String tid, String pwd) throws Exception;
}
