package com.exskil.service.impl;

import com.exskil.mapper.*;
import com.exskil.po.*;
import com.exskil.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LENOVO on 2017/5/30.
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private OperationMapper operationMapper;

    @Autowired
    private Permission_OperationMapper permission_operationMapper;

    @Autowired
    private User_RoleMapper user_roleMapper;

    @Autowired
    private Role_PermissionMapper role_permissionMapper;


    @Override
    public List<Menu> getCurUserMenu(User user) {
        return null;
    }

    @Override
    public List<Operation> listOperations(User user) {
            //获取当前user的User_Role集合
            User_RoleExample user_roleExample = new User_RoleExample();
            User_RoleExample.Criteria user_roleCirteria = user_roleExample.createCriteria();
            user_roleCirteria.andUidEqualTo(user.getId());
            List<User_Role> user_roles = user_roleMapper.selectByExample(user_roleExample);

            List<Permission> permissions = new ArrayList<>();
            //根据rid集合遍历
            for(User_Role user_role:user_roles){
                int rid = user_role.getRid();
                Role_PermissionExample role_permissionExample = new Role_PermissionExample();
                Role_PermissionExample.Criteria role_permissionCriteria = role_permissionExample.createCriteria();
                role_permissionCriteria.andRidEqualTo(rid);
                List<Role_Permission> role_permissions = role_permissionMapper.selectByExample(role_permissionExample);

                //根据pid集合取得permissions
                for(Role_Permission role_permission:role_permissions){
                    int pid = role_permission.getPid();
                    //通过权限类型获取权限id，这里权限类型是操作，因此查询operation类型的pid
                    Permission permission = permissionMapper.selectByPrimaryKey(pid);
                    permissions.add(permission);
                }
            }

            //遍历Permission，获得Permission_Operation集合
            List<Operation> operations = new ArrayList<>();
            for(Permission p:permissions){
                int pid = p.getId();
                //查询操作id
                Permission_OperationExample permission_operationExample = new Permission_OperationExample();
                Permission_OperationExample.Criteria criteria = permission_operationExample.createCriteria();
                criteria.andPidEqualTo(pid);
                List<Permission_Operation> permission_operations = permission_operationMapper.selectByExample(permission_operationExample);

                //遍历Permission_Operation，获得Operation集合
                for(Permission_Operation permission_operation:permission_operations){
                    int oid = permission_operation.getOid();

                    Operation operation = operationMapper.selectByPrimaryKey(oid);
                    operations.add(operation);
                }
            }
        return operations;
    }

}
