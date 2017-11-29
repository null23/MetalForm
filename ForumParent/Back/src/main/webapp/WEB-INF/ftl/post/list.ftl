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
                        <th>ID</th>
                        <th>主题</th>
                        <th>发帖人</th>
                        <th>板块</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list topList as var>
                    <tr>
                        <td><input type="checkbox" name="ids" id="${var.id}" lay-skin="primary" lay-filter="checkOne"></td>
                        <td>${var_index+1}</td>
                        <td>${var.getPost().title}</td>
                        <td>${var.getUser().name}</td>
                        <td>置顶区</td>
                        <td>${var.getPost().date?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>
                            <a href="deletetoppost.action?tid=${var.id}">取消置顶</a>
                        </td>
                    </tr>

                    </#list>
                    </tbody>
                </table>
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
                        <th>ID</th>
                        <th>主题</th>
                        <th>发帖人</th>
                        <th>板块</th>
                        <th>最后回复时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list pagehelper.list as var>
                    <tr>
                        <td><input type="checkbox" name="ids" id="${var.id}" lay-skin="primary" lay-filter="checkOne"></td>
                        <td>${var_index+1}</td>
                        <td>${var.title}</td>
                        <td>${var.getUser().name}</td>
                        <td>${var.getPlate().name}</td>
                        <td>${var.reply_date?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td>
                            <button class="layui-btn layui-btn-danger layui-btn-small btn-my-del" del-id="del('${var.id}');" del-name=" '${var.title}' " title="删除">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                            <a href="addtoppost.action?postID=${var.id}"><button class="layui-btn layui-btn-danger layui-btn-small btn-my-del" del-id="del('${var.id}');" del-name=" '${var.title}' " title="编辑">
                                <i class="layui-icon">&#xe642;</i>
                            </button></a>
                            <a href="showpost.action?postID=${var.id}"><button class="layui-btn layui-btn-danger layui-btn-small btn-my-del" del-id="del('${var.id}');" del-name=" '${var.title}' " title="查看">
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
                window.location.href='listpost.action?pageNum='+obj.curr;
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