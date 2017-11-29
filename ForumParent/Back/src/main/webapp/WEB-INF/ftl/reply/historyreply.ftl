<!DOCTYPE html>
<html>
<head>
    <title>未读信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../assets/css/historymessage.css" />
    <script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="historymsg">
    <#list pagehelper.list as reply>
        回复人：${reply.getUser().name}
        <br>
        主题：<a href="../post/showpost.action?postID=${reply.getPost().id}">${reply.getPost().title}</a>
        <br>
        回复内容：${reply.content}
        <br>
        回复时间：${reply.date?string('yyyy-MM-dd HH:mm:ss')}
        <hr>
    </#list>
        <div id='page' class="fr"></div>
</div>
<script>
    layui.use('laypage', function(){
        var laypage = layui.laypage;
    <#--mypage.page(${pagehelper.total}, 3, ${pagehelper.pageNum});-->
    laypage({
        cont: 'page'
        ,pages: ${pagehelper.pages}
        ,curr:${pagehelper.pageNum}
        ,skin: '#1E9FFF'
        ,jump: function(obj, first){
            if(!first){
                window.location.href='historymsg.action?pageNum='+obj.curr;
            }
        }
    });
    });
</script>
</body>

</html>