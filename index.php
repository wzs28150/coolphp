<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
if (!defined('__PUBLIC__')) {
    $_public = rtrim(dirname(rtrim($_SERVER['SCRIPT_NAME'], '/')), '/');
    define('__PUBLIC__', (('/' == $_public || '\\' == $_public) ? '' : $_public).'/public');
}




if (!defined('__ADMIN__')) {
    $_public = rtrim(dirname(rtrim($_SERVER['SCRIPT_NAME'], '/')), '/');
    define('__ADMIN__', (('/' == $_public || '\\' == $_public) ? '' : $_public).'/public/static/admin');
}


// 定义应用目录
define('APP_PATH', __DIR__ . '/app/');
define('RUNTIME_PATH', __DIR__ . '/public/runtime/');
define('DATA_PATH',  __DIR__ . '/public/runtime/Data/');
//插件目录
define('PLUGIN_PATH', __DIR__ . '/core/plugins/');
define('EXTEND_PATH', __DIR__ . '/core/extend/');
define('ADDONS_PATH', __DIR__ . '/addons/');
define('CONF_PATH', __DIR__.'/config/');
// 加载框架引导文件
require __DIR__ . '/core/think/start.php';
