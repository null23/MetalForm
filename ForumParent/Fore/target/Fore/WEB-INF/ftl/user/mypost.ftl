
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>我的消息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../res/layui/css/layui.css">
  <link rel="stylesheet" href="../res/css/global.css">
</head>
<body>

<div class="header">
    <div class="main">
        <a class="logo" href="/" title="Fly">Fly社区</a>
        <div class="nav-user">

            <!-- 未登入状态 -->
        <#if Session.usercode??>
            <cite >
                欢迎：
            ${Session.usercode}

            </cite>
        <#else>
            <a class="unlogin" href="user/login.html"><i class="iconfont icon-touxiang"></i></a>
            <span>
          <a href="../user/login.action">登入</a>
          <a href="../user/beforeregist.action">注册</a>
      </span>
            <p class="out-login">
            </p>
        </#if>

        <#--<#if  Session.usercode!exists>-->
        <#---->
        <#--</#if>-->

        <#---->
        <#--<!-- 登入后的状态 &ndash;&gt;-->
        <#--<a class="avatar" href="user/index.html">-->
        <#--<cite>-->
        <#--<#if Session.usercode?exists>-->
        <#--${Session.usercode}-->
        <#--</#if>-->
        <#--</cite>-->
        <#--</a>-->
            <div class="nav">
            <#if Session.usercode??>
                <a href="../reply/historymsg.action"><i class="iconfont icon-shezhi"></i>个人中心(0)</a>
            </#if>
                <a href="../logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>注销</a>
            </div>

        </div>
    </div>
</div>

<div class="main fly-user-main layui-clear">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item layui-this">
      <a href="../reply/historymsg.action">
        <i class="layui-icon">&#xe611;</i>
        我的消息
      </a>
    </li>
      <li class="layui-nav-item layui-this">
          <a href="../post/listpost.action">
              <i class="layui-icon">&#xe611;</i>
              回到论坛
          </a>
      </li>
      <li class="layui-nav-item layui-this">
          <a href="../post/listpost.action">
              <i class="layui-icon">&#xe611;</i>
              我的帖子
          </a>
      </li>
      <li class="layui-nav-item layui-this">
          <a href="../post/myrecycle.action">
              <i class="layui-icon">&#xe611;</i>
              回收站
          </a>
      </li>
  </ul>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>

  <div class="fly-panel fly-panel-user" pad20>
	  <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
	    <div  id="LAY_minemsg" style="margin-top: 10px;">
        <!--<div class="fly-none">您暂时没有最新消息</div>-->
        <ul class="mine-msg">
          <#list pagehelper.list as post>
            <li data-id="123">
              <blockquote class="layui-elem-quote">
                  标题：<a href="../post/showpost.action?postID=${post.id}">${post.title}</a>
                  <br>
                  发布时间：${post.date?string('yyyy-MM-dd HH:mm:ss')}
              </blockquote>
            </li>
          </#list>
        </ul>
            <div id='page' class="fr"></div>
      </div>
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
<script src="../res/layui/layui.js"></script>
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
                    window.location.href='mypost.action?pageNum='+obj.curr;
                }
            }
        });
    });
</script>

</body>
</html>