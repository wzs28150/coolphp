<?php
// +----------------------------------------------------------------------
// | 评论插件 入口
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +

namespace addons\member;

use think\Addons;
/**
 * 插件测试
 * @author byron sampson
 */
class Member extends Addons
{
    public $info = [
        'name' => 'member',
        'title' => '会员系统',
        'ico' => './ico.jpg',
        'description' => '会员注册、登录、分类、等级',
        'status' => 0,
        'author' => 'by wzs',
        'version' => '0.1',
        'is_page'=>0,
        'is_weixin'=>0,
        'has_adminlist'=>0,
        'icon'=>'layui-icon-user'
    ];

    public function _initialize()
    {
      //获取setting
      $is_install = db('addons')->where('name',$this->addon)->find();
      if($is_install){
          $this->setting = db('comment_setting')->where('id',1)->find();
      }
    }

    /**
     * 插件安装方法(公共方法已设置 无需多写)
     * @return bool
     */
    public function install()
    {
      return true;
    }

    /**
     * 插件卸载方法(公共方法已设置 无需多写)
     * @return bool
     */
     public function uninstall()
     {
        return true;
     }

    /**
     * 实现的diy_form钩子方法
     * @return mixed
     */
    public function memberhook($param)
    {
        if($param['type'] == 'login'){
          if(session('memberinfo')){
            header("location:/Member.html");
          }
          $setting = db('member_setting')->field('loginset')->find(1);
          $oirganization = db('member_oirganization')->where('pid',0)->select();
          $this->assign('setting',unserialize($setting['loginset']));
          $this->assign('oirganization',$oirganization);
          return $this->fetch('login');
        }elseif($param['type'] == 'reg'){
          if(session('memberinfo')){
            header("location:/Member.html");
          }
          $setting = db('member_setting')->field('regset')->find(1);
          $oirganization = db('member_oirganization')->where('pid',0)->select();
          $this->assign('setting',unserialize($setting['regset']));
          $this->assign('oirganization',$oirganization);
          return $this->fetch('reg');
        }elseif($param['type'] == 'info'){
          if(!session('memberinfo')){
            header("location:/Login.html");
          }
          $memberinfo = session('memberinfo');
          $oirganization = db('member_oirganization')->where('pid',0)->select();
          $this->assign('oirganization',$oirganization);
          $this->assign('memberinfo',$memberinfo);
          return $this->fetch('info');
        }elseif($param['type'] == 'xgmm'){
          if(!session('memberinfo')){
            header("location:/Login.html");
          }
          $memberinfo = session('memberinfo');
          $this->assign('memberinfo',$memberinfo);
          return $this->fetch('xgmm');
        }

    }

}
