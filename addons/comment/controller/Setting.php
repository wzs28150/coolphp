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
class Setting extends Admin
{
  /**
   * 类别列表
   */
  public function index()
  {
    if(request()->isPost())
    {
      $data = Input("post.");
      // dump($data);exit;
      $res = db('comment_setting')->where('id',1)->update($data);
      $result['url'] = addon_url('comment://setting/index');
      $result['msg'] = '修改成功!';
      $result['code'] = 1;
      return $result;
    }
    else
    {
      $info = db('comment_setting')->find(1);
      $this->assign('info', $info);
      return $this->fetch();
    }

  }


}
?>
