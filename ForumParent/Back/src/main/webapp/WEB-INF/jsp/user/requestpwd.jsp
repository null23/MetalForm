<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>重置密码</title>
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
			<form id="myform" class="layui-form layui-form-pane" action="">
				<div class="form"
					style="width: 500px;margin: 0 auto;padding-top: 40px;">
					<div
						style="padding-bottom: 10px; border-bottom: 1px solid #DFDFDF;">
						<h2 style="font-size: 22px;font-family: '宋体';">重置密码</h2>
					</div>
					<div class="input" style="margin-top: 35px;">
						<div class="layui-form-item">
							<label class="layui-form-label">请输入密码</label>
							<div class="layui-input-block">
								<input name="userpwd" autocomplete="off" placeholder="请输入密码"
									class="layui-input" type="password">
							</div>
						</div>
						<div class="layui-form-item" style="margin-top: 25px; ">
							<label class="layui-form-label">请确认密码</label>
							<div class="layui-input-block">
								<input name="newagainst" autocomplete="off" placeholder="请确认密码"
									class="layui-input" type="password">
							</div>
						</div>
						<input name="id" value="${id}" type="hidden">
						<div class="layui-form-item" style="">
							<button
								style="width: 100%; height: 50px; background: #5FB878; font-size: 16px;margin-top: 15px;"
								id="tj" class="layui-btn" type="button" lay-filter="demo2">提交</button>
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
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
		$("#tj").click(save);
		function save() {
			layui
					.use(
							'layer',
							function() {
								var layer = layui.layer;
								var pwd = $("*[name='userpwd']").val();
								var against = $("*[name='newagainst']").val();
								if (pwd == against) {
									$
											.ajax({
												type : "POST",
												url : '../user/save.action',
												data : $('#myform').serialize(),
												success : function(data) {
													if (data == 'ok') {
														layer.open({
																	area: ['200px', '120px'],
																	type: '5',
																	title:'提示',
																	content: "<p style='font-size: 16px;margin-left:10px;margin-top: 10px;''>身份验证已经过期！<br/>请重新登录！</p>",
																	btn: '确认',
																	btnAlign: 'r',
																	anim: 6,
																	closeBtn: 0,
																	yes: function(index, layero) {
																	window.location.href = '../logout.action',
																		layer.close(index); 
																	}
																});
													} else {
														layer.msg("注册失败！请稍后再试！");
													}
												},
											});
								} else {
									layer.msg("两次密码输入不相同！");
								}

							});
		}
	</script>
</body>
</html>