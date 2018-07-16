<?php
// +----------------------------------------------------------------------
// | 评论插件 后台管理总界面 对数据进行统计
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.hrbkcwl.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wzs <1003418012@qq.com>
// +

namespace addons\comment\controller;

use think\addons\Controller;
use think\Db;
use think\Input;
use cool\Leftnav;
class Admin extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        //判断管理员是否登录
        if (!session('aid')) {
            $this->redirect('admin/login/index');
        }
        //判断插件是否安装
        $is_install = db('addons')->where('name',$this->addon)->find();
        if(!$is_install){
          $this->redirect('admin/login/index');
        }
        $this->assign('addon', $this->addon);
    }

    /**
     * 页面主体
     */
     public function index()
     {
       $authRule = cache($this->addon.'_authRule');
        //  if(!$authRule){
        //      $authRule = db($this->addon.'_category')->where('menustatus=1')->order('sort')->select();
        //      cache($this->addon.'_authRule', $authRule, 3600);
        // }
        //
        //  //声明数组
        //  $menus = array();
        //  foreach ($authRule as $key=>$val){
        //      $authRule[$key]['href'] = url($val['href']);
        //      if($val['pid']==0){
        //          $menus[] = $val;
        //      }
        //  }
        //  foreach ($menus as $k=>$v){
        //      foreach ($authRule as $kk=>$vv){
        //          if($v['id']==$vv['pid']){
        //              $menus[$k]['children'][] = $vv;
        //          }
        //      }
        //  }
         // dump($authRule);exit;
       $menus = getleftnav(115,1,array('aid'=>79));
       dump($menus);
       $this->assign('menus', $menus);
       return $this->fetch();
     }

    /**
     * 后台首页控制面板
     * 主要对插件内一些数据进行图表数据展现与统计
     */
    public function main()
    {
      // 查询今天的预订量
      $start = strtotime(date('Y-m-d 00:00:00'));
      $end = strtotime(date('Y-m-d H:i:s'));
      $treemounth = strtotime(date("Y-m-d", strtotime("-3 month")));
      // 评论人数
      // 今日评论人数
      $jrrssql = "SELECT count(*) as jrrs FROM `cool_".$this->addon."` WHERE `addtime` >= $start AND `addtime` <= $end";
      $jrrs = Db::query($jrrssql);
      $jrrs = $jrrs[0]['jrrs'];
      // 总评论人数
      $zrssql = "SELECT count(*) as zrs FROM `cool_".$this->addon."`";
      $zrs = Db::query($zrssql);
      $zrs = $zrs[0]['zrs'];

      // $maxnumsql = "SELECT  max(totalnum.num) as maxnum,url,title  FROM  (  SELECT  count(*) as num,url,title  FROM  `cool_".$this->addon."` oi where `addtime` > ".$treemounth."  GROUP BY  oi.aid   ) as totalnum";
      $maxnumsql = "SELECT  num as maxnum,url,title  FROM  (  SELECT  count(*) as num,url,title  FROM  `cool_".$this->addon."` oi where `addtime` > ".$treemounth."  GROUP BY  oi.aid   ) as totalnum order by maxnum desc limit 5";
      $maxnum = Db::query($maxnumsql);
      // dump($maxnum);
      // echo $jrrs;
      //
      //
      //
      $shijianxian = Db::query("select date(from_unixtime(addtime)) as riqi, count(*) as cnnum   from `cool_".$this->addon."` where from_unixtime(addtime) >= date(now()) - interval 7 day group by day(from_unixtime(addtime));");

      $riqistr = '';
      $pvstr = '';
      $uvstr = '';
      $ipstr = '';
      foreach ($shijianxian as $key => $value) {
          $riqistr.=',"'.$value['riqi'].'"';
          $cnstr.=','.$value['cnnum'];
      }
      $riqistr = substr($riqistr, 1);
      $cnstr = substr($cnstr, 1);
      $this->assign('riqistr', $riqistr);
      $this->assign('cnstr', $cnstr);
      $this->assign('maxnum', $maxnum);
      $this->assign('jrrs', $jrrs);
      $this->assign('zrs', $zrs);

      return $this->fetch();
    }

}
