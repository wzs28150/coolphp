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

return [
    '__pattern__' => [
        'name' => '\w+',
        'id' => '\d+',
        'catId' => '\d+',
    ],
    '[hello]'     => [
        ':id'   => ['home/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['home/hello', ['method' => 'post']],
    ],

    'index' => 'home/index/index',
    'index/info'=> 'home/index/getinfo',
    'index/getRegion'=> 'home/index/getRegion',
    'index/getRegion2'=> 'home/index/getRegion2',
  	'index/getzhongzhuan'=> 'home/index/getzhongzhuan',
    'index/geterjiwuliu'=> 'home/index/geterjiwuliu',
    'index/geterjiwuliureal'=> 'home/index/geterjiwuliureal',
    'news/:catId' => 'home/news/index',
    'newsInfo/:id/:catId' => 'home/news/info',

    'products/:catId' => 'home/products/index',
    'products/:id/:catId' => 'home/products/info',

    'case/:catId' => 'home/case/index',
    'caseInfo/:id/:catId' => 'home/case/info',
    'caseload' => 'home/case/load',

    'solution/:catId' => 'home/solution/index',
    'solutionInfo/:id/:catId' => 'home/solution/info',
    'solutionload' => 'home/case/load',

    'blog/:catId' => 'home/blog/index',
    'blogInfo/:id/:catId' => 'home/blog/info',

    'about/:catId' => 'home/about/index',

    'service/:catId' => 'home/service/index',
    'serviceInfo/:id/:catId' => 'home/service/info',

    'contact/:catId' => 'home/contact/index',
    'weidianji/' => 'home/weidianji/index',
    'weidianji/dourl' => 'home/weidianji/dourl',
    'weidianjishow/:id' => 'home/weidianji/show',
    'datastatistics/' => 'home/datastatistics/index',
    'datastatistics/dostatistics' => 'home/datastatistics/dostatistics',
];
