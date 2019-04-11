<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

    // 'index' => 'home/index/index',
    // 'about/:catId' => 'home/about/index',
    // 'huanbao/:catId' => 'home/huanbao/index',
    // 'distributionInfo/:id/:catId' => 'home/distribution/info',
    // 'class/:catId' => 'home/class/index',
    // 'activity/:catId' => 'home/activity/index',
    // 'activityInfo/:id/:catId' => 'home/activity/info',
    // 'class/:catId' => 'home/class/index',
    // 'classInfo/:id/:catId' => 'home/class/info',
    // 'news/:catId' => 'home/news/index',
    // 'newsInfo/:id/:catId' => 'home/news/info',
    // 'products/:catId' => 'home/products/index',
    // 'contact/:catId' => 'home/contact/index',
    // 'contact/senMsg'=>'home/index/sendbook',
    // 'contact/free'=>'home/index/free',
    // 'datastatistics/' => 'home/datastatistics/index',
    // 'datastatistics/dostatistics' => 'home/datastatistics/dostatistics',
use think\Db;
$list = db('category')->select();
// dump($list);
$addRouter = array();
foreach ($list as $key => $value) {
  //echo $value['catdir'];
  if($value['module'] == 'page'){
    $addRouter[$value['catdir'].'/:catId'] = 'home/'.$value['catdir'].'/index';
  } else {
    $addRouter[$value['catdir'].'/:catId'] = 'home/'.$value['catdir'].'/index';
    $addRouter[$value['catdir'].'Info/:id/:catId'] = 'home/'.$value['catdir'].'/info';
  }
}
$homeRouter = [
    '__pattern__' => [
        'name' => '\w+',
        'id' => '\d+',
        'catId' => '\d+',
        'verson' => '\d+',
    ],

];
// 首页
$index = array('index' => 'home/index/index');
$homeRouter = array_merge($homeRouter,$index);
// 数据分析
$datastatistics = array('datastatistics/' => 'home/datastatistics/index','datastatistics/dostatistics' => 'home/datastatistics/dostatistics');
$homeRouter = array_merge($homeRouter,$datastatistics);
$homeRouter = array_merge($homeRouter,$addRouter);
// dump($homeRouter);
return $homeRouter;
