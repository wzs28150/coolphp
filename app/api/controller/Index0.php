<?php
namespace app\api\controller;

class Index extends Common{
    public function _initialize(){
        parent::_initialize();
    }
    public function index(){

    }
    public function getnewscol(){
      header('Access-Control-Allow-Origin:*');
      $newscolist = db('category')->where('catdir','News')->where('parentid','<>',0)->order('listorder asc')->select();
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $newscolist;
      return $result;
    }

    public function getregion()
    {
      $post = input();
      $pid = $post['pid'];
      $list = db('region')->where('pid',$pid)->cache(true)->select();
      foreach ($list as $key => $value) {
        $list[$key]['checked'] = false;
      }
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $list;
      return $result;
    }

    public function getmajor()
    {
      $list = db('tag')->field('id,title')->where('catid',42)->select();
      $status = db('member_setting')->field('status')->find(1);
      // $list = array_column($list, 'title');
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $list;
      $result['status'] = $status['status'];
      return $result;
    }

    public function contact()
    {
      $contact = db('page')->field('content')->find(43);
      $data['contact'] = $contact['content'];
      $sys = F('System');
      $others = unserialize($sys['others']);//把不确定的给反序列化了
      $data['tel'] = $others['tel'];
      $data['address'] = $others['address'];
      $data['email'] = $others['email'];
      $data['erw'] = 'https://'.$_SERVER['HTTP_HOST']. __PUBLIC__.$others['erw'];
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $data;
      return $result;
    }

    public function getcooper()
    {
      $info = db('cooper')->order('createtime desc')->limit(1)->find();
      $data['content'] = $info['content'];
      $data['rgnxzz'] = $info['rgnxzz'];
      $data['rgnxtg'] = $info['rgnxtg'];
      $data['rgnyglxq'] = $info['rgnyglxq'];
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $data;
      return $result;
    }
    public function doshoucang()
    {
      $post = input();
      $sid = $post['id'];
      $uid = $post['uid'];
      $collectionlist = db('member')->field('collection')->find($uid);
      $collectionlist = $collectionlist['collection'];
      if($collectionlist){
        $arr = explode(',',$collectionlist);
        if(in_array($sid,$arr)){
          //已收藏
          $k = array_search($sid,$arr);
          unset($arr[$k]);
          // dump($arr);
          $str = implode(',',$arr);
          $data['collection'] = $str;
          $res = db('member') ->where('id', $uid)->update($data);
          if($res){
            $result['code'] = 200;
            $result['errmsg'] = '已取消收藏';
            $result['data'] = $str;
            return $result;
          }else{
            $result['code'] = 400;
            $result['errmsg'] = '取消收藏失败';
            $result['data'] = $collectionlist;
            return $result;
          }

        }else{
          //未收藏
          $data['collection'] = $collectionlist.','.$sid;
          $res = db('member') ->where('id', $uid)->update($data);
          if($res){
            $result['code'] = 200;
            $result['errmsg'] = '收藏成功';
            $result['data'] = $collectionlist.','.$sid;
            return $result;
          }else{
            $result['code'] = 400;
            $result['errmsg'] = '收藏失败';
            $result['data'] = $collectionlist;
            return $result;
          }
        }
      }else{
        $data['collection'] = $sid;
        $res = db('member') ->where('id', $uid)->update($data);
        if($res){
          $result['code'] = 200;
          $result['errmsg'] = '收藏成功';
          $result['data'] = $sid;
          return $result;
        }else{
          $result['code'] = 400;
          $result['errmsg'] = '收藏失败';
          $result['data'] = $collectionlist;
          return $result;
        }
      }
    }

    public function getxiaokao()
    {
      $post = input();
      $exnum = $post['exnum'];
      $list = db('xiaokao')->field('id,school,score,major,exnum')->where('exnum',$exnum)->fetchsql(false)->select();
      foreach ($list as $key => $value) {
        $list[$key]['ranking'] = getranking($exnum,$value['school'],$value['score'],$value['major']) + 1;
      }
      $result['code'] = 200;
      $result['errmsg'] = '查询成功';
      $result['data'] = $list;
      return $result;
    }
    public function getxiaokaoinfo()
    {
      $post = input();
      $major = $post['major'];
      $school = $post['school'];
      $score = $post['score'];
      $exnum = $post['exnum'];
      $list = db('xiaokao')->field('id,name,score,major,exnum')->where('major',$major)->where('school',$school)->where('score','>=',$score)->fetchsql(false)->order('score desc')->select();
      // echo $list;exit;
      foreach ($list as $key => $value) {
        $list[$key]['ranking'] = getotherscore($value['exnum']);
      }
      $result['code'] = 200;
      $result['errmsg'] = '查询成功';
      $result['data'] = $list;
      return $result;
    }

    public function getvip()
    {
      $youshilist = db('youshi')->where('catid',51)->select();
      foreach ($youshilist as $key => $value) {
        $youshilist[$key]['thumb'] = 'https://'.$_SERVER['HTTP_HOST'].__PUBLIC__.$value['thumb'];
      }
      $list = db('vipcontent')->find(1);
      $xuzhilist = json_decode($list['ktxz']);
      $result['code'] = 200;
      $result['errmsg'] = '查询成功';
      $result['youshi'] = $youshilist;
      $result['xuzhi'] = $xuzhilist;
      $result['scj'] = $list['scj'];
      $result['yhj'] = $list['yhj'];
      return $result;
    }
    public function getbanner()
    {
      $list = db('banner')->field('id,title,url,thumb')->limit(5)->select();
      foreach ($list as $key => $value) {
        $list[$key]['thumb'] = 'https://'.$_SERVER['HTTP_HOST'].__PUBLIC__.$value['thumb'];
        if($value['url']){
          if(preg_match('/^http(s)?:\\/\\/.+/',$value['url'])){
            //  带
            $list[$key]['url'] = '/page/webview/webview?url='.$value['url'];
          }else{

          }
        }
      }

      $result['code'] = 200;
      $result['errmsg'] = '查询成功';
      $result['data'] = $list;
      return $result;
    }

    public function getbar()
    {
      $post = input();
      $id = $post['id'];
      $tkfs = $post['tkfs'];
      // 设置显示 几条
      $totalNum = 8;
      $precount = db('excel')->where('score','>',$tkfs)->order('score asc')->count();
      $nextcount = db('excel')->where('score','<',$tkfs)->order('score asc')->count();
      if($precount < $totalNum/2){
        $prelist = db('excel')->where('score','>',$tkfs)->limit($precount)->order('score asc')->select();
        $nextlist = db('excel')->where('score','<',$tkfs)->limit($totalNum - $precount)->order('score desc')->select();
      }elseif($precount >= $totalNum/2 && $nextcount < $totalNum/2){
        $prelist = db('excel')->where('score','>',$tkfs)->limit($totalNum - $nextcount)->order('score asc')->select();
        $nextlist = db('excel')->where('score','<',$tkfs)->limit($nextcount)->order('score desc')->select();
      }else{
        $prelist = db('excel')->where('score','>',$tkfs)->limit($totalNum/2)->order('score asc')->select();
        $nextlist = db('excel')->where('score','<',$tkfs)->limit($totalNum/2)->order('score desc')->select();
      }

      $list = array_merge(array_column($prelist,'score'),array_column($nextlist,'score'));
      // $list = db('excel')->order('score asc')->select();
      // $list = array_column($list,'score');
      array_push($list,$tkfs);
      sort($list);
      $num = db('excel')->where('score','in',$list)->order('score asc')->select();
      $num = array_column($num,'num');
      foreach ($list as $key => $value) {
        $list[$key] = $value.'分';
      }
      $userinfo = db('member')->find($id);
      if($userinfo){
        $x = $userinfo['tkfs'];
        $y = $userinfo['gkfs'];
        $cjfl = $userinfo['cjfl'];
        $major = $userinfo['major'];
        $list1=db('school')->field('title,zyfs')->where('zyfs','<>','')->where('zyfs','<>','[]')->order('listorder asc,createtime desc')->select();
        foreach ($list1 as $k=>$v){
            if($v['zyfs']!='' && $v['zyfs']!='[]'){
              $fsqk = $this->object_array(json_decode($v['zyfs']));
              foreach ($fsqk as $fskey => $fsvalue) {
                dump($fsvalue);
                if($fsvalue['title'] == $major){
                  $formula = $fsvalue['gongshi'];
                  if($cjfl == 1){
                    // 文 wkzgf wkzdf
                    $range = $fsvalue['wkzdf'].'-'.$fsvalue['wkzgf'];
                  }elseif($cjfl == 2){
                    // 理 lkzgf lkzdf
                    $range = $fsvalue['lkzdf'].'-'.$fsvalue['lkzgf'];
                  }
                }

              }
              echo $v['title']."/".$formula."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$v['zyfs']."</br></br>";
              // $list1[$k]['result'] = $this->getAchievementResult($x,$y,$formula,$range);
              $r = $this->getAchievementResult($x,$y,$formula,$range,$v['title']);
              if($r != 2 && $r != 3){
                unset($list1[$k]);
              }
            }else{
              unset($list1[$k]);
            }
        }
      }else{
        $result['code'] = 401;
        $result['errmsg'] = '用户名不存在!';
        return $result;
      }
      dump($list1);
      if(count($list1)>1){
        $n = count($list1) >= 5?5:count($list1);
        $rand_keys = array_rand($list1,$n);
        // dump($rand_keys);
        $list2 = array();
        foreach ($rand_keys as $key => $value) {
          array_push($list2,$list1[$value]['title']);
        }
      }else{
        $list2 = array($list1[0]['title']);
      }

      $data['name'] = $list;
      $data['value'] = $num;
      $result['code'] = 200;
      $result['errmsg'] = '获取成功';
      $result['data'] = $data;
      $result['data2'] = $list2;
      return $result;
    }

    public function msg()
    {
      $data = input();
      $data['addtime'] = time();
      $res = db('message')->insert($data);
      if($res){
        $result['code'] = 200;
        $result['errmsg'] = '留言成功';
        return $result;
      }else{
        $result['code'] = 400;
        $result['errmsg'] = '留言失败';
        return $result;
      }
    }

    /**
     * [根据分数匹配学校结果]
     * @param  [int] $x       [成绩一]
     * @param  [int] $y       [成绩二]
     * @param  [str] $formula [公式]
     * @param  [str] $range   [成绩范围]
     * @return [str]          [结果]
     */
    public function getAchievementResult($x,$y,$formula,$range,$id)
    {
      if($formula!=""){
        $formula = '$num ='.$formula.';';
        eval($formula);
        $rangearr = explode('-',$range);
        $min = $rangearr[0];
        $max = $rangearr[1];
            // echo($range.'/'.$num);
        if($num>$max){
          //保底
          $result = '3';
        }elseif($num<$min){
          //冲刺
          $result = '1';
        }elseif($num<=$max && $num>=$min){
          //正常
          $result = '2';
        }
        return $result;
      }

    }

    protected function object_array($array)
    {
      if(is_object($array)) {
          $array = (array)$array;
       } if(is_array($array)) {
           foreach($array as $key=>$value) {
               $array[$key] = $this->object_array($value);
               }
       }
       return $array;
    }
}
