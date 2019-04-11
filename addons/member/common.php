<?php
function getoirganization($id)
{
  $list = db('member_oirganization')->field('title')->find($id);
  return $list['title'];
}

function getmembernum($oid) {
  $num = db('member')->where('oid',$oid)->count();
  return $num;
}

function getmajor($mid) {
  $list = db('tag')->field('title')->where('catid',42)->find($mid);
  return $list['title'];
}

 ?>
