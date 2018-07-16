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


 ?>
