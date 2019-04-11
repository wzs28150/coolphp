<?php
namespace app\api\controller;
use cool\Sms;
use app\api\controller\Commonapi;
class Index extends Commonapi
{
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {

    }
    public function getnewscol()
    {
        $newscolist = db('category')->where('catdir', 'News')->where('parentid', '<>', 0)->order('listorder asc')->select();
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $newscolist;
        // return $result;
        return parent::export(200, '获取成功', $newscolist);
        exit;
    }

    public function getregion()
    {
        $post = input();
        $pid = $post['pid'];
        $list = db('region')->where('pid', $pid)->cache(true)->select();
        foreach ($list as $key => $value) {
            $list[$key]['checked'] = false;
        }
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $list;
        // return $result;
        return parent::export(200, '获取成功', $list);
        exit;
    }

    public function getmajor()
    {
        $list = db('tag')->field('id,title')->where('catid', 42)->select();
        $status = db('member_setting')->field('status')->find(1);
        $system = db('system')->field('others')->find(1);
        $uncertainty = unserialize($system['others']);
        $scoreinfo = $uncertainty['scoreinfo'];
        $data['list'] = $list;
        $data['scoreinfo'] = $scoreinfo;
        // $list = array_column($list, 'title');
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $list;
        // $result['status'] = $status['status'];
        // return $result;
        return parent::export(200, '获取成功', $data,  0, 0, 0, 0, $status['status']);
        exit;
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
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $data;
        // return $result;

        return parent::export(200, '获取成功', $data);
        exit;
    }

    public function getcooper()
    {
        $info = db('cooper')->order('createtime desc')->limit(1)->find();
        $data['content'] = $info['content'];
        $data['rgnxzz'] = $info['rgnxzz'];
        $data['rgnxtg'] = $info['rgnxtg'];
        $data['rgnyglxq'] = $info['rgnyglxq'];
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $data;
        // return $result;
        return parent::export(200, '获取成功', $data);
        exit;
    }
    public function doshoucang()
    {
        $post = input();
        $sid = $post['id'];
        $uid = $post['uid'];
        $collectionlist = db('member')->field('collection')->find($uid);
        $collectionlist = $collectionlist['collection'];
        if($collectionlist) {
            $arr = explode(',', $collectionlist);
            if(in_array($sid, $arr)) {
                //已收藏
                $k = array_search($sid, $arr);
                unset($arr[$k]);
                // dump($arr);
                $str = implode(',', $arr);
                $data['collection'] = $str;
                $res = db('member') ->where('id', $uid)->update($data);
                if($res) {
                    // $result['code'] = 200;
                    // $result['errmsg'] = '已取消收藏';
                    // $result['data'] = $str;
                    // return $result;
                    return parent::export(200, '已取消收藏', $str);
                    exit;
                }else{
                    // $result['code'] = 400;
                    // $result['errmsg'] = '取消收藏失败';
                    // $result['data'] = $collectionlist;
                    // return $result;
                    return parent::export(400, '取消收藏失败', $collectionlist);
                    exit;
                }

            }else{
                //未收藏
                $data['collection'] = $collectionlist.','.$sid;
                $res = db('member') ->where('id', $uid)->update($data);
                if($res) {
                    // $result['code'] = 200;
                    // $result['errmsg'] = '收藏成功';
                    // $result['data'] = $collectionlist.','.$sid;
                    // return $result;
                    return parent::export(200, '收藏成功', $sid);
                    exit;
                }else{
                    // $result['code'] = 400;
                    // $result['errmsg'] = '收藏失败';
                    // $result['data'] = $collectionlist;
                    // return $result;
                    return parent::export(400, '收藏失败', $collectionlist);
                    exit;
                }
            }
        }else{
            $data['collection'] = $sid;
            $res = db('member') ->where('id', $uid)->update($data);
            if($res) {
                // $result['code'] = 200;
                // $result['errmsg'] = '收藏成功';
                // $result['data'] = $sid;
                // return $result;
                return parent::export(200, '收藏成功', $sid);
                exit;
            }else{
                // $result['code'] = 400;
                // $result['errmsg'] = '收藏失败';
                // $result['data'] = $collectionlist;
                // return $result;
                return parent::export(400, '收藏失败', $collectionlist);
                exit;
            }
        }
    }

    public function getxiaokao()
    {
        $post = input();
        $exnum = $post['exnum'];
        // $list = db('xiaokao')->alias('a')->join('xk_score b', 'a.exnum = b.exnum and a.school = b.school')->field('a.id,a.school,b.otherscore,a.major,a.exnum')->where('a.exnum', $exnum)->fetchsql(true)->select();
        $list = db('xiaokao')->where('exnum', $exnum)->group('score,arrangement')->order('school desc,arrangement desc,major desc,direction desc,score desc')->fetchSql(false)->select();
        // echo $list; exit;
        foreach ($list as $key => $value) {
            // echo getranking($exnum,$value['school'],$value['score'],$value['major']);
            if(mb_substr($value['arrangement'], 0, 1, 'utf-8') == '本') {
                $list[$key]['type'] = '本';
            }else{
                $list[$key]['type'] = '专';
            }
            $list[$key]['ranking'] = getranking($exnum, $value['school'], $value['score'], $value['major'], $value['arrangement']);
        }
        // $result['code'] = 200;
        // $result['errmsg'] = '查询成功';
        // $result['data'] = $list;
        // return $result;
        return parent::export(200, '查询成功', $list);
        exit;
    }
    public function getxiaokaoinfo()
    {
        $post = input();
        $major = $post['major'];
        $school = $post['school'];
        // $score = $post['score'];
        $exnum = $post['exnum'];
        // $list = db('xiaokao')->alias('a')->join('xk_score b','a.exnum = b.exnum')->field('a.id,a.name,a.score,a.major,a.exnum,b.otherscore as ranking')->where('a.major',$major)->where('a.school',$school)->where('b.otherscore','>=',$score)->fetchsql(false)->order('b.otherscore desc')->select();
        $score = db('xk_score')->where('school', $school)->where('exnum', $exnum)->fetchsql(false)->order('otherscore desc')->cache(true)->find();

        $list = db('xk_score')->field('id,name,major,exnum,otherscore as ranking')->where('school', $school)->where('otherscore', '>=', $score['otherscore'])->where('id', '<>', $score['id'])->fetchsql(false)->order('otherscore desc')->cache(true)->select();
        array_push($list, array('id'=>$score['id'],'name'=>$score['name'],'major'=>$score['major'],'exnum'=>$score['exnum'],'ranking'=>$score['otherscore']));
        // echo $list;exit;
        // foreach ($list as $key => $value) {
        //   $list[$key]['ranking'] = getotherscore($value['exnum']);
        // }
        // $result['code'] = 200;
        // $result['errmsg'] = '查询成功';
        // $result['data'] = $list;
        // return $result;
        return parent::export(200, '查询成功', $list);
        exit;
    }

    public function getvip()
    {
        $youshilist = db('youshi')->where('catid', 51)->select();
        foreach ($youshilist as $key => $value) {
            $youshilist[$key]['thumb'] = 'https://'.$_SERVER['HTTP_HOST'].__PUBLIC__.$value['thumb'];
        }
        $list = db('vipcontent')->find(1);
        $xuzhilist = json_decode($list['ktxz']);
        // $result['code'] = 200;
        // $result['errmsg'] = '查询成功';
        // $result['youshi'] = $youshilist;
        // $result['xuzhi'] = $xuzhilist;
        // $result['scj'] = $list['scj'];
        // $result['yhj'] = $list['yhj'];
        // return $result;
        $data['youshi'] = $youshilist;
        $data['xuzhi'] = $xuzhilist;
        $data['scj'] = $list['scj'];
        $data['yhj'] = $list['yhj'];
        return parent::export(200, '查询成功', $data);
        exit;
    }
    public function getbanner()
    {
        $list = db('banner')->field('id,title,url,thumb')->limit(5)->select();
        foreach ($list as $key => $value) {
            $list[$key]['thumb'] = 'https://'.$_SERVER['HTTP_HOST'].__PUBLIC__.$value['thumb'];
            if($value['url']) {
                if(preg_match('/^http(s)?:\\/\\/.+/', $value['url'])) {
                    //  带
                    $list[$key]['url'] = '/page/webview/webview?url='.$value['url'];
                }else{

                }
            }
        }
        return parent::export(200, '查询成功', $list);
        exit;
    }

    public function getbar()
    {
        $post = input();
        $id = $post['id'];
        $tkfs = $post['tkfs'];
        $userinfo = db('member')->find($id);
        $major = $userinfo['major'];
        // 分数
        // 设置显示 几条
        $totalNum = 8;
        $precount = db('excel')->where('score', '>', $tkfs)->where('major', $major)->order('score asc')->count();
        $nextcount = db('excel')->where('score', '<', $tkfs)->where('major', $major)->order('score asc')->count();
        if($precount < $totalNum/2) {
            $prelist = db('excel')->where('score', '>', $tkfs)->where('major', $major)->limit($precount)->order('score asc')->select();
            $nextlist = db('excel')->where('score', '<', $tkfs)->where('major', $major)->limit($totalNum - $precount)->order('score desc')->select();
        }elseif($precount >= $totalNum/2 && $nextcount < $totalNum/2) {
            $prelist = db('excel')->where('score', '>', $tkfs)->where('major', $major)->limit($totalNum - $nextcount)->order('score asc')->select();
            $nextlist = db('excel')->where('score', '<', $tkfs)->where('major', $major)->limit($nextcount)->order('score desc')->select();
        }else{
            $prelist = db('excel')->where('score', '>', $tkfs)->where('major', $major)->limit($totalNum/2)->order('score asc')->select();
            $nextlist = db('excel')->where('score', '<', $tkfs)->where('major', $major)->limit($totalNum/2)->order('score desc')->select();
        }

        $list = array_merge(array_column($prelist, 'score'), array_column($nextlist, 'score'));
        // $list = db('excel')->order('score asc')->select();
        // $list = array_column($list,'score');
        array_push($list, $tkfs);
        sort($list);
        $num = db('excel')->where('score', 'in', $list)->order('score asc')->select();
        $num = array_column($num, 'num');
        foreach ($list as $key => $value) {
            $list[$key] = $value.'分';
        }
        // 学校
        if(!cache('myschool'.$id)) {
            $x = $userinfo['tkfs'];
            $y = $userinfo['gkfs'];
            $school = cache('school');
            $zyfsarray = array_column($school, 'zyfs');
            $sys = db('system')->find(1);
            $otherstr = $sys['others'];
            $otherarr = unserialize($otherstr);
            $list = array();
            foreach ($zyfsarray as $key => $value) {
                if($value && $value!='[]') {
                        $arr = $this->object_array(json_decode($value));
                    foreach ($arr as $k => $v) {
                        if($v['wkzdf'] && $v['lkzdf'] && $v['gongshi']) {
                             $chongarr = explode('-', $otherarr['chong']);
                             $wenarr = explode('-', $otherarr['wen']);
                             $baoarr = explode('-', $otherarr['bao']);
                             $num = '';
                             $formula = '$num ='.$v['gongshi'].';';
                             $formula = str_replace("%", "/100", $formula);
                             $formula = str_replace("（", "(", $formula);
                             $formula = str_replace("）", ")", $formula);
                             // dump($formula);
                             eval($formula);
                             // echo  $num;
                            if($userinfo['cjfl'] == 1) {
                                // 文科
                                if($num > $v['wkzdf']-$chongarr[1] && $num  < $v['wkzdf']-$chongarr[0]) {
                                      $v['result'] = 1;
                                } elseif($num >= $v['wkzdf']+$wenarr[0] && $num  <= $v['wkzdf']+$wenarr[1]) {
                                    $v['result'] = 2;
                                } elseif($num > $v['wkzdf']+$baoarr[0] && $num  < $v['wkzdf']+$baoarr[1]) {
                                    $v['result'] = 3;
                                }
                            } else {
                                // echo $v['lkzdf']-$chongarr[1];
                                if($num > $v['lkzdf']-$chongarr[1] && $num  < $v['lkzdf']-$chongarr[0]) {
                                    $v['result'] = 1;
                                } elseif($num >= $v['lkzdf']+$wenarr[0] && $num  <= $v['lkzdf']+$wenarr[1]) {
                                    $v['result'] = 2;
                                } elseif($num > $v['lkzdf']+$baoarr[0] && $num  < $v['lkzdf']+$baoarr[1]) {
                                    $v['result'] = 3;
                                }
                            }
                            if($v['result']) {
                                $v['school'] = $school[$key]['school'];
                                $v['title_thumb'] =  $school[$key]['title_thumb'];
                                $v['isjianzhang'] = $school[$key]['isjianzhang'];
                                $v['city'] = $school[$key]['city'];
                                // dump($school[$key]['leibie']);
                                $v['leibie'] = $school[$key]['leibie'];
                                $v['pici'] = $school[$key]['pici'];

                                $v['id'] = $school[$key]['id'];
                                $v['year'] = $school[$key]['year'];
                                // dump($v);
                                array_push($list, $v);
                            }

                        }
                    }
                }
            }
            cache('myschool'.$id, $list, 0);
        }
        $list2 = array_slice(array_column(cache('myschool'.$id), 'school'), 0, 5);

        $major = getmajor1($userinfo['major']);
        // $major = '美术';
        if($major === '美术') {
            $list3 = db('major')->field('major')->where('max', '>=', $tkfs)->where('min', '<=', $tkfs)->where('direction', $major)->fetchsql(false)->find();
            $list3 = explode('，', $list3['major']);
            shuffle($list3);
        }else{
            $list3 = db('major')->field('major')->where('direction', $major)->fetchsql(false)->orderRaw('rand()')->find();
            $list3 = explode('，', $list3['major']);
            shuffle($list3);
            // dump(shuffle($list3));
            // dump($list3);
        }

        $data['name'] = $list;
        $data['value'] = $num;

        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        $result['data'] = $data;
        $result['data2'] = $list2;
        $result['data3'] = $list3;
        // return $result;

        return parent::export(200, '获取成功', $result);
        exit;
    }

    public function msg()
    {
        $data = input();
        $data['addtime'] = time();
        $res = db('message')->insert($data);
        if($res) {
            // $result['code'] = 200;
            // $result['errmsg'] = '留言成功';
            // return $result;
            return parent::export(200, '留言成功');
            exit;
        }else{
            // $result['code'] = 400;
            // $result['errmsg'] = '留言失败';
            // return $result;
            return parent::export(400, '留言失败');
            exit;
        }
    }

    /**
     * [根据分数匹配学校结果]
     *
     * @param  [int] $x       [成绩一]
     * @param  [int] $y       [成绩二]
     * @param  [str] $formula [公式]
     * @param  [str] $range   [成绩范围]
     * @return [str]          [结果]
     */
    public function getAchievementResult($x,$y,$formula,$range,$id)
    {
        if($formula!="") {

            $formula = '$num ='.$formula.';';
            $formula = str_replace("%", "/100", $formula);
            try{
                 eval($formula);
                 $rangearr = explode('-', $range);
                     $min = $rangearr[0];
                     $max = $rangearr[1];
                   // echo($range.'/'.$num);
                if($num>$max) {
                    //保底
                    $result = '3';
                }elseif($num<$min) {
                    //冲刺
                    $result = '1';
                }elseif($num<=$max && $num>=$min) {
                    //正常
                    $result = '2';
                }
                return $result;
            } catch(Exception $e){
                return 0;
            }

            // dump($num);exit;

        }else{
            return 0;
        }

    }

    public function getmsg()
    {
        $sender = input('phone');
        //检查是否邮箱格式
        if (!is_mobile_phone($sender)) {
            return json(['code' => -1, 'msg' => '测试手机号码格式有误']);
        }
        //短信内容(【签名】+短信内容)，系统提供的测试签名和内容，如需要发送自己的短信内容请在启瑞云平台申请签名和模板
        $sms = new Sms();
        $res= $sms->send($sender);
        if($res) {
            session('smsCode', $res);
            // $result['code'] = 200;
            // $result['errmsg'] = '请求成功';
            // return $result;

            return parent::export(200, '请求成功');
            exit;
        }else{
            // $result['code'] = 400;
            // $result['errmsg'] = '请求失败';
            // return $result;

            return parent::export(400, '请求失败');
            exit;
        }


    }

}
