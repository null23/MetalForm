<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>帖子列表</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../layui/css/global.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
<div class="layui-layout layui-layout-admin">
<#include "../public/header.ftl"/>
<#include "../public/left.ftl"/>
    <div class="layui-body site-demo">
        <div class="layui-main">
            <table class="layui-table">
                <tr bgcolor="gray">
                    <td>用户名：</td>
                    <td>角色：</td>
                </tr>
            <#list users as user>
                <tr>
                    <td>${user.name}</td>
                    <td>${user.getRole().name}</td>
                </tr>
            </#list>

            </table>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>
</div>
</body>

</html>