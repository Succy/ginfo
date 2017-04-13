package com.wcj.mapper;

import com.wcj.entity.Admin;

/**
 * @author Succy
 * @date 2017-04-09 13:56
 **/

public interface AdminMapper {
    Admin findAdminByTidAndPwd(Admin admin) throws Exception;
    boolean updateAdminById(Admin admin) throws Exception;
    Admin findAdminById(int id) throws Exception;

}
