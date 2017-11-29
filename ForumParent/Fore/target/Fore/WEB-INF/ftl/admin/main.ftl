<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<title>MetalForum后台管理</title>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="../layui/css/global.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<#include "../public/header.ftl"/>
		<#include "../public/left.ftl"/>
		<div class="layui-body site-demo">
			<div class="layui-main"  style="text-align: center;font-size: 30px;margin-top: 200px">
				<h1 style="font-size: 30px;">欢迎使用本系统</h1>
			</div>
		</div>
		<#include "../public/bottom.ftl"/>
	</div>

	</div>

	<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
	</div>
	<script>
			layui.use(['form', 'element', 'laypage', 'layer'], function() {
				var $ = layui.jquery,
					form = layui.form(),
					laypage = layui.laypage,
					layer = layui.layer,
					element = layui.element();


				//全选
				form.on('checkbox(allChoose)', function(data) {
					var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
					child.each(function(index, item) {
						item.checked = data.elem.checked;
					});
					form.render('checkbox');
				});

			});
		</script>
</body>

</html>