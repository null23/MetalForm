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

            <div class="layui-form" style="line-height: 10px;">
                <table class="layui-table">
                    <colgroup>
                        <col width="50">
                        <col width="80">
                        <col width="230">
                        <col width="230">
                        <col width="230">
                    </colgroup>
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="checkAll" lay-skin="primary" lay-filter="checkAll"></th>
                        <th>用户名</th>
                        <th>禁言</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pagehelper.list as var>
                    <tr>
                        <td><input type="checkbox" name="ids" id="${var.id}" lay-skin="primary" lay-filter="checkOne"></td>
                        <td>${var.name}</td>
                        <td>
                            <a href="addgag.action?uid=${var.id}"><button class="layui-btn layui-btn-danger layui-btn-small btn-my-del" del-id="del('');" del-name=" '' " title="查看">
                                <i class="layui-icon">&#xe617;</i>
                            </button></a>
                        </td>
                    </tr>

                    </#list>
                    </tbody>
                </table>
                <div id="page" class="fr"></div>
            </div>
        </div>
    </div>
<#include "../public/bottom.ftl"/>
</div>

</div>

<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
</div>
<script>
    layui.config({
        base: '../layui/lay/modules/' //��������test.js���ڵ�Ŀ¼
    });

    layui.use(['form', 'element', 'laypage', 'layer'], function() {
        var $ = layui.jquery,
                form = layui.form(),
                layer = layui.layer,
                laypage = layui.laypage,
                element = layui.element();

        <#--mypage.page(${pagehelper.total}, 3, ${pagehelper.pageNum});-->
        laypage({
            cont: 'page'
            ,pages: ${pagehelper.pages}
            ,curr:${pagehelper.pageNum}
            ,skin: '#1E9FFF'
            ,jump: function(obj, first){
            if(!first){
                window.location.href='listuser.action?pageNum='+obj.curr;
            }
        }
        });
        //ȫѡ
        form.on('checkbox(checkAll)', function(data) {
            if(data.elem.checked) {
                $("input[type='checkbox']").prop('checked', true);
            } else {
                $("input[type='checkbox']").prop('checked', false);
            }
            form.render('checkbox');
        });

        form.on('checkbox(checkOne)', function(data) {
            var is_check = true;
            if(data.elem.checked) {
                $("input[lay-filter='checkOne']").each(function() {
                    if(!$(this).prop('checked')) {
                        is_check = false;
                    }
                });
                if(is_check) {
                    $("input[lay-filter='checkAll']").prop('checked', true);
                }
            } else {
                $("input[lay-filter='checkAll']").prop('checked', false);
            }
            form.render('checkbox');
        });



    });
</script>
</body>

</html>