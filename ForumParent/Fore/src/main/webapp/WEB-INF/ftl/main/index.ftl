<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>重型音乐</title>
    <link href="../assets/css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../assets/js/setHomeSetFav.js"></script>
    <script type="text/javascript" src="../assets/js/myfocus-2.0.1.min.js" charset="utf-8"></script><!--引入myFocus库-->
    <script type="text/javascript">
        myFocus.set({
            id:'boxID',//焦点图盒子ID
            pattern:'mF_fancy',//风格应用的名称
            time:3,//切换时间间隔(秒)
            trigger:'click',//触发切换模式:'click'(点击)/'mouseover'(悬停)
            width:1000,//设置图片区域宽度(像素)
            height:310,//设置图片区域高度(像素)
            txtHeight:'default'//文字层高度设置(像素),'default'为默认高度，0为隐藏
        });
    </script>
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

    <div class="ad">
        <div id="boxID"><!--焦点图盒子-->
            <div class="loading"><img src="../assets/images/loading.gif" alt="请稍候..." /></div>
            <!--载入画面(可删除)-->
            <div class="pic"><!--内容列表(li数目可随意增减)-->
                <ul>
                    <li><a href="#"><img src="../assets/images/ad2.jpg" thumb="" alt="" text="详细描述2" /></a></li>
                    <li><a href="#"><img src="../assets/images/ad3.jpg" thumb="" alt="" text="详细描述3" /></a></li>
                    <li><a href="#"><img src="../assets/images/ad4.jpg" thumb="" alt="" text="详细描述4" /></a></li>
                    <li><a href="#"><img src="../assets/images/ad3.jpg" thumb="" alt="" text="详细描述5" /></a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--ad结束-->

    <div class="main">
        <div class="news">
            <div class="title">
                <h2 class="titile_left">乐讯中心</h2>
                <span class="title_right"><a href="#">More&gt;&gt;</a></span> </div>
            <!--title结束-->

            <div class="news_list">
                <ul>
                  <#list news as var>
                      <li><span>${var.date?string('yyyy-MM-dd HH:mm:ss')}</span> <a href="../news/shownews.action?newsID=${var.id}">【乐界时讯】 ${var.title}</a></li>
                  </#list>
                </ul>
            </div>
            <!--news_list结束-->

        </div>
        <!--news结束-->

        <div class="products">
            <div class="title">
                <h2 class="titile_left">论坛交流</h2>
                <span class="title_right"><a href="#">More&gt;&gt;</a></span> </div>
            <!--title结束-->

            <div class="product_type">

                <ul>
                <#list posts as var>
                    <li><a href="../post/showpost.action?postID=${var.id}">【近期热帖】 ${var.title}</a></li>
                </#list>
                </ul>
            </div>
        </div>
        <!--products结束-->

        <div class="sidebar">
            <div class="video">
                <div class="title">
                    <h2 class="titile_left">资源下载</h2>
                    <span class="title_right"><a href="#">More&gt;&gt;</a></span> </div>
                <!--title结束-->
                <p class="video_content">
                    <embed src="http://player.youku.com/player.php/sid/XMjczNDc1NzkyMA==/v.swf" allowFullScreen="true" quality="high" width="220" height="140" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>
                </p>
            </div>
            <!--video结束-->

            <div class="service">
                <li> <a href="news.ftl">资源列表</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
                <li><<a href="news.ftl">【最新资源】Trivium -Wacken现场</a></li>
            </div>
            <!--sidebar结束-->

        </div>
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
</body>
</html>
