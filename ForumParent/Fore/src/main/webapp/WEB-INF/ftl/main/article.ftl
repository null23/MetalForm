<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>乐界时讯</title>
    <link href="../assets/css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../assets/js/setHomeSetFav.js"></script>

</head>

<body>
<div class="top">
    <div class="top_content">
        <ul>
            <li><a href="#">联系我们</a></li>
            <li><a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></li>
            <li><a onclick="SetHome(window.location)" href="javascript:void(0)">设为主页</a></li>
        </ul>
    </div>
</div>
<!--ҳ�涥��top����-->

<#include "header.ftl"/>

<meta charset="utf-8">
<title>乐界时讯</title>
<style>
    .newsBox {
        width: 770px;
        min-height: 300px;
        _height: 300px;
        margin:0 auto;
    }
    .newsTitle {
        font-size: 20px;
        font-family: "΢���ź�";
        text-align: center;
        margin: 10px 0;
        color:#FFF
    }
    .newsInfo {
        color:#FFF;
        text-align: center;
        border-bottom: 1px dotted #666;
    }
    .newsContent {
        font-size: 14px;
        line-height: 25px;
        padding: 20px;
        text-indent: 2em;
        color:#FFF
    }
</style>
</head>

<body>
<div class="newsBox">
    <h1 class="newsTitle">${article.title}</h1>
    <p class="newsInfo">++++++++++++++Author:${article.getUser().name}+++++++++Date:${article.date?string('dd.MM.yyyy')}+++++++++++++</p>
    <div class="newsContent">
	${article.content}
    </div>






    <!--main����-->
</div>
<!--�����wrap����  -->

</div>
</body>
</html>
