package com.exskil.mapper;

import com.exskil.po.Role_Permission;
import com.exskil.po.Role_PermissionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Role_PermissionMapper {
    int countByExample(Role_PermissionExample example);

    int deleteByExample(Role_PermissionExample example);

    int insert(Role_Permission record);

    int insertSelective(Role_Permission record);

    List<Role_Permission> selectByExample(Role_PermissionExample example);

    int updateByExampleSelective(@Param("record") Role_Permission record, @Param("example") Role_PermissionExample example);

    int updateByExample(@Param("record") Role_Permission record, @Param("example") Role_PermissionExample example);
}