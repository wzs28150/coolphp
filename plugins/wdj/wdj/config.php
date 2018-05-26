<?php

return array(
    'code'=> 'wdj',
    'name' => '微点金插件',
    'version' => '1.0',
    'author' => 'wzs',
    'desc' => '微点金插件',
    'icon' => 'logo.png',
    'config' => array(
        array('name' => 'adpic','label'=>'广告图片','type' => 'image',   'value' => ''),
        array('name' => 'addposition','label'=>'广告位置','type' => 'select', 'option'=>array('头部','底部'),  'value' => ''),
        array('name' => 'tel','label'=>'手机','type' => 'text', 'value' => ''),
        array('name' => 'url','label'=>'链接','type' => 'text', 'value' => '')
    )
); 