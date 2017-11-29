		//layui的默认表单样式
		layui.use('form', function() {});
		//给原来的删除按钮绑定一个点击事件
		$(".del").click(del);
		//添加一行返回码
		function returnAdd() {
			$("#return").append("<tr><td style='width: 100px;'><input type='text' name='returnnumber' required lay-verify='required' placeholder='这里输入返回码' autocomplete='off' class='layui-input'> </td><td style='width: 400px;'><input type='text' name='returnexplain' required lay-verify='required' placeholder='这里输入说明' autocomplete='off' class='layui-input'> </td><td style='width: 74px;'> <button type='button' class='layui-btn layui-btn-danger del' ><i class='layui-icon'>&#xe640;</i></button></td></tr>");
			$(".del").click(del);
		};
		//参数和返回码的删除按钮
		function del() {
				$(this).parent().parent().remove();
		}
		//添加一行参数
		function parameterAdd() {
			layui.use('form', function() {
				var form = layui.form();
				$("#parameter").append("<tr><td style='width: 100px;'><input type='parametername' name='parametername' required lay-verify='required' placeholder='这里输入参数' autocomplete='off' class='layui-input'></td><td style='width: 300px;'><input type='parameterexplain' name='parameterexplain' required lay-verify='required' placeholder='这里输入说明' autocomplete='off' class='layui-input'></td><td style='width: 100px;'><select name='yesorno' lay-verify='required'><option value='是'>是</option><option value='否'>否</option></select></td><td style='width: 300px;'><input type='text' id='choose'name='choose' required lay-verify='required'placeholder='这里输入可选值' autocomplete='off' class='layui-input'></td><td style='width: 74px;'> <button type='button' class='layui-btn layui-btn-danger del'><i class='layui-icon'>&#xe640;</i></button></td></tr>");
				form.render('select'); //更新全部
				$(".del").click(del);
			});
		};
		//保存
		function save() {
				$.ajax({
					url : '../interface/save.action',
					type : 'post',
					data : $("#form1").serialize(),
					success : function(data) {
						if (data == 'success') {
							window.location.href = '../interface/list.action?id=1';
						}  else {
							alert(data);
						}
					}
				});
		}
		layui.use('element', function(){
			  var element = layui.element();
			});
		
