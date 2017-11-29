<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>基于 layui 的极简社区页面模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../res/layui/css/layui.css">
  <link rel="stylesheet" href="../res/css/global.css">
</head>
<body>

<#include "../public/header.ftl"/>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content">
      <div class="fly-tab fly-tab-index">
        <span>
         
        </span>
        <#--<form action="http://cn.bing.com/search" class="fly-search">-->
          <#--<i class="iconfont icon-sousuo"></i>-->
          <#--<input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">-->
        <#--</form>-->
        <a href="beforeaddpost.action" class="layui-btn jie-add">我要发帖</a>
      </div>
      
      
      <ul class="fly-list fly-list-top">
        <#list topList as var>
            <a href="../post/showpost.action?postID=${var.id}" class="fly-list-avatar">
            </a>
            <h2 class="fly-tip">
                <a href="../post/showpost.action?postID=${var.getPost().id}">${var.getPost().title}</a>
                <span class="fly-tip-stick">置顶</span>
            </h2>
            <p>
                <span><a href="user/home.html">发帖人：${var.getUser().name}</a></span>
                <span class="fly-list-hint">
                      <i class="iconfont" title="回答">&#xe60c;</i> 502
                      <i class="iconfont" title="人气">&#xe60b;</i> 81689
                    </span>
            </p>
        </#list>
      </ul>
      
      <ul class="fly-list">
        <#list pagehelper.list as var>
            <li class="fly-list-li">
                <a href="user/home.html" class="fly-list-avatar">
                    <img src="../res/images/avatar/default.png" alt="">
                </a>
                <a href="$post/postinfo.action?postID=${var.id}" class="fly-list-avatar">

                </a>
                <h2 class="fly-tip">
                    <a href="showpost.action?postID=${var.id}">${var.title}</a>
                </h2>
                <p>
                    <span><a href="/">${var.getUser().name}</a></span>

                    <span></span>
                    <span class="fly-list-hint">
                      <i class="iconfont" title="回复数">&#xe60c;</i> ${var.replies}
                      <i class="iconfont" title="浏览量">&#xe60b;</i> ${var.views}
                    </span>
                </p>
            </li>
        </#list>
      </ul>
        <div id="page" class="fr"></div>
      
      <div style="text-align: center">
        <div class="laypage-main">
          <a href="jie/index.html" class="laypage-next">更多求解</a>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="edge">
    
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
        <#list hotList as var>
            <dd>
                <a href="showpost.action?postID=${var.id}">${var.title}</a>
                <span><i class="iconfont">&#xe60b;</i> ${var.views}</span>
            </dd>
        </#list>
    </dl>
    
   
    
   

  </div>
</div>

<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy;</p>
</div>
<script src="../res/layui/layui.js"></script>
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