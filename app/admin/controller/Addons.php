<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
class Addons extends Common
{
    // private $addonsListM;
    public function _initialize()
    {
        parent::_initialize();
        $this->addonsListM = db('addons')->field('name,status')->select();

    }
    public function index()
    {

        if(request()->isPost()){
          $page =input('page')?input('page'):1;
          $pageSize =input('limit')?input('limit'):config('pageSize');
          $list = $this -> getDir(ADDONS_PATH);
          $count = count($list);
          foreach ($list as $key => $value) {
            $json_string = file_get_contents(ADDONS_PATH .$value. '/addons.json');
            // 把JSON字符串转成PHP数组 得到插件列表
            $addonsJson = json_decode($json_string, true);
            $list[$key]=$addonsJson;
          }
          // dump($list);
          foreach ($list as $key => $value)
          {
            $list[$key]['id'] = $key + 1;
            // echo $value['author']['name'];
            $list[$key]['author'] = $value['authors'][0]['name'];
            if(in_array($value['name'],$this->addonsListM))
            {
              $list[$key]['status'] = 1;
            }
            else
            {
              $list[$key]['status'] = 0;
            }

          }
          $list = $this -> page_array($pageSize,$page,$list,0);
          // dump($list);
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = $list;
          $rsult['count'] = $count;
          $rsult['rel'] = 1;
          return $rsult;
        }
      return $this->fetch();

      // dump($addonsJson);
    }

    private function getDir($dir) {
        $dirArray[]=NULL;
        if (false != ($handle = opendir ( $dir ))) {
            $i=0;
            while ( false !== ($file = readdir ( $handle )) ) {
                //去掉"“.”、“..”以及带“.xxx”后缀的文件
                if ($file != "." && $file != ".."&&!strpos($file,".")) {
                    $dirArray[$i]=$file;
                    $i++;
                }
            }
            //关闭句柄
            closedir ( $handle );
        }
        return $dirArray;
    }

    private function page_array($count,$page,$array,$order){
      global $countpage; #定全局变量
      $page=(empty($page))?'1':$page; #判断当前页面是否为空 如果为空就表示为第一页面
        $start=($page-1)*$count; #计算每次分页的开始位置
      if($order==1){
        $array=array_reverse($array);
      }
      $totals=count($array);
      $countpage=ceil($totals/$count); #计算总页面数
      $pagedata=array();
      $pagedata=array_slice($array,$start,$count);
      return $pagedata; #返回查询数据
    }

}
