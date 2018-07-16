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
    'Search' => 'home/index/search',
    'member' => 'home/member/index',
    //注册
    'Register' => 'home/member/register',
    //登录
    'Login'=> 'home/member/login',
    //我的发布
    'Release/:status'=> 'home/member/release',
    'Dorelease'=> 'home/member/dorelease',
    //首长信箱
    'Letter'=>'home/index/letter',
    'LetterInfo/:id'=>'home/index/letterinfo',
    'Letterlist'=>'home/index/letterlist',
    'MyLetter/:status'=>'home/member/letter',
    //心理咨询
    'Psychological'=>'home/index/psychological',
    'psychologicalinfo/:id'=>'home/index/psychologicalinfo',
    'Psychologicallist'=>'home/index/psychologicallist',
    'Mypsychological/:status'=>'home/member/psychological',
    //法律服务
    'Law/:status'=>'home/index/law',
    'LawInfo/:id'=>'home/index/lawinfo',
    //保修
    'Repairs/:status'=> 'home/member/repairs',
    'Dorepairs'=> 'home/member/dorepairs',

    //修改密码
    'Xgmm'=> 'home/member/xgmm',

    //专题页列表
    'Activity/:aid/'=> 'home/activity/index',
    'Activitylist/:id/:aid/'=>'home/activity/alist',
    'Activityinfo/:id/:catid/:aid/'=>'home/activity/info',

    //答题
    'Answer'=> 'home/answer/index',
    'Answerform'=> 'home/answer/form',
    'Answerinfo/:id'=> 'home/answer/info',
    'Answerlist'=> 'home/answer/lista',
    //新闻
    'News/:catId' => 'home/news/index',
    'NewsInfo/:id/:catId' => 'home/news/info',
    //理论学习
    'Study/:catId' => 'home/study/index',
    'StudyInfo/:id/:catId' => 'home/study/info',
    //备战打仗
    'Prepare/:catId' => 'home/prepare/index',
    'PrepareInfo/:id/:catId' => 'home/prepare/info',
    //教育平台
    'Education/:catId' => 'home/education/index',
    'EducationInfo/:id/:catId' => 'home/education/info',
    //工作指导
    'Work/:catId' => 'home/work/index',
    'WorkInfo/:id/:catId' => 'home/work/info',
    //服务官兵
    'Service/:catId' => 'home/service/index',
    'ServiceInfo/:id/:catId' => 'home/service/info',
    //强军文化
    'Culture/:catId' => 'home/culture/index',
    'CultureInfo/:id/:catId' => 'home/culture/info',
    //强军风采
    'Elegant/:catId' => 'home/elegant/index',
    'ElegantInfo/:id/:catId' => 'home/elegant/info',
    //放映厅
    'Video/:catId' => 'home/video/index',
    'Tv/:catId' => 'home/Tv/index',
    'VideoInfo/:id/:catId' => 'home/video/info',
    'TvInfo/:id/:catId/:tid' => 'home/Tv/info',
    //畅听吧
    'Music/:catId' => 'home/music/index',
    'MusicInfo/:id/:catId' => 'home/music/info',
    //畅听吧
    'Xinli/:catId' => 'home/xinli/index',
    'XinliInfo/:id/:catId' => 'home/xinli/info',

    'Letter/:catId' => 'home/letter/index',
    'XinliInfo/:id/:catId' => 'home/xinli/info',

    'Lhb/:catId/:year/:month' => 'home/lhb/index',
    'dolhb' => 'home/index/dolhb',
    'Book/:catId' => 'home/book/index',
    'BookInfo/:id/:catId' => 'home/book/info',
    // 'contact/:catId' => 'home/contact/index',
    // 'weidianji/' => 'home/weidianji/index',
    // 'weidianji/dourl' => 'home/weidianji/dourl',
    // 'weidianjishow/:id' => 'home/weidianji/show',
    'datastatistics/' => 'home/datastatistics/index',
    'datastatistics/dostatistics' => 'home/datastatistics/dostatistics',
];
