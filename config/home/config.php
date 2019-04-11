<?php
return [
    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => './templete/default/',
        // 模板后缀
        'view_suffix'  => 'html',
        'taglib_pre_load'=> '\app\common\taglib\Cool',
        // 模板文件名分隔符
        'view_depr'    => '_',
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}',
        // 标签库标签开始标记
        'taglib_begin' => '{',
        // 标签库标签结束标记
        'taglib_end'   => '}',

    ],
];
