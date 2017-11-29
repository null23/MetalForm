<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>用户注册</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../layui/css/global.css" />
<style>
			body {
				background: url(../res/img/banner_3.jpg) no-repeat center center fixed;
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
				<form  id="myform" class="layui-form layui-form-pane" action="">
					<div class="form" style="width: 500px;margin: 0 auto;padding-top: 40px;">
						<div style="padding-bottom: 10px; border-bottom: 1px solid #DFDFDF;">
							<h2 style="font-size: 22px;font-family: '宋体';">注册账号</h2>
						</div>
						<div class="input" style="margin-top: 35px;">
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-block">
									<input name="username" autocomplete="off" placeholder="用户名由8~16位数字或字符组成" class="layui-input" type="text">
								</div>
							</div>
							<div class="layui-form-item" style="margin-top: 25px; ">
								<label class="layui-form-label">密码</label>
								<div class="layui-input-block">
									<input name="userpwd" autocomplete="off" placeholder="请输入密码" class="layui-input" type="password">
								</div>
							</div>
							<div class="layui-form-item" style="margin-top: 25px; ">
								<label class="layui-form-label">确认密码</label>
								<div class="layui-input-block">
									<input name="against" autocomplete="off" placeholder="请确认密码" class="layui-input" type="password">
								</div>
							</div>
							<div class="fr" style="float: right;">
								<a href="../user/login.action" style="color: black;">已经有账号？</a>
							</div>
							<div class="layui-form-item" style="">
								<button id="zhuce" style="width: 100%; height: 50px; background: #5FB878; font-size: 16px;margin-top: 15px;" type="button" class="layui-btn"  lay-filter="demo2">注册</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../res/js/canvas-nest.min.js" charset="utf-8"></script>
<script src="../res/js/jquery-1.9.1.js" charset="utf-8"></script>
<script>
			//Demo
			layui.use('form', function() {
				var form = layui.form();
			});
			$("#zhuce").click(save);
			function save(){
				layui.use('layer', function(){
					  var layer = layui.layer;
					  var pwd=$("*[name='userpwd']").val();
						var against=$("*[name='against']").val();
						var username=$("*[name='username']").val().length;
					  
					  if (username>=8&&username<=16) {
							if (pwd==against) {
								$.ajax({
									type : "POST",
									url : '../user/save.action',
									data : $('#myform').serialize(),
									success : function(data) {
										if (data == 'ok') {
											window.location.href = '../user/login.action';
										} else{
											layer.msg("注册失败！请稍后再试！");
										}
									},
								});
							}else{
								layer.msg("两次密码输入不相同！");
							}
						}else {
							layer.msg("用户名格式不正确");
						}
					 
					});
				
				
				
			};
		</script>
</body>
</html>