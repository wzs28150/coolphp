<?php
// +----------------------------------------------------------------------
// | 题库插件 类别管理
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +----------------------------------------------------------------------

namespace addons\member\controller;
use cool\ExcelTool;
// require_once(ADDONS_PATH.'member/common.php');
class Member extends Admin
{
  public function _initialize()
  {
      parent::_initialize();
  }
  /**
   * 类别列表
   */
  public function index()
  {
    if(request()->isPost())
    {
      $page =input('page')?input('page'):1;
      $keyword = input('post.key');
      if (!empty($keyword)) {
          if(intval($keyword) == 0){
            $map['name'] = array(
                'like',
                '%' . $keyword . '%'
            );
          }else{
            $map['tel'] = array(
                'like',
                '%' . $keyword . '%'
            );
          }

      }
      $pageSize =input('limit')?input('limit'):config('pageSize');
      $list = db('member')->where($map)->paginate(array('list_rows'=>$pageSize,'page'=>$page))
      ->toArray();
      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $lists = $list['data'];
      // dump(unserialize($lists[0]['other']));exit;
      foreach ($lists as $k=>$v ){
        $lists[$k]['addtime'] = date('Y-m-d H:i:s',$v['addtime']);
        if($v['cjfl']==1){
          $lists[$k]['cjfl'] = "文科";
        }elseif($v['cjfl']==2){
          $lists[$k]['cjfl'] = "理科";
        }else{
          $lists[$k]['cjfl'] = "";
        }
        $lists[$k]['major'] = getmajor($v['major']);
        $arr = unserialize($v['other']);
      }
      $rsult['data'] = $lists;
      $rsult['count'] = $list['total'];
      $rsult['rel'] = 1;
      return $rsult;
    }
    else
    {
      $title = '会员管理';
      $this->assign('title', $title);
      return $this->fetch();
    }

  }

  /**
   * 类别删除
   */
  public function del()
  {
    if(request()->isPost()){
      $id = Input('id');
      $res = db('member')->delete($id);
      if($res){
        $orderres = db('order')->where('userid',$id)->delete();
        $result['url'] = addon_url('member://member/index');
        $result['msg'] = '刪除成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '刪除失败!';
        $result['code'] = 0;
        return $result;
      }
    }
  }

  /**
   * 修改审核状态
   */
  public function changestate()
  {
    $id = Input('id');
    if(Input('state') == 1){
      $state = 0;
    }else{
      $state = 1;
    }
    $data['state']=$state;
    $res = db('member')->where('id',$id)->update($data);
    if($res){
      $result['url'] = addon_url('member://member/index');
      $result['msg'] = '修改成功!';
      $result['code'] = 1;
      return $result;
    }else{
      $result['msg'] = '修改失败!';
      $result['code'] = 0;
      return $result;
    }
  }
  /**
   * 修改
   */
  public function edit()
  {
    if(request()->isPost())
    {
      $post = input();
      $id = $post['id'];
      unset($post['id']);
      $data = $post;
      $res = db('member')->where('id',$id)->update($data);
      if($res){
        $result['url'] = addon_url('member://member/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '修改失败!';
        $result['code'] = 0;
        return $result;
      }
    }
    else
    {
      $title = '会员修改';
      $id = input('id');
      $info = db('member')->find($id);
      $info['addtime'] = date('Y-m-d',$info['addtime']);
      $major = db('tag')->where('catid',42)->select();
      $this->assign('major', $major);
      $this->assign('info', $info);
      $this->assign('id', $id);
      $this->assign('title', $title);
      return $this->fetch();
    }
  }
  /**
   * 删除多个
   */
  public function delAll() {
      $map['id'] = array(
          'in',
          input('param.ids/a')
      );
      db('member')->where($map)->delete();
      $result['code'] = 1;
      $result['msg'] = '删除成功！';
      $result['url'] = addon_url('member://member/index');
      return $result;
  }

  public function export()
  {
    if(input('param.ids/a')){
      $map['id'] = array(
          'in',
          input('param.ids/a')
      );
    }
    $list = db('member')->where($map)->select();
    $ExcelTool = new ExcelTool();
    $data = array();
    foreach ($list as $key => $value) {
      $data[$key]['name'] = $value['name'];
      $data[$key]['nickname'] = $value['nickname'];
      $data[$key]['avatarurl'] = $value['avatarurl'];
      $data[$key]['level'] = $value['level']==2?'Vip会员':'普通会员';
      $data[$key]['tel'] = $value['tel'];
      $data[$key]['cjfl'] = $value['cjfl']==1?'艺术文':'艺术理';
      $data[$key]['major'] = getmajor1($value['major']);
      $data[$key]['gkfs'] = $value['gkfs'];
      $data[$key]['tkfs'] = $value['tkfs'];
      $data[$key]['paiming'] = $value['paiming'];
      $data[$key]['mobileinfo'] = $value['mobileinfo'];
      $data[$key]['address'] = $value['address'];
      $data[$key]['addtime'] = date('Y-m-d',$value['addtime']);
    }
    $arr = array(
      array('name','姓名'),
      array('nickname','微信昵称'),
      array('avatarurl','微信头像'),
      array('level','等级'),
      array('tel','手机'),
      array('cjfl','成绩分类'),
      array('major','专业'),
      array('gkfs','高考分数'),
      array('tkfs','统考分数'),
      array('paiming','全省排名'),
      array('mobileinfo','登录设备'),
      array('address','地址'),
      array('addtime','注册时间')
    );
    $exceldata = $ExcelTool->export_excel('member','会员列表',$arr,$data);
    $result['code'] = 1;
    $result['msg'] = '生成成功！';
    $result['url'] = "/".$exceldata;
    return $result;
  }
  /**
   * 设置
   */
  public function setting()
  {
    if(request()->isPost())
    {
      $post = input();
      $res = db('member_setting')->where('id',1)->update($post);
      if($res){
        $result['url'] = addon_url('member://member/setting');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '修改失败!';
        $result['code'] = 0;
        return $result;
      }
    }
    else
    {
      $title = '会员设置';
      $info = db('member_setting')->field('status,dqsj')->find(1);
      $this->assign('status', $info['status']);
      $this->assign('dqsj', $info['dqsj']);
      $this->assign('title', $title);
      return $this->fetch();
    }
  }
}
?>
