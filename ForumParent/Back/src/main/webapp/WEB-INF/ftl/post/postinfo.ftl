<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>看帖</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="../assets/css/postinfo.css" />
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../layui/css/global.css" />
    <script src="../assets/js/jquery/jquery-1.8.0.js" type="text/javascript"></script>
</head>
<body >
    <#--<div class="postinfo">
        主题：${post.title}
        <br>
        板块：${post.plate}
        <br>
        发帖人：${post.username}
        <br>
        发布时间：${post.time}
        <br>
        <br>
        ${post.content}
        <br>
    </div>
    <div class="reply">
    </div>-->
    <#-- 导航页 -->
    <#include "../public/postheader.ftl"/>
    <#-- 未读消息数量 -->
    <div class="unread">
        <a href="../reply/historymsg.action">您的未读消息:${unreadMsg}</a>
    </div>
            <div class="postinfo">
                主题：${post.title}
                <br>
                板块：${post.getPlate().name}
                <br>
                发帖人：${post.getUser().name}
                <br>
                发布时间：${post.date?string('yyyy-MM-dd HH:mm:ss')}
                <br>
                <br>
                 ${post.content}
                <br>
            </div>
            <div class="main">
                <div class="reply">
                    <#list replies as reply>
                        <input type="hidden" id="${reply.getUser().name}" value="${reply.getUser().name}"/>

                        ${reply.getUser().name}:_${reply.content}
                        ________回复时间：${reply.date?string('yyyy-MM-dd HH:mm:ss')}

                        <button type="button" onclick=getUserName("${reply.getUser().id}","${reply.getUser().name}")>回复</button>
                        <hr>
                    </#list>
                </div>


                <form class="layui-form" action="../reply/addreply.action" method="post" name="addform">
                    <input type="hidden" name="postID" value="${post.id}"/>
                    <input type="hidden" id="to_userID" name="to_userID" value="0"/>
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
                alert($("#reply_editor"))
                $("#reply_editor").text("@"+to_user+"&nbsp&nbsp");

                //获取当前回复的人的id
                $("#to_userID").val(to_userID);
//                alert($("#to_user").val());

                layedit.build('reply_editor'); //建立编辑器
            };

    </script>

</body>

</html>