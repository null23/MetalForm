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
            <form class="layui-form" action="addnews.action" method="post" name="addform">

                <div class="layui-form-item">
                    <label class="layui-form-label">主题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" size="200px" required  lay-verify="required" value="你想说什么" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <label class="layui-form-label">编辑器</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor">测试文本</textarea>
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">跳转式提交</button>
                </div>
            </form>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>

</div>

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
    });
</script>

</body>

</html>