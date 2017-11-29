<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>重型音乐</title>
    <link href="../assets/css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../assets/js/setHomeSetFav.js"></script>

</head>

<body>
<div class="top">
    <div class="top_content">
        <ul>
            <li><a href="#">联系我们</a></li>
            <li><a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></li>
            <li><a onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a></li>
        </ul>
    </div>
</div>
<!--页面顶端top结束-->

<#include "header.ftl"/>



    <div class="news_list">
        <ul>
            <#list pagehelper.list as var>
                <li><span>${var.date?string('yyyy.MM.dd')}</span> <a href="showarticle.action?articleID=${var.id}">【乐界时讯】${var.title}</a></li>
            </#list>
        </ul>
    </div>
    <!--news_list结束-->
    <div id="page" class="fr"></div>

</div>
<!--news结束-->




<!--main结束-->
</div>
<!--最外层wrap结束  -->
<div class="copyright">
    <div class="copyright_content">
        <ul>
            <li>关于
                <ul>
                    <li>联系我们</li>
                    <li>加入我们</li>
                    <li>版权声明</li>
                </ul>
            </li>
            <li>百科
                <ul>
                    <li>金属乐发展史</li>
                    <li>名人乐队介绍</li>
                    <li>乐器介绍</li>
                    <li>其他相关</li>
                </ul>
            </li>
            <li>关注
                <ul>
                    <li>新浪微博</li>
                    <li>腾讯微博</li>
                    <li>企业微信</li>
                    <li>QQ空间</li>
                </ul>
            </li>
            <li>留言
                <ul>
                    <li>意见反馈</li>
                    <li>问题留言</li>
                    <li>媒体联络</li>
                    <li>在线客服</li>
                </ul>
            </li>
            <li><img src="../assets/images/weixin.png" alt="微信关注" width="30" height="27" />微信关注
                <ul>
                    <li><img src="../assets/images/qrcode.jpg" alt="扫描关注慕课网官方微信" width="102" height="102" /></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--copyright_content结束-->
</div>
<script src="../res/layui/layui.js"></script>
<script>
    layui.config({
        base: '../layui/lay/modules/'
    });

    layui.use(['form', 'element', 'laypage', 'layer'], function() {
        var $ = layui.jquery,
                form = layui.form(),
                layer = layui.layer,
                laypage = layui.laypage,
                element = layui.element();

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
