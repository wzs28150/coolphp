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
          $list = $this -> getDir(ADDONS_PATH);
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
          // dump($list);
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = $list;
          $rsult['count'] = $list['total'];
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

    private function getFile($dir) {
        $fileArray[]=NULL;
        if (false != ($handle = opendir ( $dir ))) {
            $i=0;
            while ( false !== ($file = readdir ( $handle )) ) {
                //去掉"“.”、“..”以及带“.xxx”后缀的文件
                if ($file != "." && $file != ".."&&strpos($file,".")) {
                    $fileArray[$i]="./imageroot/current/".$file;
                    if($i==100){
                        break;
                    }
                    $i++;
                }
            }
            //关闭句柄
            closedir ( $handle );
        }
        return $fileArray;
    }

}
