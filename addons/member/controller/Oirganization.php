<?php
// +----------------------------------------------------------------------
// | 会员插件 组织分类设置
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +----------------------------------------------------------------------

namespace addons\member\controller;

class Oirganization extends Admin
{
  /**
   * 类别列表
   */
  public function index()
  {
    if(request()->isPost())
    {
      $page = input('page')?input('page'):1;
      $pid = input('pid')?input('pid'):0;
      $pageSize =input('limit')?input('limit'):config('pageSize');
      $list = db('member_oirganization')->where('pid',$pid)->paginate(array('list_rows'=>$pageSize,'page'=>$page))
      ->toArray();
      $rsult['code'] = 0;
      $rsult['msg'] = "获取成功";
      $lists = $list['data'];
      foreach ($lists as $k=>$v ){
        $lists[$k]['addtime'] = date('Y-m-d H:i:s',$v['addtime']);
      }
      $rsult['data'] = $lists;
      $rsult['count'] = $list['total'];
      $rsult['rel'] = 1;
      return $rsult;
    }
    else
    {
      $title = '单位编制管理';
      $this->assign('title', $title);
      return $this->fetch();
    }

  }

  /**
   * 类别添加
   */
  public function add()
  {
    if(request()->isPost()){
      $data["title"] = Input("title");
      $data["pid"] = Input("pid");
      $data["addtime"] = time();
      $res = db('member_oirganization')->insertGetId($data);
      if($data["pid"] != 0){
        $plist = db('member_oirganization')->field('child')->find($data["pid"]);
        if($plist['child'] && $plist['child']!= null){
          $pdata['child'] = $plist['child'].','.$res;
        }else{
          $pdata['child'] = $res;
        }
        $res = db('member_oirganization')->where('id',$data["pid"])->update($pdata);

      }

      if($res){
        $result['url'] = addon_url('member://oirganization/index');
        $result['msg'] = '添加成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '添加失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $title = '添加单位编制';
      $list = db('member_oirganization')->where('pid',0)->select();
      $this->assign('list', $list);
      $this->assign('title', $title);
      return $this->fetch();
    }
  }

  /**
   * 类别编辑
   */
  public function edit()
  {
    if(request()->isPost()){
      $data["title"] = Input("title");
      $data["status"] = Input("status");
      $data["addtime"] = time();
      $res = db('member_oirganization')->where('id',Input('id'))->update($data);
      if($res){
        $result['url'] = addon_url('member://oirganization/index');
        $result['msg'] = '修改成功!';
        $result['code'] = 1;
        return $result;
      }else{
        $result['msg'] = '修改失败!';
        $result['code'] = 0;
        return $result;
      }
    }else{
      $title = '添加单位编制';
      $this->assign('title', $title);
      $id = Input('id');
      $info = db('member_oirganization')->find($id);
      $this->assign('info',$info);
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
      $res = db('member_oirganization')->delete($id);
      if($res){
        $result['url'] = addon_url('member://oirganization/index');
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
}
?>
