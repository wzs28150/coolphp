<?php
namespace app\admin\controller;
class Order extends Common
{
  function _initialize()
  {
      parent::_initialize();
      date_default_timezone_set("Etc/GMT+8");
      $this->aid = $_SESSION['think']['aid'];
      $this->gid = $_SESSION['think']['gid'];
      // dump($_SESSION);
      if($this->gid==1 || $this->gid==2){
        // 管理员
        $this->region = array('region' => 'all' );;
      }else{
        //非管理员
        $list = db('auth_group')->field('region')->find($this->gid);
        $this->region = $list;

      }

  }
  public function index()
  {
    if(request()->isPost()){
      // dump($this->region);exit;
      $url = $_SERVER['HTTP_HOST'].'/mobile/index.php?m=Orderajax&a=index';
      $region = $this->region;
      $post_data = array('region' => $region['region'],'starttime'=> strtotime(input('starttime')),'endtime'=> strtotime(input('endtime')));
      $data = $this->SendDataByCurl($url,$post_data);
      // dump($data);exit;
      if($data == 'none'){
        $rsult['code'] = 0;
        $rsult['msg'] = "获取成功";
        $rsult['data'] = array();
        $rsult['count'] = 0;
        $rsult['rel'] = 1;
        return $rsult;
      }else{
        $info = $this->object_to_array(json_decode($data));
        $item=array();
        foreach ($info as $k=>$v ){
            $info[$k]['add_time'] = date('Y-m-d H:i:s',$v['add_time']);
        }
        if($info){
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = $info;
          $rsult['count'] = count($info);
          $rsult['rel'] = 1;
          return $rsult;
        }else{
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = array();
          $rsult['count'] = 0;
          $rsult['rel'] = 1;
          return $rsult;
        }
      }


    }else{
      return $this->fetch ('order/index');
    }

  }
  public function info()
  {
    $order_id = input('id');
    // $info = $this->object_to_array(json_decode($data));
    $url = $_SERVER['HTTP_HOST'].'/mobile/index.php?m=Orderajax&a=info';
    $post_data['order_id'] = $order_id;
    $data = $this->SendDataByCurl($url,$post_data);
    $info = $this->object_to_array(json_decode($data));

    if($info['code'] == 1){
      $_LANG['cs'][0] = '待确认';
      $_LANG['cs'][1] = '待付款';
      $_LANG['cs'][2] = '待发货';
      $_LANG['cs'][3] = '已完成';
      $_LANG['cs'][4] = '付款中';
      $_LANG['cs'][5] = '取消';
      $_LANG['cs'][6] = '无效';
      $_LANG['cs'][7] = '退货';
      $_LANG['cs'][8] = '部分发货';
      $_LANG['os'][0] = '未确认';
      $_LANG['os'][1] = '已确认';
      $_LANG['os'][2] = '<font color="red"> 取消</font>';
      $_LANG['os'][3] = '<font color="red">无效</font>';
      $_LANG['os'][4] = '<font color="red">退货</font>';
      $_LANG['os'][5] = '已分单';
      $_LANG['os'][6] = '部分分单';
      $_LANG['os'][7] = '<font color="red">部分已退货</font>';
      $_LANG['os'][8] = '<font color="red">仅退款</font>';
      $_LANG['ss'][0] = '未发货';
      $_LANG['ss'][1] = '配货中';
      $_LANG['ss'][2] = '已发货';
      $_LANG['ss'][3] = '收货确认';
      $_LANG['ss'][4] = '已发货(部分商品)';
      $_LANG['ss'][5] = '发货中';
      $_LANG['ps'][0] = '未付款';
      $_LANG['ps'][1] = '付款中';
      $_LANG['ps'][2] = '已付款';
      $_LANG['ps'][3] = '部分付款(定金)';
      $_LANG['ps'][4] = '已退款';
      if($info['order_info']['shipping_status']){
        $info['order_info']['shipping_status'] = $info['order_info']['shipping_status'] + 1;
      }
      $info['order_info']['status'] = $_LANG['os'][$info['order_info']['order_status']] . ',' . $_LANG['ps'][$info['order_info']['pay_status']] . ',' . $_LANG['ss'][$info['order_info']['shipping_status']];
      // 处理物流信息
      $total_zz_price = 0;$total_bz_price = 0;
      foreach ($info['goods_info'] as $key => $row) {
        //判断是否中转
    		if($row['is_zhongzhuan'] == 1){
    			//中转
    			//输出在哪中转
    			$info['goods_info'][$key]['zz'] = '在'.$row['zz_title'].'<br>';
    			$info['goods_info'][$key]['zz'] .= '中转服务费：￥'.changepricetype($row['zz_price']).'<br>';
    			//判断二级物流是否直达
    			if($row['er_wl_type']){
    				//不直达
    				if($row['er_wl_type'] == 'zbc'){
    					//自备车辆取货
    					$info['goods_info'][$key]['zz'] .= '中转后转自备车辆取货';
              $info['goods_info'][$key]['zz'] .= '<br>时间：'.$row['zbctime'].'<br>地址：'.$row['zbcaddress'].'<br>车辆信息：'.$row['zbcchexing'];
    				}else if($row['er_wl_type'] == 'zdywl'){
    					//自定义常用物流
    					$info['goods_info'][$key]['zz'] .= '中转后转自定义常用物流';
              $info['goods_info'][$key]['zz'] .= '<br>'.$row['zdywltitle'].'<br>电话：'.$row['zdywltel'].'<br>地址：'.$row['zdywladdress'];
    				}else if($row['er_wl_type'] == 'shsm'){
    					//送货上门
    					$info['goods_info'][$key]['zz'] .= '中转后转送货上门';
    				}
    			}else{
    				//直达
    				$info['goods_info'][$key]['zz'] .= '中转后转'.$row['er_zztitle'].'<br>';
            // 获取二级物流信息
    				// $row['er_zzid']
            $infozz = $this->geterjiwuliureal($row['er_zzid']);
    				$info['goods_info'][$key]['zz'] .= '电话：'.$infozz['wltel'].'<br>';
    				$info['goods_info'][$key]['zz'] .= '地址：'.$infozz['wladdress'];
    			}
    		}
        $info['goods_info'][$key]['total_fee'] = $row['goods_price'] + $row['bz_price'] + $row['zz_bz_price'] + $row['zz_price'];
        $total_zz_price = $total_zz_price + $row['zz_price'];
        $total_bz_price = $total_bz_price + $row['zz_bz_price'];
      }
      if(input('cs')){
        dump($info['order_action']);
      }
      $this->assign('user_info',$info['user_info']);
      $this->assign('goods_info',$info['goods_info']);
      $this->assign('total_zz_price',$total_zz_price);
      $this->assign('total_bz_price',$total_bz_price);
      $this->assign('order_action',$info['order_action']);
      $this->assign('order_info',$info['order_info']);
    }
    return $this->fetch ('order/info');
  }

  public function addwuliuaction()
  {
    // $order_sn = I('order_sn');
		// $note = '[物流] ' .  I('action_note');
		// $admin =  I('admin');
		$admin_info = db('auth_group')->field('title')->find($this->gid);
    if($this->gid<=2){
      $admin = '物流'.$admin_info['title'];
    }else{
      $admin = $admin_info['title'];
    }
    $post_data = array('order_sn' => input('order_sn'),'order_id' => input('order_id'),  'action_note'=>input('action_note'),'admin'=> $admin);
    $url = $_SERVER['HTTP_HOST'].'/mobile/index.php?m=Orderajax&a=changezhongstatue';
    $data = $this->SendDataByCurl($url,$post_data);
    // dump($data); exit;
    $info = $this->object_to_array(json_decode($data));
    return $info;
  }


  private function geterjiwuliureal($id){
    $infozz = db('wuliu')->field('wltel,wladdress')->find($id);
    return $infozz;
  }

  private function SendDataByCurl($url,$data=array()){
    //对空格进行转义
    $url = str_replace(' ','+',$url);
    $ch = curl_init();
    //设置选项，包括URL
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch,CURLOPT_TIMEOUT,3);  //定义超时3秒钟
     // POST数据
    curl_setopt($ch, CURLOPT_POST, 1);
    // 把post的变量加上
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));    //所需传的数组用http_bulid_query()函数处理一下，就ok了
    //执行并获取url地址的内容
    $output = curl_exec($ch);

    $errorCode = curl_errno($ch);
    //释放curl句柄
    curl_close($ch);
    if(0 !== $errorCode) {
        return false;
    }
    return $output;

  }

  private function object_to_array($obj){
	  $_arr = is_object($obj) ? get_object_vars($obj) :$obj;
	  foreach ($_arr as $key=>$val){
	   $val = (is_array($val) || is_object($val)) ? $this->object_to_array($val):$val;
	   $arr[$key] = $val;
	  }
	  return $arr;
	 }
}
?>
