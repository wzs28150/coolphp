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

namespace addons\member\controller;
use think\addons\Controller;
require_once(ADDONS_PATH.'member/common.php');
class Index extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        //判断管理员是否登录

        //获取setting
        $this->setting = db('comment_setting')->where('id',1)->find();
        // dump($this->setting);
    }
    /**
     * 注册
     */
    public function reg()
    {
      if(request()->isPost()){
        $post = Input();
        unset($post['route']);
        if(!$post['name']){
          $result['msg'] = '姓名不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post['certificate']){
          $result['msg'] = '军官证号不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post['oirganization']){
          $result['msg'] = '请选择所属单位!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post["password"]){
          $result['msg'] = '密码不能为空!';
          $result['code'] = 0;
          return $result;
        }
        if(!$this->CheckPassword($post["password"])){
          $result['msg'] = '密码为6-18位字母加数字的组合!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post["cpassword"]){
          $result['msg'] = '确认密码不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if($post['cpassword'] != $post["password"]){
          $result['msg'] = '两次密码不一致!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post["captcha"]){
          $result['msg'] = '验证码不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$this->check($post['captcha'])){
            return json(array('code' => 0, 'msg' => '验证码错误'));
        }

        $data['name'] = $post['name'];
        unset($post['name']);
        $data['certificate'] = $post['certificate'];
        unset($post['certificate']);
        $data['password'] = md5($post['password']);
        unset($post['password']);
        unset($post['cpassword']);
        $data['oid'] = $post['oirganization'];
        $data['other'] = serialize($post);
        $data['addtime'] = time();
        //name certificate  password  addtime other
        // dump($data);exit;
        $list = db($this->addon)->where('name',$data['name'])->where('certificate',$data['certificate'])->find();
        if($list){
          $result['msg'] = '账号已存在,请尝试登陆!';
          $result['code'] = 0;
          return $result;
        }
        $res = db($this->addon)->insertGetId($data);
        if($res){
          $result['msg'] = '注册成功!';
          $result['code'] = 1;
          return $result;
        }else{
          $result['msg'] = '注册失败!';
          $result['code'] = 0;
          return $result;
        }
      }
    }
    /**
     * 登录
     */
    public function login()
    {
      if(request()->isPost()){
        $post = Input();
        if(!$post['name']){
          $result['msg'] = '姓名不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post['certificate']){
          $result['msg'] = '军官证号不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post["password"]){
          $result['msg'] = '密码不能为空!';
          $result['code'] = 0;
          return $result;
        }
        if(!$this->CheckPassword($post["password"])){
          $result['msg'] = '密码为6-18位字母加数字的组合!';
          $result['code'] = 0;
          return $result;
        }

        if(!$this->check($post['captcha'])){
            return json(array('code' => 0, 'msg' => '验证码错误'));
        }
        unset($post['captcha']);
        $list = db('member')->where('name',$post['name'])->where('certificate',$post['certificate'])->find();
        if($list){
          if(md5($post['password'])==$list['password']){
            foreach (unserialize($list['other']) as $k => $val) {
              $list[$k]=$val;
            }
            unset($list['password']);
            session('memberinfo',$list);
            $result['msg'] = '登录成功!';
            $result['code'] = 1;
            return $result;
          }else{
            $result['msg'] = '密码错误,请重试!';
            $result['code'] = 0;
            return $result;
          }
        }else{
          $result['msg'] = '账号不存在,请重试!';
          $result['code'] = 0;
          return $result;
        }
      }
    }
    /**
     * 修改个人信息
     */
    public function info()
    {
      if(!session('memberinfo')){
        header("location:/Login.html");
      }
      if(request()->isPost()){
        $post = Input();
        unset($post['route']);
        if(!$post['name']){
          $result['msg'] = '姓名不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post['certificate']){
          $result['msg'] = '军官证号不能为空!';
          $result['code'] = 0;
          return $result;
        }

        if(!$post['oirganization']){
          $result['msg'] = '请选择所属单位!';
          $result['code'] = 0;
          return $result;
        }

        $memberinfo = session('memberinfo');
        if($post['certificate'] == $memberinfo['certificate'] && $post['oirganization'] == $memberinfo['oirganization'] && $post['idcode'] == $memberinfo['idcode'] && $post['birthday'] == $memberinfo['birthday']){
          $result['msg'] = '修改成功!';
          $result['code'] = 1;
          return $result;
        }
        $data['name'] = $post['name'];
        unset($post['name']);
        $data['certificate'] = $post['certificate'];
        unset($post['certificate']);
        $data['other'] = serialize($post);
        $res = db($this->addon)->where('id',$memberinfo['id'])->update($data);
        if($res){
          $list = db('member')->find($memberinfo['id']);
          foreach (unserialize($list['other']) as $k => $val) {
            $list[$k]=$val;
          }
          unset($list['password']);
          session('memberinfo',$list);
          $result['msg'] = '修改成功!';
          $result['code'] = 1;
          return $result;
        }else{
          $result['msg'] = '修改失败!';
          $result['code'] = 0;
          return $result;
        }
      }
    }
    /**
     * 修改密码
     */
    public function xgmm()
    {
      if(!session('memberinfo')){
        header("location:/Login.html");
      }
      if(request()->isPost()){
        $post = Input();
        unset($post['route']);
        $memberinfo = session('memberinfo');
        // dump($post);
        //判断原始密码是否正确
        if(!$post["oldpassword"]){
          $result['msg'] = '旧密码不能为空!';
          $result['code'] = 0;
          return $result;
        }
        if(!$this->CheckPassword($post["oldpassword"])){
          $result['msg'] = '密码为6-18位字母加数字的组合!';
          $result['code'] = 0;
          return $result;
        }
        $info = db('member')->field('password')->find($memberinfo['id']);
        if($info['password'] != md5($post['oldpassword'])){
          $result['msg'] = '旧密码错误,请重试!';
          $result['code'] = 0;
          return $result;
          exit;
        }

        if(!$post["password"]){
          $result['msg'] = '新密码不能为空!';
          $result['code'] = 0;
          return $result;
          exit;
        }
        if(!$this->CheckPassword($post["password"])){
          $result['msg'] = '密码为6-18位字母加数字的组合!';
          $result['code'] = 0;
          return $result;
          exit;
        }

        if(!$post["cpassword"]){
          $result['msg'] = '确认密码不能为空!';
          $result['code'] = 0;
          return $result;
          exit;
        }

        if($post['cpassword'] != $post["password"]){
          $result['msg'] = '两次密码不一致!';
          $result['code'] = 0;
          return $result;
          exit;
        }

        //修改
        $data['password'] = md5($post["password"]);
        $res = db($this->addon)->where('id',$memberinfo['id'])->update($data);
        if($res){
          session('memberinfo', null);
          $result['msg'] = '修改成功!';
          $result['code'] = 1;
          return $result;
        }else{
          $result['msg'] = '修改失败!';
          $result['code'] = 0;
          return $result;
        }
      }
    }
    /**
     * 退出
     */
    public function logout()
    {
      session('memberinfo', null);
      header("location:/Login.html");
    }

    public function showcaptcha()
    {
      $captcha = new \think\captcha\Captcha();
      $captcha->imageW=121;
      $captcha->imageH = 32;  //图片高
      $captcha->fontSize =14;  //字体大小
      $captcha->length   = 4;  //字符数
      $captcha->fontttf = '5.ttf';  //字体
      $captcha->expire = 30;  //有效期
      $captcha->useNoise = false;  //不添加杂点
      return $captcha->entry();
    }

    public function check($code){
       return captcha_check($code);
    }

    public function CheckPassword($C_passwd)
    {
      if (!$this->CheckLengthBetween($C_passwd, 6, 18)) return false; //宽度检测
      if (!preg_match("/^[_a-zA-Z0-9]*$/", $C_passwd)) return false; //特殊字符检测
      return true;
    }

    public function CheckLengthBetween($C_cahr, $I_len1, $I_len2=100)
    {
      $C_cahr = trim($C_cahr);
      if (strlen($C_cahr) < $I_len1) return false;
      if (strlen($C_cahr) > $I_len2) return false;
      return true;
    }
}
