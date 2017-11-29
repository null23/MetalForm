<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Fly Template v2.0，基于 layui 的轻量级社区模版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/css/global.css">
    <script src="../assets/js/jquery/jquery-1.8.0.js" type="text/javascript"></script>
</head>
<body>

<#include "../public/header.ftl"/>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
        <h1>主题：${post.title}</h1>
        <div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
          <div class="fly-list-hint"> 
            <i class="iconfont" title="回答">&#xe60c;</i> ${post.replies}
            <i class="iconfont" title="人气">&#xe60b;</i> ${post.views}
          </div>
        </div>

            Author：
            <cite>
                ${post.getUser().name}
            </cite>+++++
            Plate：
            <cite>
            ${post.getPlate().name}
            </cite>
        
        <div class="detail-body photos" style="margin-bottom: 20px;">
            发布时间：${post.date?string('yyyy-MM-dd HH:mm:ss')}
            <br>
            ${post.content}
        </div>
      <#if Session.usercode??>
          <#if Session.usercode == post.getUser().name>
          <a href="../post/deletepost.action?postID=${post.id}"><i class="iconfont icon-shezhi"></i>*删除本帖</a>
      </#if>
      </#if>

      </div>

      <div class="fly-panel detail-box" style="padding-top: 0;">
        <ul class="jieda photos" id="jieda">
          <#list replies as reply>
            <li data-id="12" class="jieda-daan">
              <div class="detail-about detail-about-reply">
                <a class="jie-user" href="">
                  <img src="../res/images/avatar/default.png" alt="">
                  <cite>
                    <i>${reply.getUser().name}</i>
                  </cite>
                </a>
                <div class="detail-hits">
                </div>
              </div>
              <div class="detail-body jieda-body">
              ${reply.content}
              </div>
              <div class="jieda-reply">

                  <button type="button" onclick=getUserName("${reply.getUser().id}","${reply.getUser().name}")>回复</button>
                  <#if Session.usercode??>
                      <#if Session.usercode == reply.getUser().name>
                          <a href="../reply/deletereply.action?replyID=${reply.id}&postID=${post.id}"><i class="iconfont icon-shezhi"></i>*删除回复</a>
                      </#if>
                  </#if>
              </div>
            </li>
          </#list>
        </ul>

        <div class="layui-form layui-form-pane">
            <form class="layui-form" action="../reply/addreply.action" method="post" name="addform">
                <input type="hidden" name="postID" value="${post.id}"/>
                <input type="hidden" id="to_userID" name="to_userID" value="${post.getUser().id}"/>
                <div class="layui-input-block">
                    <div class="edit_reply">
                        <textarea  class="layui-textarea layui-hide" name="content"  lay-verify="content" id="reply_editor"></textarea>
                    </div>
                </div>

                <div class="btn_reply">
                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">回复</button>
                    </div>
                </div>
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

<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var layedit;
    layui.use(['form', 'layedit',"layer",'upload'], function(){
        var form = layui.form(),
                layer = layui.layer;
        layedit = layui.layedit,
                layedit.set({
                    uploadImage: {
                        url: 'addImage.action' //接口url
                        ,type: 'post' //默认post
                        ,success:function (json) {
                            console.log(json);
                        }
                    }
                });
        var index = layedit.build('reply_editor'); //建立编辑器

        //监听提交
        form.on('submit(*)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });
    });

    function getUserName(to_userID,to_user) {
        //在编辑框加入@xxx
        $("#reply_editor").text("@"+to_user+"&nbsp&nbsp");

        //获取当前回复的人的id
        $("#to_userID").val(to_userID);

        layedit.build('reply_editor'); //建立编辑器
    };

</script>

</body>

</html>