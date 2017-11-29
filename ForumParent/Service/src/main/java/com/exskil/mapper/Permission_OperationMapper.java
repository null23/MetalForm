package com.exskil.mapper;

import com.exskil.po.Permission_Operation;
import com.exskil.po.Permission_OperationExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Permission_OperationMapper {
    int countByExample(Permission_OperationExample example);

    int deleteByExample(Permission_OperationExample example);

    int insert(Permission_Operation record);

    int insertSelective(Permission_Operation record);

    List<Permission_Operation> selectByExample(Permission_OperationExample example);

    int updateByExampleSelective(@Param("record") Permission_Operation record, @Param("example") Permission_OperationExample example);

    int updateByExample(@Param("record") Permission_Operation record, @Param("example") Permission_OperationExample example);
}