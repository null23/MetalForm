<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>登录页面</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../layui/css/global.css" />
<style>
body {
	background: url(../assets/img/banner_3.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.site-text {
	width: 600px;
	height: 400px;
	margin: 0 auto;
	margin-top: 170px;
	background: white;
}
</style>
</head>
<body>
	<div class="main layui-clear">
		<div class="site-text">
			<form id="myform" class="layui-form layui-form-pane" action="" method="post">
				<div class="form"
					style="width: 500px;margin: 0 auto;padding-top: 40px;">
					<div
						style="padding-bottom: 10px; border-bottom: 1px solid #DFDFDF;">
						<h2 style="font-size: 22px;font-family: '宋体';">登录</h2>
					</div>
					<div class="input" style="margin-top: 35px;">
						<div class="layui-form-item">
							<label class="layui-form-label">账号</label>
							<div class="layui-input-block">
								<input id="username" name="username" autocomplete="off"
									placeholder="请输入用户名" class="layui-input" type="text">
							</div>
						</div>
						<div class="layui-form-item" style="margin-top: 25px; ">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-block">
								<input id="password" name="password" autocomplete="off"
									placeholder="请输入密码" class="layui-input" type="password">
							</div>
						</div>
						<div style="float: left;margin-top:5px ;">
							<input type="checkbox" id="savecookie" value="1"
								onclick="savePaw()" name="" title="记住密码" lay-ignore><span>记住密码</span>
						</div>
					</div>
					<br />
					<div class="fr" style="float: right;margin-top: 10px;">
						<a href="../user/zhuce.action" style="color: black;">还没有账号？</a>
					</div>
					<div class="layui-form-item" style="">
						<button
							style="width: 100%; height: 50px; background: #5FB878; font-size: 16px;margin-top: 15px;"
							class="layui-btn" type="button" onclick="myclick()"
							lay-filter="demo2">登录</button>
					</div>
				</div>
		</div>
		</form>
	</div>
	</div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script src="../assets/js/canvas-nest.min.js" charset="utf-8"></script>
	<script src="../assets/js/jquery/jquery-1.9.1.js" charset="utf-8"></script>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form();
		});
		$(function() {
			checkCookie();
		});
		function savePaw() {
			var username = $("#username").val();
			var password = $("#password").val();
			var date = new Date();
			date.setDate(date.getDate() + 10);//date设置为十天之后
			document.cookie = "username=" + username + ";expires="
					+ date.toGMTString();
			document.cookie = "password=" + password + ";expires="
					+ date.toGMTString();
		}
		function checkCookie() //检测cookie是否存在，如果存在则直接读取，否则创建新的cookie
		{
			var username=getCookie("username");
			$("#username").val(username);
			var password=getCookie("password");
			$("#password").val(password);
		}
		function getCookie(name){
			var arr = document.cookie.split("; ");
			for(var i=0; i<arr.length; i++){
			var arr2 = arr[i].split("=");
			if(arr2[0] == name){
			return arr2[1];
			}
			}
			return "";
			} 
		function myclick() {
			$.ajax({
				url : 'login.action',
				type : 'post',
				data : $("#myform").serialize(),
				success : function(data) {
					if (data == 'success') {
						window.location.href = '../admin/index.action';
					}else {
						alert(data);
					}
				}
			});
		}
	</script>
</body>
</html>