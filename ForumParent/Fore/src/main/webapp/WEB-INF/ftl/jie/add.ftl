
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发表问题 编辑问题 公用</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/css/global.css">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../layui/css/global.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

<#include "../public/header.ftl"/>

<div class="main layui-clear">
  <div class="fly-panel" pad20>

    <!-- <div class="fly-none">并无权限</div> -->

    <div class="layui-form layui-form-pane">
        <form class="layui-form" action="addpost.action" method="post" name="addform">

            <div class="layui-form-item">
                <label class="layui-form-label">主题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" size="200px" required  lay-verify="required" value="你想说什么" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">单行选择框</label>
                <div class="layui-input-block">
                    <select name="plateID">
                    <#list plateList as plate>
                        <option value="${plate.id}">${plate.name}</option>
                    </#list>
                    </select>
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
</div>


<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/">layui.com</a></p>
  <p>
    <a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a>
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
  </p>
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