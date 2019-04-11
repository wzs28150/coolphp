<?php
// +----------------------------------------------------------------------
// | 题库插件 后台管理总界面 对数据进行统计
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +

namespace addons\member\controller;

use think\addons\Controller;
use think\Db;
use think\Input;
use cool\Leftnav;
require_once(ADDONS_PATH.'member/common.php');
class Admin extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        //判断管理员是否登录
        if (!session('aid')) {
            $this->redirect('admin/login/index');
        }
        //判断插件是否安装
        // $this->addon
        $is_install = db('addons')->where('name',$this->addon)->find();
        if(!$is_install){
          $this->redirect('admin/login/index');
        }
        $this->assign('addon', $this->addon);
    }

    /**
     * 页面主体
     */
    public function index()
    {
      $menus = F('Menus');
      if(!$menus){
        $menus = db('menu')->select();
        F('Menus', $menus);
      }
      $menus =  subtree($menus);
      // exit;
      $this->assign('menus', $menus);
      return $this->fetch();
    }

    /**
     * 后台首页控制面板
     * 主要对插件内一些数据进行图表数据展现与统计
     */
    public function main()
    {
      header('Location:/addons_execute_member-member-index');
      // $olist = db('member_oirganization')->field('title,id')->select();
      // $this->assign('olist',$olist);
      // return $this->fetch();
    }

}
