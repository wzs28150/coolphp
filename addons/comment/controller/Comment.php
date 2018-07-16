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

namespace addons\comment\controller;
require_once(ADDONS_PATH.'comment/common.php');
class Comment extends Admin
{
  /**
   * 类别列表
   */
  public function index()
  {
    if(request()->isPost())
    {
      $page =input('page')?input('page'):1;
      $pageSize =input('limit')?input('limit'):config('pageSize');
      $list = db('comment')->paginate(array('list_rows'=>$pageSize,'page'=>$page))
      ->toArray();

      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $lists = $list['data'];
      foreach ($lists as $k=>$v ){
        $lists[$k]['addtime'] = date('Y-m-d H:i:s',$v['addtime']);
        $lists[$k]['content'] = changeemoji($v['content']);
      }
      $rsult['data'] = $lists;
      $rsult['count'] = $list['total'];
      $rsult['rel'] = 1;
      return $rsult;
    }
    else
    {
      $title = '类别管理';
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
      $res = db('comment')->delete($id);
      if($res){
        $result['url'] = addon_url('comment://comment/index');
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
  public function changestatus()
  {
    $id = Input('id');
    if(Input('status') == 1){
      $status = 0;
    }else{
      $status = 1;
    }
    // echo $status;
    $data['status']=$status;
    $res = db('comment')->where('id',$id)->update($data);
    if($res){
      $result['url'] = addon_url('comment://comment/index');
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
