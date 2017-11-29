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
            <form id="myform" class="layui-form" action="addpermission.action" method="post" name="addform">

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" size="200px" required  lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">权限选择：</label>
                    <div class="layui-input-block">
                        <select name="roleID">
                        <#list rolelist as role>
                            <option value="${role.id}">${role.name}</option>
                        </#list>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="myclick()">跳转式提交</button>
                </div>
            </form>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>
</div>
</body>
<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit',"layer",'upload'], function(){
        var form = layui.form(),
                layedit = layui.layedit,
                layer = layui.layer;

        layedit.set({
            uploadImage: {
                url: 'addImage.action' //接口url
                ,type: 'post' //默认post
                ,dataType:"json"
                ,success:function (json) {
                    console.log(json);
                }
            }
        });
//        layui.upload({success:alert(1)});
        layedit.build('LAY_demo_editor'); //建立编辑器
        //监听提交
        form.on('submit(*)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });

        function myclick() {
            $.ajax({
                url : 'addpermission.action',
                type : 'post',
                data : $("#myform").serialize(),
                success : function(data) {
                    alert("xxxxxxxxxxxxxxxxx")
                    if (data == 'success') {
                        layer.msg("成功");
                    }else if(data == 'usererror'){
                        layer.msg("用户名不存在");
                    }else{
                        layer.msg("未知的错误");
                    }
                },
                error:   function(){
                    alert(11111111);
                }
            });
        }
    });

</script>

</html>