<?php
namespace app\home\controller;
class Index extends Common{
    public function _initialize(){
        parent::_initialize();
    }
    public function index(){
      if(input('cs')){
        return $this->fetch();
      }else{
        echo "Location: ". $_SERVER['HTTP_HOST']."/wl/admin";
        header("Location: http://". $_SERVER['HTTP_HOST']."/wl/admin"); exit;
      }

    }
    /**
     * 根据地址信息获取物流方式
     * return code 1 有直达物流 code 2 没直达可以中转 3 无直达也无中转
     */
    public function getinfo(){
        $post = input('post.');
        // array(2) {
        //   ["qsd"] => array(3) {
        //     [0] => string(2) "18"
        //     [1] => string(3) "244"
        //     [2] => string(0) ""
        //   }
        //   ["zzd"] => array(3) {
        //     [0] => string(2) "12"
        //     [1] => string(3) "167"
        //     [2] => string(4) "1422"
        //   }
        // }
        //dump($post);exit;
        // $post = array(
        //   "qsd" => array("25","321",""),
        //   // "qsd" => array("18","244",""),
        //   // "zzd" => array("12","167","1422")
        //   "zzd" => array("12","167","")
        // );
        foreach ($post as $key => $value) {
          $where[$key] = implode(',',$post[$key]);
        }
        // $where2['zzd'] = $post['zzd'][0];
        // $where3['zzd'] = $post['zzd'][2];
        //dump($where);
        //dump(rtrim($zzdqstr,','));exit;
        // $list = db('wlxl')->field('id,title,wlz')->where($where)->fetchsql(false)->select();
        // $sql = "select * from (SELECT `a`.`title`,`a`.`qsd`,`a`.`zzd`,`w`.`id`,w.title as wltitle,`w`.`wltel`,`w`.`wladdress` FROM `cool_wlxl` `a` INNER JOIN `cool_wuliu` `w` ON `a`.`wlz`=`w`.`id` WHERE  `a`.`qsd` = '".$where['qsd']."'  AND `a`.`zzd` LIKE '".$where2['zzd']."%') as `b` where `b`.`zzd` LIKE '%,".$where3['zzd']."%'";
        //优化sql
        $sql = "SELECT `a`.`title`,`a`.`qsd`,`a`.`zzd`,`a`.`xhdz`,`w`.`description`,`w`.`id`,w.title as wltitle,`w`.`wltel`,`w`.`wladdress` FROM `cool_wlxl` `a` INNER JOIN `cool_wuliu` `w` ON `a`.`wlz`=`w`.`id` WHERE  `a`.`qsd` = '".$where['qsd']."' and find_in_set('".$post['zzd'][2]."',`a`.`zzd`) <> 0  and find_in_set('".$post['zzd'][0]."',`a`.`zzd`) <> 0 and find_in_set('".$post['zzd'][1]."',`a`.`zzd`) <> 0";
        $zdlist= db()->table('cool_wlxl')->query($sql);
        // echo($sql);exit;
        if($zdlist){
          //能查到直达线路+
          $zz['code']=1;
          $zz['msg']='直达物流';
          $zz['zdlist']=$zdlist;
          $is_zhongzhuan = $this->getzhongzhuan($post);
          if($is_zhongzhuan){
            $zz['zhongzhuan']=$is_zhongzhuan;
          }
          echo json_encode($zz);
        }else{
          //查不到直达线路
          $is_zhongzhuan = $this->getzhongzhuan($post);
          if($is_zhongzhuan){
            $zz['code']=2;
            $zz['msg']='无直达物流,可中转';
            $zz['zhongzhuan']=$is_zhongzhuan;
            echo json_encode($zz);
          }else{
            $zz['code']=3;
            $zz['msg']='无直达物流,不可中转';
            echo json_encode($zz);
          }
        }
    }
    public function getzhongzhuan($post){
      // 测试数据

      foreach ($post as $key => $value) {
        $tiaojian[$key] = implode(',',$post[$key]);
      }
      $sql = "SELECT `qsd` FROM `cool_wlxl`  WHERE  `qsd` <> '".$tiaojian['qsd']."' and find_in_set('".$post['zzd'][2]."',`zzd`) <> 0  and find_in_set('".$post['zzd'][0]."',`zzd`)<> 0 and find_in_set('".$post['zzd'][1]."',`zzd`) <> 0 group by qsd";
      $list1 = db()->table('cool_wlxl')->query($sql);

      $sql2 = "SELECT `zzd` FROM `cool_wlxl`  WHERE  `qsd` = '".$tiaojian['qsd']."' and (find_in_set('".$post['zzd'][2]."',`zzd`) = 0  or find_in_set('".$post['zzd'][0]."',`zzd`) = 0 or find_in_set('".$post['zzd'][1]."',`zzd`) = 0)  group by zzd";
      $list2=  db()->table('cool_wlxl')->query($sql2);
      $zzd = array_column($list2,'zzd');
      $qsd = array_column($list1,'qsd');
      //判断省市是否相同 简化对比
      if($zhongzhuan = array_intersect_assoc($this->quqx($qsd),$this->quqx($zzd))){
        // dump($zhongzhuan);
        foreach ($zhongzhuan as $key => $value) {
          $wherestr = implode(',',$value).',';
          $fither = db('wlzzz')->where('zzd',$wherestr)->find();
          //dump($fither);
          if(!$fither){
            //echo $key;
            //array_splice($zhongzhuan,$key,1);
            unset($zhongzhuan[$key]);
          }else{
            $zzarr[$key]['title'] = $this -> gettrueRegion($value);
            $zzarr[$key]['region'] = $value;
            // echo implode(',',$value);
            $zzarr[$key]['info'] = $this->getzzbyregion($tiaojian['qsd'],implode(',',$value));
          }
        }
       // dump($zzarr);
        return $zzarr;
      }else{
        return false;
      }
    }

    public function geterjiwuliu()
    {
      $post = input('post.');
      $tiaojian = explode(',',$post['zzd']);
      $sql = "select * from cool_wlxl as a inner JOIN cool_wuliu as b on a.wlz = b.id where a.qsd = '".$post[qsd].",' and find_in_set('".$tiaojian[2]."',`a`.`zzd`) <> 0  and find_in_set('".$tiaojian[0]."',`a`.`zzd`) <> 0 and find_in_set('".$tiaojian[1]."',`a`.`zzd`) <> 0";
      // echo $sql;
      $list = db()->table('cool_wlxl')->query($sql);
      // dump($list);
      if($list){
        echo json_encode($list);
      }
    }
    private function gettrueRegion($regionarr){

      // dump($regionarr);
      $str = '';
      foreach ($regionarr as $key => $value) {
        if($value){
         $str .= $this -> getRegioninfo($value).',';
        }
      }
      return rtrim($str, ',');
    }

    /**
     * 去掉区县 只留省市
     * @param  [type] $arr [地址数组]
     * @return [type] $val2[地址数组]
     */
    private function quqx($arr){
      $val2 =array();
      foreach ($arr as $key => $value) {
        $val = $value;
        // dump(explode(',',$val));
        $val2[$key] = array_splice(explode(',',$val),0,2);
      }
      return $val2;
    }
    /**
     * 去掉省市 只留区县
     * @param  [type] $arr [地址数组]
     * @return [type] $val2[地址数组]
     */
    private function quss($arr){
      $val2 =array();
      foreach ($arr as $key => $value) {
        $val = $value;
        // dump(explode(',',$val));
        $va = explode(',',$val);
        array_splice($va,0,2);
        $val2[$key] = $va;
      }
      return $val2;
    }
    private function isinfuckarr($arr){

    }

    private function getRegioninfo($id){
        //dump(input('get.'));
        $Region=db("region");
        $map['id']=$id;
        // echo $id;
        //$map['type']=input("type");
        $list=$Region->field('name')->where($map)->find();
        return $list['name'];
    }
    public function getRegion(){
        //dump(input('get.'));
        $Region=db("region");
        $map['pid']=input("pid");
        //$map['type']=input("type");
        $list=$Region->where($map)->select();
        echo json_encode($list);
    }
  	public function getzzbyregion($qsd,$zzd){
        // $id = input("id");
        // dump($zzd);exit;
        $list=db('wlzzz')->field('fwf,zzfwf,bzdm,bzxm,bzxgj,bzdgj')->where('qsd',$qsd)->where('zzd',$zzd)->fetchsql(false)->find();
        return $list;
    }

    public function geterjiwuliureal(){
      $post = input('post.');
      $id = $post['id'];
      $list=db('wuliu')->find($id);
      echo json_encode($list);
    }
}
