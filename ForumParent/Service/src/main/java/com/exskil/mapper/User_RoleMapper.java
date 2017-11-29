package com.exskil.mapper;

import com.exskil.po.User_Role;
import com.exskil.po.User_RoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface User_RoleMapper {
    int countByExample(User_RoleExample example);

    int deleteByExample(User_RoleExample example);

    int insert(User_Role record);

    int insertSelective(User_Role record);

    List<User_Role> selectByExample(User_RoleExample example);

    int updateByExampleSelective(@Param("record") User_Role record, @Param("example") User_RoleExample example);

    int updateByExample(@Param("record") User_Role record, @Param("example") User_RoleExample example);
}