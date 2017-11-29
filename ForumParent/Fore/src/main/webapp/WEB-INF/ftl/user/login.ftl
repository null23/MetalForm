
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登入</title>
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
        <li class="layui-this">登入</li>
        <li><a href="../user/beforeregist.action">注册</a></li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form id="myform" method="post">
              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input id="username" name="username" autocomplete="off"
                          placeholder="请输入用户名" class="layui-input" type="text">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input id="password" name="password" autocomplete="off"
                           placeholder="请输入密码" class="layui-input" type="password">
                </div>
              </div>

              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit onclick="myclick()">立即登录</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; </p>

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