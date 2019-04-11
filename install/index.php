<?php
/**
 * @Author 张超.
 * @Copyright http://www.zhangchao.name
 * @Email 416716328@qq.com
 * @DateTime 2018/5/20 15:53
 * @Yes-Admin 安装引导
 */
error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
ini_set('display_errors', '1');
//定义目录分隔符
define("DS", DIRECTORY_SEPARATOR);
//定义项目目录
define('APP_PATH', dirname(dirname(__FILE__)) . DS . 'app' . DS);
//定义web根目录
define('WWW_ROOT', dirname(__FILE__) . DS);
// $sql = @file_get_contents(WWW_ROOT . DS . "db.sql");
// echo $sql;exit;
$sitename = "COOLPHP";
$lockFile = WWW_ROOT . DS . "install.lock";
if (is_file($lockFile)) {
    die("<script>window.location.href = '/'</script>");
}
if ($_GET['c'] = 'start' && isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
    //执行安装
    $host = isset($_POST['hostname']) ? $_POST['hostname'] : '127.0.0.1';
    $port = isset($_POST['port']) ? $_POST['port'] : '3306';
    //判断是否在主机头后面加上了端口号
    $hostData = explode(":", $host);
    if (isset($hostData) && $hostData && is_array($hostData) && count($hostData) > 1) {
        $host = $hostData[0];
        $port = $hostData[1];
    }
    //mysql的账户相关
    $mysqlUserName = isset($_POST['username']) ? $_POST['username'] : 'root';
    $mysqlPassword = isset($_POST['password']) ? $_POST['password'] : 'root';
    $mysqlDataBase = isset($_POST['database']) ? $_POST['database'] : 'db_coolphp';
    $mysqlPreFix = isset($_POST['prefix']) ? $_POST['prefix'] : 'cool_';
    $mysqlPreFix = rtrim($mysqlPreFix, "_") . "_";
    $adminUserName = isset($_POST['adminUserName']) ? $_POST['adminUserName'] : 'admin';
    $adminPassword = !empty($_POST['adminPassword']) ? $_POST['adminPassword'] : 'admin123';
    $rePassword = !empty($_POST['rePassword']) ? $_POST['rePassword'] : 'admin123';
    $email = !empty($_POST['email']) ? $_POST['email'] : 'admin@admin.com';

    //判断两次输入是否一致
    if ($adminPassword != $rePassword) {
        die("<script>alert('两次输入密码不一致！');history.go(-1)</script>");
    }
    if (!preg_match("/^[\S]+$/", $adminPassword)) {
        die("<script>alert('密码不能包含空格！');history.go(-1)</script>");
    }
    if (!preg_match("/^\w+$/", $adminUserName)) {
        die("<script>alert('用户名只能输入字母、数字、下划线！');history.go(-1)</script>");
    }
    if (strlen($adminUserName) < 3 || strlen($adminUserName) > 12) {
        die("<script>alert('用户名请输入3~12位字符！');history.go(-1)</script>");
    }
    if (strlen($adminPassword) < 5 || strlen($adminPassword) > 16) {
        die("<script>alert('密码请输入5~16位字符！');history.go(-1)</script>");
    }
    // echo WWW_ROOT . DS . "db.sql";
    //检测能否读取安装文件
    $sql = @file_get_contents(WWW_ROOT . DS . "db.sql");
    if (!$sql) {
        die("<script>alert('请检查/install/db.sql是否有读取权限！');</script>");
    }
    //替换表前缀
    $sql = str_replace("`cool_", "`{$mysqlPreFix}", $sql);
    //链接数据库
    $pdo = new PDO("mysql:host={$host};port={$port}", $mysqlUserName, $mysqlPassword, array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
    ));
    // 连接数据库
    $link = @new mysqli("{$host}:{$port}", $mysqlUserName, $mysqlPassword);
    // 获取错误信息
    $error = $link->connect_error;
    if (!is_null($error)) {
        // 转义防止和alert中的引号冲突
        $error = addslashes($error);
        die("<script>alert('数据库链接失败:$error');history.go(-1)</script>");
    }
    // 设置字符集
    $link->query("SET NAMES 'utf8'");
    $link->server_info > 5.0 or die("<script>alert('请将您的mysql升级到5.0以上');history.go(-1)</script>");
    // 创建数据库并选中
    if (!$link->select_db($mysqlDataBase)) {
        $create_sql = 'CREATE DATABASE IF NOT EXISTS ' . $mysqlDataBase . ' DEFAULT CHARACTER SET utf8;';
        $link->query($create_sql) or die('创建数据库失败');
        $link->select_db($mysqlDataBase);
    }
    $sqlArr = explode(';', $sql);
    foreach ($sqlArr as $key => $val) {
        if ($val) {
            $link->query($val);
        }
    }
    $password = md5($adminPassword);
    $result = $link->query("UPDATE {$mysqlPreFix}admin SET username = '{$adminUserName}',pwd = '{$password}',email = '{$email}' WHERE username = 'admin'");
    if (!$result) {
        die("<script>alert('安装失败！:$error');history.go(-1)</script>");
    }
    $databaseConfig = include "../config" . DS . "database.php";
    //替换数据库相关配置
    $databaseConfig['hostname'] = $host;
    $databaseConfig['database'] = $mysqlDataBase;
    $databaseConfig['username'] = $mysqlUserName;
    $databaseConfig['password'] = $mysqlPassword;
    $databaseConfig['hostport'] = $port;
    $databaseConfig['prefix'] = $mysqlPreFix;
    $putConfig = @file_put_contents("../config" . DS . "database.php", "<?php\nreturn \n" . var_export($databaseConfig, true) . "\n;");
    if (!$putConfig) {
        die("<script>alert('安装失败、请确定database.php是否有写入权限！:$error');history.go(-1)</script>");
    }
    $result = @file_put_contents($lockFile, 1);
    if (!$putConfig) {
        die("<script>alert('安装失败、请确定install.lock是否有写入权限！:$error');history.go(-1)</script>");
    }
    $url=$_SERVER['HTTP_HOST'].trim($_SERVER['SCRIPT_NAME'], 'index.php');
    header("Location:http://$url");
}
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>安装<?php echo $sitename; ?></title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style type="text/css">
        html, body {
            height: 100%;
        }
        .covervid-wrapper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  overflow: hidden;
}

.covervid-video {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.container-fluid{ position: relative; z-index: 999; width: 100%;}
.form-control{ border-radius: 0;}
.wh-center {
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}
    </style>
</head>
<body class="wh-center">
<div class="container-fluid">
    <div class="row">
        <!-- <div class="col-md-4 col-md-offset-4">
            <div style="margin: 0 auto;text-align: center;margin-top: 20px;">
                <img src="install/img/logo.jpg" style="border-radius: 50%;">
            </div>
        </div> -->
        <div class="col-md-6 col-md-offset-3"
             style="margin-top: 20px;background-color: rgba(0, 0, 0, 0.6);padding: 30px;border-radius: 5px">
            <div id="cms-box">
                <form class="form-horizontal" action="./index.php?c=start" method="post">
                    <p style="font-size: 28px;font-weight: bolder;text-align: center;color: #fff;"><?= $sitename ?> 安装向导</p>
                    <div class="row">
                      <div class="panel col-md-6 panel-default" style="padding:0;background:none;border:0;">
                          <div class="panel-heading" style="background:none;border:0;color:#fff;">数据库相关设置</div>
                          <div class="panel-body" style="color:#fff;">
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">主机地址</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="hostname" class="form-control" placeholder="请输入主机地址、端口号可选" value="localhost">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">数据库名</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="database" class="form-control" placeholder="请输入数据库名" value="db_cool">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">用户名</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="username" class="form-control" placeholder="请输入用户名" value="root">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">密码</label>
                                  <div class="col-sm-9">
                                      <input type="password" name="password" class="form-control" placeholder="请输入数据库密码">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">表前缀</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="prefix" class="form-control" placeholder="请设置数据表前缀" value="cool_">
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="panel col-md-6 panel-default" style="padding:0;background:none;border:0;">
                          <div class="panel-heading" style="background:none;border:0;color:#fff;">管理员账户相关设置</div>
                          <div class="panel-body" style="color:#fff;">
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">用户名</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="adminUserName" class="form-control" placeholder="请输入管理员账号" value="admin">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">Email</label>
                                  <div class="col-sm-9">
                                      <input type="text" name="email" class="form-control" placeholder="请输入管理员邮箱">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">密码</label>
                                  <div class="col-sm-9">
                                      <input type="password" name="adminPassword" class="form-control" placeholder="请输入密码">
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-3 control-label">重复密码</label>
                                  <div class="col-sm-9">
                                      <input type="password" name="rePassword" class="form-control" placeholder="请再次输入密码">
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>
                    <div class="form-group">
                        <div class="" style="width:100%; text-align:center">
                            <button type="submit" class="btn btn-success" style="width: 80%;background-color:#009688;">立即安装</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="covervid-wrapper">
    <video class="covervid-video" autoplay muted loop>
      <source src="/public/static/admin/bg/homepage-slider-bg.mp4" type="video/mp4">
      <source src="/public/static/admin/bg/homepage-slider-bg.webm" type="video/webm">
    </video>
  </div>
<script type="text/javascript" src="/public/static/common/js/jquery.2.1.1.min.js"></script>
<script type="text/javascript" src="/public/static/plugins/jquery.ripples.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('body').ripples({
            resolution: 512,
            dropRadius: 20, //px
            perturbance: 0.04,
        });
    });
</script>
</body>
</html>
