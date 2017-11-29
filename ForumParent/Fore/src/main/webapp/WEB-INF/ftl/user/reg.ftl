
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>注册</title>
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
    
    
    
  </div>
</div>

<div class="main layui-clear">

  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief">
      <ul class="layui-tab-title">
        <li><a href="../user/login.action">登入</a></li>
        <li class="layui-this">注册</li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form name="regist" method="post" action="regist.action">
              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input id="username" name="name" autocomplete="off"
                           placeholder="请输入用户名" class="layui-input" type="text">
                </div>
                <div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
              </div>
              
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input id="password" name="password" autocomplete="off"
                           placeholder="请输入密码" class="layui-input" type="password">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repassword" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              
              <div class="layui-form-item">
                  <input type="submit" value="立即注册">
              </div>
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy;</p>
  
</div>
<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../assets/js/canvas-nest.min.js" charset="utf-8"></script>
<script src="../assets/js/jquery/jquery-1.9.1.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use('form', function() {
        var form = layui.form();
    });

    function myclick() {
        $.ajax({
            url : 'login.action',
            type : 'post',
            data : $("#myform").serialize(),
            success : function(data) {
                if (data == 'success') {
                    window.location.href = '../admin/index.action';
                }else if(data == 'usererror'){
                    alert("用户名不存在");
                } else if(data == 'pwderror'){
                    alert("密码错误");
                }else {
                    alert(data);
                }
            }
        });
    }
</script>
</body>
</html>