<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>合其家总公司后台系统</title>
		<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../layui/css/global.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>

	<body>
		<div class="layui-layout layui-layout-admin">
			<#include "../public/header.ftl"/>
			<#include "../public/left.ftl"/>
			<div class="layui-body site-demo">
				<div class="layui-main">
					<div style="height: 30px;line-height: 30px;  background-color: #e2e2e2">
						<span class="layui-breadcrumb" style="margin-left: 15px;">
 				 <a href="../admin/index.action">主页</a>
  				 <a href="">${list0}</a>
  				 <a><cite>${list1}</cite></a>
				</span>
					</div>

					<div class="layui-form" style="line-height: 10px;">
						<table class="layui-table">
						<colgroup>
							<col width="50">
							<col width="80">
							<col width="230">
							<col width="230">
							<col width="230">
							<col width="230">
							<col width="230">							
							
						</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" lay-skin="primary" lay-filter="checkAll"></th>
										<th>序号</th>
										<th>商品名称</th>
										<th>店铺名称</th>
										<th>评价时间</th>
										<th>用户评分</th>
										<th>评价内容</th>
										<th>回复内容</th>
										<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<#list page.list as var>
									<tr>
										<td><input type="checkbox" name="ids" id="${var.id}" lay-skin="primary" lay-filter="checkOne"></td>
										<td>${var_index+1}</td>
										<td>${var.goodsname}</td>
										<td>${var.shopname}</td>
										<td>${var.date}</td>
										<td>${var.mark}</td>
										<td>${var.content}</td>
										<td>${var.answercontent}</td>
										<td>
											<button class="layui-btn layui-btn-danger layui-btn-small btn-my-del" del-id="del('${var.id}');" del-name=" '${var.name}' " title="删除">
											<i class="layui-icon">&#xe640;</i>
										</button>
										</td>
									</tr>

								</#list>
											<tr>
												<td colspan="100" style="text-align: center;">没有相关数据</td>
											</tr>
							</tbody>
						</table>
						<div id="page" class="fr"></div>
					</div>
				</div>
			</div>
			<#include "../public/bottom.ftl"/>
		</div>

		</div>

		<script src="../layui/layui.js" type="text/javascript" charset="utf-8"></script>
		</div>
		<script>
		 layui.config({
		base: '../layui/lay/modules/' //假设这是test.js所在的目录
	});
			
			layui.use(['form', 'element', 'mypage', 'layer'], function() {
				var $ = layui.jquery,
					form = layui.form(),
					layer = layui.layer,
					mypage = layui.mypage,
				element = layui.element();

				mypage.page(${page.totalPage}, 3, ${page.pageNumber});

				//全选
				form.on('checkbox(checkAll)', function(data) {
					if(data.elem.checked) {
						$("input[type='checkbox']").prop('checked', true);
					} else {
						$("input[type='checkbox']").prop('checked', false);
					}
					form.render('checkbox');
				});

				form.on('checkbox(checkOne)', function(data) {
					var is_check = true;
					if(data.elem.checked) {
						$("input[lay-filter='checkOne']").each(function() {
							if(!$(this).prop('checked')) {
								is_check = false;
							}
						});
						if(is_check) {
							$("input[lay-filter='checkAll']").prop('checked', true);
						}
					} else {
						$("input[lay-filter='checkAll']").prop('checked', false);
					}
					form.render('checkbox');
				});

				
				//删除功能
				$('.btn-my-del').click(function() {
					var name = $(this).attr('del-name');
					var id = $(this).attr('del-id');
					layer.confirm('确定删除商品【' + name + '】?', function(index) {
						loading = layer.load(2, {
							shade: [0.2, '#000'] //0.2透明度的白色背景
						});
						$.post('', {
							'id': id
						}, function(data) {
							if(data.code == 200) {
								layer.close(loading);
								layer.msg(data.msg, {
									icon: 1,
									time: 1000
								}, function() {
									location.reload(); 
								});
							} else {
								layer.close(loading);
								layer.msg(data.msg, {
									icon: 2,
									anim: 6,
									time: 1000
								});
							}
						});
					});

				});

			});
		</script>
	</body>

</html>