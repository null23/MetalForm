package com.exskil.mapper;

import com.exskil.po.Permission_Menu;
import com.exskil.po.Permission_MenuExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Permission_MenuMapper {
    int countByExample(Permission_MenuExample example);

    int deleteByExample(Permission_MenuExample example);

    int insert(Permission_Menu record);

    int insertSelective(Permission_Menu record);

    List<Permission_Menu> selectByExample(Permission_MenuExample example);

    int updateByExampleSelective(@Param("record") Permission_Menu record, @Param("example") Permission_MenuExample example);

    int updateByExample(@Param("record") Permission_Menu record, @Param("example") Permission_MenuExample example);
}