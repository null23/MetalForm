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
                <tr>
                    <td>Web Master：</td>
                    <td>All Permissions</td>
                </tr>
                <tr>
                    <td>资源管理员：</td>
                    <td>新闻发布，文章发布，资源发布</td>
                </tr>
                <tr>
                    <td>论坛管理员：</td>
                    <td>用户管理，论坛管理</td>
                </tr>
            </table>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>
</div>
</body>

</html>