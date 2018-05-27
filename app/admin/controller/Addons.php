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
        $this->addonsListM = db('addons')->field('name')->select();

    }
    /**
     * 插件列表
     */
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

          foreach ($list as $key => $value)
          {
            $list[$key]['id'] = $key + 1;
            // echo $value['author']['name'];
            $list[$key]['author'] = $value['authors'][0]['name'];
            if($this -> deep_in_array($value['name'], $this->addonsListM))
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

    /**
     * 插件安装
     * @return [type] [description]
     */
    public function install()
    {
      $addonsName = Input('addonsname');
      $addonsInfo = $this -> getAddonsInfo($addonsName);
      $data['name'] = $addonsInfo['name'];
      $data['title'] = $addonsInfo['title'];
      $data['description'] = $addonsInfo['description'];
      $data['author'] = $addonsInfo['authors'][0]['name'];
      $data['version'] = $addonsInfo['version'];
      $data['create_time'] = time();
      $res = db('addons')->insert($data);
      if($res){
          $result['msg'] = '插件安装成功!';
          $result['url'] = url('index');
          $result['code'] = 1;
          return $result;
      }else{
          $result['msg'] = '插件安装失败!';
          $result['code'] = 0;
          return $result;
      }
    }
    /**
     * 卸载程序
     */
    public function uninstall()
    {
      $addonsName = Input('addonsname');
      $res = db('addons')->where('name',$addonsName)->delete();
      if($res){
          $result['msg'] = '插件卸载成功!';
          $result['url'] = url('index');
          $result['code'] = 1;
          return $result;
      }else{
          $result['msg'] = '插件卸载失败!';
          $result['code'] = 0;
          return $result;
      }
    }
    private function getAddonsInfo($addonsName)
    {
      $json_string = file_get_contents(ADDONS_PATH .$addonsName. '/addons.json');
      // 把JSON字符串转成PHP数组 得到插件列表
      $addonsJson = json_decode($json_string, true);
      return $addonsJson;
    }

    private function getDir($dir)
    {
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

    /**
     * 插件数组分页类
     * @param  [type] $count [每页多少条数据]
     * @param  [type] $page  [当前第几页]
     * @param  [type] $array [查询出来的所有数组]
     * @param  [type] $order [0 - 不变   1- 反序]
     * @return [type] $array [返回数据]
     */
    private function page_array($count,$page,$array,$order)
    {
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

    private function deep_in_array($value, $array) {
        foreach($array as $item) {
            if(!is_array($item)) {
                if ($item == $value) {
                    return true;
                } else {
                    continue;
                }
            }

            if(in_array($value, $item)) {
                return true;
            } else if($this -> deep_in_array($value, $item)) {
                return true;
            }
        }
        return false;
    }

}
