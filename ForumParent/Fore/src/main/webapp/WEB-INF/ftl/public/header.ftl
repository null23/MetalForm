<div class="header">
    <div class="main">
        <a class="logo" href="../admin/main.action" title="Fly">Fly社区</a>
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
                <a href="../reply/historymsg.action"><i class="iconfont icon-shezhi"></i>个人中心(#{unreadMsg})</a>
            </#if>
                <a href="../logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>注销</a>
            </div>

        </div>
    </div>
</div>