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
            <div style="height: 30px;line-height: 30px;  background-color: #e2e2e2">
						<span class="layui-breadcrumb" style="margin-left: 15px;">
 				 <a href="../admin/index.action">返回首页</a>
				</span>
            </div>
            <form class="layui-form" action="updatepost.action" method="post">
                <input type="hidden" name="id" size="200px" required  lay-verify="required" value="${list.postID}" autocomplete="off" class="layui-input">
                <div class="layui-form-item">
                    <label class="layui-form-label">主题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" size="200px" required  lay-verify="required" value="${list.title}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">发布者</label>
                    <div class="layui-input-block">
                        <input type="text" name="user" size="200px" required  lay-verify="required" value="${list.username}" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">编辑器</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor">${list.content}</textarea>
                    </div>
                </div>
                <#--<div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <input type="text" name="user" size="200px" required  lay-verify="required" value="${list.content}" autocomplete="off" class="layui-input">
                    </div>
                </div>-->

                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
                </div>
            </form>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>

</div>

<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(*)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>
</body>

</html>