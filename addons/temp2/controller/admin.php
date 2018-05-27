<?php
// +----------------------------------------------------------------------
// | thinkphp5 Addons [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.zzstudio.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Byron Sampson <xiaobo.sun@qq.com>
// +----------------------------------------------------------------------

namespace addons\temp2\controller;

use think\addons\Controller;

class Admin extends Controller
{
    public function _initialize()
    {

        //判断管理员是否登录
        if (!session('aid')) {
            $this->redirect('login/index');
        }
    }
    public function index()
    {
        echo '<p>我是temp2插件中Index控制器的index方法</p>';
        return $this->fetch();
    }
}
