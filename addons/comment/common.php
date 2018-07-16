<?php
function changeemoji($content) {
  $emoji = array(
    '笑脸' => '<img src="/addons/comment/src/img/emoji/1.gif" alt="笑脸" />',
    '撇嘴' => '<img src="/addons/comment/src/img/emoji/2.gif" alt="撇嘴" />',
    '色' => '<img src="/addons/comment/src/img/emoji/3.gif" alt="笑脸" />',
    '发呆' => '<img src="/addons/comment/src/img/emoji/4.gif" alt="笑脸" />',
    '流泪' => '<img src="/addons/comment/src/img/emoji/5.gif" alt="笑脸" />',
    '害羞' => '<img src="/addons/comment/src/img/emoji/6.gif" alt="笑脸" />',
    '闭嘴' => '<img src="/addons/comment/src/img/emoji/7.gif" alt="笑脸" />',
    '睡' => '<img src="/addons/comment/src/img/emoji/8.gif" alt="笑脸" />',
    '大哭' => '<img src="/addons/comment/src/img/emoji/9.gif" alt="笑脸" />',
    '尴尬' => '<img src="/addons/comment/src/img/emoji/10.gif" alt="笑脸" />',
    '发怒' => '<img src="/addons/comment/src/img/emoji/11.gif" alt="笑脸" />',
    '调皮' => '<img src="/addons/comment/src/img/emoji/12.gif" alt="笑脸" />',
    '呲牙' => '<img src="/addons/comment/src/img/emoji/13.gif" alt="笑脸" />',
    '惊讶' => '<img src="/addons/comment/src/img/emoji/14.gif" alt="笑脸" />',
    '难过' => '<img src="/addons/comment/src/img/emoji/15.gif" alt="笑脸" />',
    '冷汗' => '<img src="/addons/comment/src/img/emoji/16.gif" alt="笑脸" />',
    '抓狂' => '<img src="/addons/comment/src/img/emoji/17.gif" alt="笑脸" />',
    '吐' => '<img src="/addons/comment/src/img/emoji/18.gif" alt="笑脸" />',
    '偷笑' => '<img src="/addons/comment/src/img/emoji/19.gif" alt="笑脸" />',
    '愉快' => '<img src="/addons/comment/src/img/emoji/20.gif" alt="笑脸" />',
    '白银' => '<img src="/addons/comment/src/img/emoji/21.gif" alt="笑脸" />',
    '傲慢' => '<img src="/addons/comment/src/img/emoji/22.gif" alt="笑脸" />',
    '饥饿' => '<img src="/addons/comment/src/img/emoji/23.gif" alt="笑脸" />',
    '困' => '<img src="/addons/comment/src/img/emoji/24.gif" alt="笑脸" />',
    '惊恐' => '<img src="/addons/comment/src/img/emoji/25.gif" alt="笑脸" />',
    '流汗' => '<img src="/addons/comment/src/img/emoji/26.gif" alt="笑脸" />',
    '憨笑' => '<img src="/addons/comment/src/img/emoji/27.gif" alt="笑脸" />'
  );
  foreach ($emoji as $key => $value) {
    $pattern = '/\|'.$key.'\|/';
    // 检测是否需要替换
    if (preg_match($pattern, $content)) {
        // 开始替换\为/
        $content = preg_replace($pattern, $value , $content);
    }
  }

  return html_entity_decode($content);
}

function getoirganization($id)
{
  $list = db('addons')->field('id')->where('name','member')->find();
  if($list){
    $list = db('member_oirganization')->field('title')->find($id);
    return $list['title'];
  }
}


 ?>
