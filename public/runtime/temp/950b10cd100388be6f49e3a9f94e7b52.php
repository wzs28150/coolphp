<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"F:\cool-php/app/admin\view\login/index.html";i:1554986479;}*/ ?>
<!DOCTYPE html>


<html>

<head>
  <meta charset="utf-8">
  <title><?php echo config('sys_name'); ?>后台登录</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/public/static/admin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/public/static/admin/css/admin.css" media="all">
  <link rel="stylesheet" href="/public/static/admin/css/login.css" media="all">
</head>

<body>
  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2><?php echo config('sys_name'); ?>后台登录</h2>
        <p>酷创网络官方后台系统</p>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
          <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
              <input type="text" name="captcha" id="captcha" lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div style="margin-left: 10px;">
                <img src="<?php echo captcha_src(); ?>" alt="captcha" class="layadmin-user-login-codeimg" onclick="this.src=this.src+'?'+'id='+Math.random()" height="38"/>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="layui-form-item" style="margin-bottom: 20px;">
            <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
            <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
          </div> -->
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
        </div>
        <!-- <div class="layui-trans layui-form-item layadmin-user-login-other">
            <label>社交账号登入</label>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

            <a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
          </div> -->
      </div>
    </div>

    <div class="layui-trans layadmin-user-login-footer">
      <p><?php echo config('sys_name'); ?> © <?php echo config('url_domain_root'); ?></p>
    </div>
  </div>
  <div class="covervid-wrapper">
    <video class="covervid-video" autoplay muted loop>
      <source src="/public/static/admin/bg/homepage-slider-bg.mp4" type="video/mp4">
      <source src="/public/static/admin/bg/homepage-slider-bg.webm" type="video/webm">
    </video>
  </div>
  <script src="/public/static/admin/layui/layui.js"></script>
  <!-- <script src="/public/static/common/js/jquery.2.1.1.min.js"></script>
  <script src="/public/static/admin/lib/covervid.js"></script> -->
  <script>
    layui.config({
      base: '/public/static/admin/' //静态资源所在路径
    }).extend({
      index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function() {
      var $ = layui.$,
        setter = layui.setter,
        admin = layui.admin,
        form = layui.form,
        router = layui.router(),
        search = router.search;

      form.render();
      // $('.covervid-video').coverVid(1920, 1080);
      //提交
      $(document).on('keyup', function(event){

         var keynum = (event.keyCode ? event.keyCode : event.which);
         if(keynum == '13'){
             $('.layui-btn').click()
         }
      })
      form.on('submit(LAY-user-login-submit)', function(obj) {
        loading = layer.load(1, {
          shade: [0.1, '#fff']
        }); //0.1透明度的白色背景
        $.post('<?php echo url("login/index"); ?>', obj.field, function(res) {
          layer.close(loading);
          if (res.code == 1) {
            layer.msg(res.msg, {
              icon: 1,
              offset: '15px',
              time: 1000
            }, function() {
              location.href = res.url;
            });
          } else {
            $('#captcha').val('');
            layer.msg(res.msg, {
              icon: 2,
              anim: 6,
              offset: '15px',
              time: 1000
            });
            $('.captcha img').attr('src', '<?php echo captcha_src(); ?>?id=' + Math.random());
          }
        });
        return false;
        //请求登入接口
        // admin.req({
        //   url: '<?php echo url("login/index"); ?>',
        //   data: obj.field,
        //   type: 'post',
        //   done: function(res) {
        //     console.log(res);return false;
        //
        //     //请求成功后，写入 access_token
        //     // layui.data(setter.tableName, {
        //     //   key: setter.request.tokenName
        //     //   ,value: res.data.access_token
        //     // });
        //
        //     //登入成功的提示与跳转
        //
        //   }
        // });

      });
    });
  </script>


</body>

</html>
