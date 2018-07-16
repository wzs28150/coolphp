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
require_once(ADDONS_PATH.'member/common.php');
class Member extends Admin
{
  public function _initialize()
  {
      parent::_initialize();
      // 判断是否审核
      $res = db('member_setting')->field('is_state')->find(1);
      $this->assign('is_state',$res['is_state']);
  }
  /**
   * 类别列表
   */
  public function index()
  {
    if(request()->isPost())
    {
      $page =input('page')?input('page'):1;
      $pageSize =input('limit')?input('limit'):config('pageSize');
      $list = db('member')->paginate(array('list_rows'=>$pageSize,'page'=>$page))
      ->toArray();
      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $lists = $list['data'];
      // dump(unserialize($lists[0]['other']));exit;
      foreach ($lists as $k=>$v ){
        $lists[$k]['addtime'] = date('Y-m-d H:i:s',$v['addtime']);
        $arr = unserialize($v['other']);
        $lists[$k]['oirganization'] = getoirganization($arr['oirganization']);
        $lists[$k]['email'] = $arr['email'];
        $lists[$k]['birthday'] = $arr['birthday'];
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

}
?>
