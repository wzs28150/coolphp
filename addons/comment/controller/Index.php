<?php
// +----------------------------------------------------------------------
// | 题库插件 前台题目
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +

namespace addons\comment\controller;

use think\addons\Controller;
require_once(ADDONS_PATH.'comment/common.php');
class Index extends Controller
{
    public function _initialize()
    {
        parent::_initialize();

        //获取setting
        $this->setting = db('comment_setting')->where('id',1)->find();
        // dump($this->setting);
    }
    public function index()
    {
        $data = Input();
        $data['addtime'] = time();
        $setting = $this->setting;
        if($setting['isexamine'] == 1){
          //先发后审
          $data['status'] = 1;
        }elseif($setting['isexamine'] == 2){
          //先审后发
          $data['status'] = 0;
        }else{

        }
        //判断是否安装会员插件
        $addonslist = db('addons')->field('id')->where('name','member')->find();
        if($addonslist){
          $info = db('member')->where('certificate',$data['certificate'])->where('name',$data['name'])->find();
          //如果会员存在自动登录
          if($info){
            foreach (unserialize($info['other']) as $k => $val) {
              $list[$k]=$val;
            }
            $info['oirganization'] = getoirganization($info['oirganization']);
            unset($info['password']);
            session('memberinfo',$info);
          }
        }
        $list = db($this->addon)->where('certificate',$data['certificate'])->where('aid',$data['aid'])->find();
        if($list){
          $result['msg'] = '您已经评论过了!';
          $result['code'] = 0;
          return $result;
        }
        $res = db($this->addon)->insert($data);
        if($res){
          $result['msg'] = '评论成功!';
          $result['code'] = 1;
          return $result;
        }else{
          $result['msg'] = '评论失败!';
          $result['code'] = 0;
          return $result;
        }
    }

    public function getlist()
    {
      $aid = Input('aid');
      $list = db($this->addon)->where('aid',$aid)->where('status',1)->order('addtime desc')->select();
      foreach ($list as $k=>$v ){
        $list[$k]['addtime'] = date('Y-m-d H:i',$v['addtime']);
        $list[$k]['content'] = changeemoji($v['content']);
      }
      if($list){
        $result['msg'] = '获取成功!';
        $result['data'] = $list;
        $result['code'] = 1;
        return $result;
      }else{
        $result['data'] = '无评论!';
        $result['code'] = 0;
        return $result;
      }


    }

    public function zan()
    {
      $id = Input('id');
      // echo $id;
      $res = db('comment')->where('id', $id)->setInc('count');
      if($res){
        $result['msg'] = '获取成功!';
        $result['data'] = $list;
        $result['code'] = 1;
        return $result;
      }else{
        $result['data'] = '无评论!';
        $result['code'] = 0;
        return $result;
      }
    }
    //文章点赞
    public function likes()
    {
      $post = Input();
      //判断是否安装会员插件
      // $addonslist = db('addons')->field('id')->where('name','member')->find();
      // if($addonslist){
      //   if(!session('memberinfo')){
      //     $result['msg'] = '请先登录!';
      //     $result['url'] = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
      //     $result['code'] = 0;
      //     return $result;
      //   }
      // }
      $data['aid']=$post['aid'];
      $data['title']=$post['title'];
      $data['url']=$post['url'];
      if(session('memberinfo.id')){
        $data['uid']=session('memberinfo.id');
      }else{
        $data['uid']=0;
      }
      $data['addtime']=time();
      $res = db('comment_likes_detail')->insert($data);
      if($res){
        $list = db('comment_likes')->where('aid',$data['aid'])->find();
        unset($data['addtime']);
        if($list){
          //如果有记录更新num +1
          $res2 = db('comment_likes')->where('aid',$data['aid'])->setInc('num');
          if($res2){
            $info = db('comment_likes')->field('num')->where('aid',$data['aid'])->find();
            $result['hits'] = $info['num'];
            $result['msg'] = '点赞成功2!';
            $result['code'] = 1;
            return $result;
          }else{
            $result['msg'] = '系统错误,请稍后重试!';
            $result['code'] = 0;
            return $result;
          }
        }else{
          //没有记录 添加
          $data['num'] = 1;
          $res2 = db('comment_likes')->insert($data);
          if($res2){
            $info = db('comment_likes')->field('num')->where('aid',$data['aid'])->find();
            $result['hits'] = $info['num'];
            $result['msg'] = '点赞成功3!';
            $result['code'] = 1;
            return $result;
          }else{
            $result['msg'] = '系统错误,请稍后重试!';
            $result['code'] = 0;
            return $result;
          }
        }
      }else{
        $result['msg'] = '系统错误3,请稍后重试!';
        $result['code'] = 0;
        return $result;
      }

    }
}
