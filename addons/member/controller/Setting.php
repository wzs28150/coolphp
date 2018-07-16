<?php
// +----------------------------------------------------------------------
// | 会员插件 登录注册设置
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +----------------------------------------------------------------------

namespace addons\member\controller;
require_once(ADDONS_PATH.'member/common.php');
class Setting extends Admin
{
  /**
   * 设置页
   */
  public function index()
  {
    $res = db('member_setting')->field('is_state')->find(1);
    $this->assign('state',$res['is_state']);
    return $this->fetch();

  }
// +----------------------------------------------------------------------
  //注册项列表
  public function reglist()
  {
    if(request()->isPost())
    {
      $list = db('member_setting')->field('regset')->find(1);
      // dump($list);exit;
      $lists = unserialize($list['regset']);
      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $rsult['data'] = $lists;
      $rsult['rel'] = 1;
      return $rsult;
    }
  }
  //注册项添加
  public function regadd()
  {
    if(request()->isPost()){
      // $data["title"] = Input("title");
      // $data["type"] = Input("type")
      $post = Input();
      unset($post['route']);
      // json_encode($post)
      $setting = db('member_setting')->field('regset')->find(1);
      if($setting['regset'] && $setting['regset']!=''){
        $setarr = unserialize($setting['regset']);
        // dump($setarr);exit;
        array_push($setarr,$post);
        $data['regset'] = serialize($setarr);
      }else{
        $setarr[] = $post;
        $data['regset'] = serialize($setarr);
      }
      $res = db('member_setting')->where('id',1)->update($data);
      if($res){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '添加成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '添加失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $title = '添加注册项';
      $this->assign('title', $title);
      return $this->fetch();
    }
  }
  //注册项编辑
  public function regedit()
  {
    if(request()->isPost()){
      $post = Input();
      $id = Input('id');
      unset($post['id']);
      unset($post['route']);
      $setting = db('member_setting')->field('regset')->find(1);
      $setarr = unserialize($setting['regset']);
      if($setarr[$id - 1] == $post){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
        exit;
      }
      $setarr[$id - 1] = $post;
      $data['regset'] = serialize($setarr);
      $res = db('member_setting')->where('id',1)->update($data);
      if($res){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '修改失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $id = Input('id');
      $setting = db('member_setting')->field('regset')->find(1);
      if($setting['regset'] && $setting['regset']!=''){
        $setarr = unserialize($setting['regset']);
        $this->assign('setting',$setarr[$id-1]);
      }
      return $this->fetch();
    }
  }
  //注册项设置排序
  public function reglistorder()
  {
    $id = Input('id');
    $listorder = Input('listorder');
    $list = db('member_setting')->field('regset')->find(1);
    $lists = unserialize($list['regset']);
    // dump($lists);
    if($lists[$id-1]['listorder'] == $listorder){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '排序成功!';
      $result['code'] = 1;
      return $result;
    }
    $lists[$id-1]['listorder'] = $listorder;
    // dump($lists);
    $listordertmp = array_column($lists, 'listorder');
    $titletmp = array_column($lists, 'title');
    array_multisort($listordertmp, SORT_ASC,$titletmp, SORT_DESC, $lists);
    // dump($lists);exit;
    $data['regset'] = serialize($lists);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      // $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '排序成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '排序失败!';
      $result['code'] = 0;
      return $result;
    }
  }
  //注册项删除
  public function regdel()
  {
    $id = Input('id');
    $list = db('member_setting')->field('regset')->find(1);
    $lists = unserialize($list['regset']);
    unset($lists[$id-1]);
    $data['regset'] = serialize($lists);
    // dump($data);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '删除成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '删除失败!';
      $result['code'] = 0;
      return $result;
    }
  }
  //注册设置必填
  public function regrequired()
  {
    $id = Input('id');
    $required = Input('required');
    $setting = db('member_setting')->field('regset')->find(1);
    $setarr = unserialize($setting['regset']);
    $setarr[$id - 1]['required'] = $required;
    $data['regset'] = serialize($setarr);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '设置成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '设置失败!';
      $result['code'] = 0;
      return $result;
    }
  }
// +----------------------------------------------------------------------
  //登录项列表
  public function loginlist()
  {
    if(request()->isPost())
    {
      $list = db('member_setting')->field('loginset')->find(1);
      // dump($list);exit;
      $lists = unserialize($list['loginset']);
      // dump($lists);exit;
      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $rsult['data'] = $lists;
      $rsult['rel'] = 1;
      return $rsult;
    }
  }
  //登录项添加
  public function loginadd()
  {
    if(request()->isPost()){
      // $data["title"] = Input("title");
      // $data["type"] = Input("type")
      $post = Input();
      unset($post['route']);
      // json_encode($post)
      $setting = db('member_setting')->field('loginset')->find(1);
      if($setting['loginset'] && $setting['loginset']!=''){
        $setarr = unserialize($setting['loginset']);
        // dump($setarr);exit;
        array_push($setarr,$post);
        $data['loginset'] = serialize($setarr);
      }else{
        $setarr[] = $post;
        $data['loginset'] = serialize($setarr);
      }
      $res = db('member_setting')->where('id',1)->update($data);
      if($res){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '添加成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '添加失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $title = '添加登录项';
      $this->assign('title', $title);
      return $this->fetch();
    }
  }
  //注册项编辑
  public function loginedit()
  {
    if(request()->isPost()){
      $post = Input();
      $id = Input('id');
      unset($post['id']);
      unset($post['route']);
      $setting = db('member_setting')->field('loginset')->find(1);
      $setarr = unserialize($setting['loginset']);
      if($setarr[$id - 1] == $post){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
        exit;
      }
      $setarr[$id - 1] = $post;
      $data['loginset'] = serialize($setarr);
      $res = db('member_setting')->where('id',1)->update($data);
      if($res){
        $result['url'] = addon_url('member://setting/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '修改失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $id = Input('id');
      $setting = db('member_setting')->field('loginset')->find(1);
      if($setting['loginset'] && $setting['loginset']!=''){
        $setarr = unserialize($setting['loginset']);
        $this->assign('setting',$setarr[$id-1]);
      }
      return $this->fetch();
    }
  }
  //登录项设置排序
  public function loginlistorder()
  {
    $id = Input('id');
    $listorder = Input('listorder');
    $list = db('member_setting')->field('loginset')->find(1);
    $lists = unserialize($list['loginset']);
    // dump($lists);
    if($lists[$id-1]['listorder'] == $listorder){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '排序成功!';
      $result['code'] = 1;
      return $result;
    }
    $lists[$id-1]['listorder'] = $listorder;
    // dump($lists);
    $listordertmp = array_column($lists, 'listorder');
    $titletmp = array_column($lists, 'title');
    // dump($listordertmp);dump($titletmp);dump($lists);exit;
    array_multisort($listordertmp, SORT_ASC,$titletmp, SORT_DESC, $lists);
    $data['loginset'] = serialize($lists);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      $result['msg'] = '排序成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '排序失败!';
      $result['code'] = 0;
      return $result;
    }
  }
  //登录项删除
  public function logindel()
  {
    $id = Input('id');
    $list = db('member_setting')->field('loginset')->find(1);
    $lists = unserialize($list['loginset']);
    unset($lists[$id-1]);
    $data['loginset'] = serialize($lists);
    // dump($data);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '删除成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '删除失败!';
      $result['code'] = 0;
      return $result;
    }
  }
  //注册设置必填
  public function loginrequired()
  {
    $id = Input('id');
    $required = Input('required');
    $setting = db('member_setting')->field('loginset')->find(1);
    $setarr = unserialize($setting['loginset']);
    $setarr[$id - 1]['required'] = $required;
    $data['loginset'] = serialize($setarr);
    $res = db('member_setting')->where('id',1)->update($data);
    if($res){
      $result['url'] = addon_url('member://setting/index');
      $result['msg'] = '设置成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '设置失败!';
      $result['code'] = 0;
      return $result;
    }
  }

  public function setstate()
  {
    $data['is_state'] = Input('state');
    $res = db('member_setting')->where('id',1)->update($data);
    $result['url'] = addon_url('member://setting/index');
    $result['msg'] = '设置成功!';
    $result['code'] = 1;
    return $result;
  }
}
?>
