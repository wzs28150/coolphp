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

namespace addons\comment;

use think\Addons;

/**
 * 插件测试
 * @author byron sampson
 */
class Comment extends Addons
{
    public $info = [
        'name' => 'comment',
        'title' => '评论系统',
        'ico' => './ico.jpg',
        'description' => '对文章的评论与留言',
        'status' => 0,
        'author' => 'by wzs',
        'version' => '0.1',
        'is_page'=>0,
        'is_weixin'=>0,
        'has_adminlist'=>0,
        'icon'=>'layui-icon-dialogue'
    ];

    public function _initialize()
    {
      //获取setting
      $is_install = db('addons')->where('name','comment')->fetchsql(false)->find();
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
    public function commenthook($param)
    {
      $iscomment = db('addons')->field('id')->where('name','comment')->find();
      if($iscomment){
        if($param['type'] == 'comment'){
          //判断是否安装会员插件
          $list = db('addons')->field('id')->where('name','member')->find();
          if($list){
            //判断是否登录
            if (session('memberinfo.id')) {
              $this->assign('name',session('memberinfo.name'));
              $this->assign('company',session('memberinfo.oirganization'));
              $this->assign('certificate',session('memberinfo.certificate'));
            }else{
              $this->assign('is_member',1);
            }
          }
          $setting = $this->setting;
          $this->assign('isexamine',$setting['isexamine']);
          $this->assign('customstyle',$setting['customstyle']);
          $this->assign('hidetitle',$param['hidetitle']);
          $this->assign('aid',$param['id']);
          $this->assign('title',$param['title']);
          $this->assign('url',$param['url']);
          return $this->fetch('comment');
        }elseif($param['type'] == 'list'){
          //判断是否安装会员插件
          $list = db('addons')->field('id')->where('name','member')->find();
          if($list){
            //判断是否登录
            if (session('memberinfo.id')) {
              $this->assign('name',session('memberinfo.name'));
              $this->assign('company',session('memberinfo.oirganization'));
              $this->assign('certificate',session('memberinfo.certificate'));
            }else{
              $this->assign('is_member',1);
            }
          }
          $setting = $this->setting;
          $this->assign('isexamine',$setting['isexamine']);
          $this->assign('customstyle',$setting['customstyle']);
          $this->assign('aid',$param['id']);
          $this->assign('title',$param['title']);
          $this->assign('url',$param['url']);
          return $this->fetch('list');
        }elseif($param['type'] == 'likes'){
          $setting = $this->setting;
          //判断是否开启点赞
          if($setting['is_zan'] == 1){
            //如果登录判断是否点赞过
            if(session('memberinfo.id')){
              $isdian = db('comment_likes_detail')->field('id')->where('uid',session('memberinfo.id'))->find();
              if($isdian){
                $this->assign('isdian',1);
              }
            }
            $num = db('comment_likes')->field('num')->where('aid',$param['id'])->find();
            if(!$num){
              $num['num'] = 0;
            }
            $this->assign('num',$num['num']);
            $this->assign('aid',$param['id']);
            $this->assign('title',$param['title']);
            $this->assign('url',$param['url']);
            return $this->fetch('likes');
          }
        }
      }
    }

}
