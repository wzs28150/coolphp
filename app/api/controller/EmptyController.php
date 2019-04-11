<?php
namespace app\api\controller;

use think\Db;
use think\Request;
use cool\Form;
use app\api\controller\Commonapi;

class EmptyController extends Commonapi
{
    protected $dao;
    protected $fields;
    public function _initialize()
    {
        parent::_initialize();
        $this->dao = db(DBNAME);
    }
    public function index()
    {
        header('Access-Control-Allow-Origin:*');
        if (DBNAME=='page') {
            $info = $this->dao->where('id', input('catId'))->find();
            $this->assign('info', $info);
            if ($info['template']) {
                $template = $info['template'];
            } else {
                $info['template'] = db('category')->where('id', $info['id'])->value('template_show');
                if ($info['template']) {
                    $template = $info['template'];
                } else {
                    $template = DBNAME.'_show';
                }
            }
            // getbanner
            $bannerid = db('category')->field('id')->where('parentid', input('catId'))->order('id asc')->find();
            $bgImg = db('erbanner')->field('thumb as url,title,description,color,position')->where('catid', $bannerid['id'])->find();
            $data['code'] = 200;
            $data['bgImg']['url'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$bgImg['url'];
            $data['bgImg']['color'] = $bgImg['color'];
            $data['bgImg']['position'] = $bgImg['position'];
            $data['pageInfo']['title'] = $bgImg['title'];
            $data['pageInfo']['description'] = $bgImg['description'];

            return parent::export(200, '请求成功', $data);
            exit;
        // return $this->fetch($template);
        } else {
            $map['catid'] = array(
                'like',
                '%' . input('catId'). '%'
            );
            $map['status'] = 1;
            //文章列表
            $list=$this->dao->alias('a')
                ->join(config('database.prefix').'category c', 'a.catid = c.id', 'left')
                ->where($map)
                ->field('a.*,c.catdir')
                ->order('listorder asc,createtime desc')->cache(true)
                ->paginate($this->pagesize);
            // echo $this->dao->getLastSql();
            $page = $list->render();
            $list = $list->toArray();
            foreach ($list['data'] as $k=>$v) {
                $list['data'][$k]['controller'] = $v['catdir'];
                $list_style = explode(';', $v['title_style']);
                $list['data'][$k]['catid'] = input('catId');
                $list['data'][$k]['title_color'] =$list_style[0];
                $list['data'][$k]['title_weight'] =$list_style[1];
                $title_thumb = $v['thumb'];
                $list['data'][$k]['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:'';
                $list['data'][$k]['addtime'] = date('Y-m-d', $v['createtime']);
                if ($title_thumb) {
                    $list['data'][$k]['title_thumb'] = __PUBLIC__.$title_thumb;
                } else {
                    $pattern="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";
                    $content = $v['content'];
                    preg_match_all($pattern, $content, $matchContent);
                    if (isset($matchContent[1][0])) {
                        $list['data'][$k]['title_thumb']=$matchContent[1][0];
                    } else {
                        $list['data'][$k]['title_thumb']="";
                    }
                }
                $list['data'][$k]['title_thumb'] = 'https://'.$_SERVER['HTTP_HOST'].$list['data'][$k]['title_thumb'];
                unset($list['data'][$k]['content']);
            }
            // $result['code'] = 200;
            // $result['errmsg'] = '获取成功';
            // $result['data'] = $list['data'];
            // $result['current_page'] = $list['current_page'];
            // $result['total'] = $list['total'];
            // $result['last_page'] = $list['last_page'];
            // $result['per_page'] = $list['per_page'];
            // return $result;
            // return parent::export(200,'查询成功',$list);
            // return parent::export(200, $msg = '获取成功', $list['data'], $list['current_page'], $last_page = $list['last_page'], $per_page = $list['per_page'], $total = $list['total']);
            return parent::export(200, '请求成功', $list['data']);
            exit;
        }
    }
    public function school()
    {
        if (!cache('school')) {
            $school = db('school')->field('id,title,thumb,pici,leibie,city,isjianzhang,zyfs,istk,year')->where('status', 1)->order('listorder asc,id desc')->select();
            foreach ($school as $key => $value) {
                if ($value['thumb']) {
                    $school[$key]['title_thumb'] = __PUBLIC__.$value['thumb'];
                } else {
                    $pattern="/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";
                    $content = $value['content'];
                    preg_match_all($pattern, $content, $matchContent);
                    if (isset($matchContent[1][0])) {
                        $school[$key]['title_thumb']=$matchContent[1][0];
                    } else {
                        $school[$key]['title_thumb']="";
                    }
                }
                $school[$key]['school'] = $value['title'];
                $school[$key]['title_thumb'] =  'https://'.$_SERVER['HTTP_HOST'].$school[$key]['title_thumb'];

                $school[$key]['city'] = explode(',', $value['city']);
                $school[$key]['city'] = toCity($school[$key]['city'][1]);

                if ($value['pici']) {
                    $pici = explode(',', $value['pici']);
                    $piciarr = array();
                    foreach ($pici as $k => $v) {
                        $piciarr[$k] = toLeibie($v);
                    }
                    $school[$key]['pici'] = $piciarr;
                }

                if ($value['leibie']) {
                    $leibie = explode(',', $value['leibie']);
                    $leibiearr = array();
                    foreach ($leibie as $k => $v) {
                        $leibiearr[$k] = toLeibie($v);
                    }
                    $school[$key]['leibie'] = $leibiearr;
                }
                // if($school[$key]['leibie']){
                      //   $v['leibie'][$key] = toLeibie($school[$key]['leibie']);
                      // }
            }
            cache('school', $school, 0);
        }
        //文章列表
        $school = cache('school');
        $schoolresult = array();
        // dump($school);
        if (input('leibie')) {
            $leibie = toLeibie(input('leibie'));
        }
        if (input('city')) {
            $cityarr = explode(',', input('city'));
            $city = toCity($cityarr[1]);
        }
        if (input('pici')) {
            $pici = toLeibie(input('pici'));
        }
        if (input('keywords')) {
            $keywords = input('keywords');
            $school = arrList($school, $keywords, array('school'));
        }
        if (input('uid')) {
            $info = db('member')->find(input('uid'));
            $collection = $info['collection'];
            $collection = explode(',', $collection);
            $school1 = array();
            // dump($collection);
        }
        // echo $leibie;
        // echo $city;
        // echo $pici;
        if ($pici || $city || $leibie || $collection) {
            foreach ($school as $key => $value) {
                if ($value['city'] == $city && $city && $value['city']) {
                    array_push($schoolresult, $school[$key]);
                }
                if ($value['pici']) {
                    if (in_array($pici, $value['pici']) && $pici && $value['pici']) {
                        array_push($schoolresult, $school[$key]);
                    }
                }
                if ($value['leibie']) {
                    if (in_array($leibie, $value['leibie']) && $leibie && $value['leibie']) {
                        array_push($schoolresult, $school[$key]);
                    }
                }

                if ($collection) {
                    foreach ($collection as $k => $v) {
                        if ($value['id'] == $v) {
                            // echo $value['id'] .'=='.$v.'<br/>';
                            array_push($school1, $school[$key]);
                            unset($school[$key]);
                        } else {
                        }
                    }
                }
            }
            // dump($school1);
            if ($collection) {
                $schoolresult = $school1;
            }
        } else {
            $schoolresult = $school;
        }

        // dump($school);
        $page=input('page')?(int)input('page'):'0';
        $pre_page = $page==0?0:($page-1);
        $size=10;
        $pnum = ceil(count($schoolresult) / $size);
        // dump(cache('school'));exit;
        $newArray = array_slice($schoolresult, ($page-1)*$size, $size);
        // dump($list['data']);
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $list['data'];
        // $result['current_page'] = $list['current_page'];
        // $result['total'] = $list['total'];
        // $result['last_page'] = $list['last_page'];
        // $result['per_page'] = $list['per_page'];
        // return $result;
        return parent::export(200, $msg = '获取成功', $newArray, $page, $pnum, $pre_page, $pnum);
        exit;
    }
    public function guide()
    {
        // $map['a.zyfs']  = ['<>', '[]'];

        // dump($map);
        $uid = input('uid');
        // dump($uid);
        $userinfo = db('member')->find($uid);
        if ($userinfo) {
            // if(!cache('myschool'.$uid)){
            if (1==1) {
                $x = $userinfo['tkfs'];
                $y = $userinfo['gkfs'];
                $school = cache('school');
                // dump($school);
                $zyfsarray = array_column($school, 'zyfs');
                $sys = db('system')->find(1);
                $otherstr = $sys['others'];
                $otherarr = unserialize($otherstr);
                $list = array();
                foreach ($zyfsarray as $key => $value) {
                    if ($value && $value!='[]') {
                        $arr = $this->object_array(json_decode($value));
                        foreach ($arr as $k => $v) {
                            if ($v['wkzdf'] && $v['lkzdf'] && $v['gongshi']) {
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
                                // echo  $num.'----';
                                if ($userinfo['cjfl'] == 1) {
                                    // 文科
                                    if ($num > $v['wkzdf']-$chongarr[1] && $num  < $v['wkzdf']-$chongarr[0]) {
                                        $v['result'] = 1;
                                    } elseif ($num >= $v['wkzdf']+$wenarr[0] && $num  <= $v['wkzdf']+$wenarr[1]) {
                                        $v['result'] = 2;
                                    } elseif ($num > $v['wkzdf']+$baoarr[0] && $num  < $v['wkzdf']+$baoarr[1]) {
                                        $v['result'] = 3;
                                    }
                                } else {
                                    // echo $v['lkzdf']-$chongarr[1];
                                    if ($num > $v['lkzdf']-$chongarr[1] && $num  < $v['lkzdf']-$chongarr[0]) {
                                        $v['result'] = 1;
                                    } elseif ($num >= $v['lkzdf']+$wenarr[0] && $num  <= $v['lkzdf']+$wenarr[1]) {
                                        $v['result'] = 2;
                                    } elseif ($num > $v['lkzdf']+$baoarr[0] && $num  < $v['lkzdf']+$baoarr[1]) {
                                        $v['result'] = 3;
                                    }
                                }
                                if ($v['result']) {
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

                // $array = array_filter($list, "filterDistance");
                // dump($array);

                cache('myschool'.$uid, $list, 0);
            }
            $data = cache('myschool'.$uid);
            $schoolresult = array();
            if (input('leibie')) {
                $leibie = toLeibie(input('leibie'));
            }
            if (input('city')) {
                $cityarr = explode(',', input('city'));
                $city = toCity($cityarr[1]);
            }
            if (input('pici')) {
                $pici = toLeibie(input('pici'));
            }
            // echo $leibie;
            // echo $city;
            // echo $pici;
            if ($pici || $city || $leibie) {
                foreach ($data as $key => $value) {
                    if ($value['city'] == $city && $city && $value['city']) {
                        array_push($schoolresult, $data[$key]);
                    }
                    if ($value['pici']) {
                        if (in_array($pici, $value['pici']) && $pici && $value['pici']) {
                            array_push($schoolresult, $data[$key]);
                        }
                    }
                    if ($value['leibie']) {
                        if (in_array($leibie, $value['leibie']) && $leibie && $value['leibie']) {
                            array_push($schoolresult, $data[$key]);
                        }
                    }
                }
            } else {
                $schoolresult = $data;
            }
            // dump($data);
            //
            $page=input('page')?(int)input('page'):'0';
            $pre_page = $page==0?0:($page-1);
            $size=10;
            if ($data) {
                $pnum = ceil(count($schoolresult) / $size);
                // dump(cache('school'));exit;
                $newArray = array_slice($schoolresult, ($page-1)*$size, $size);
            } else {
                $newArray = $data;
            }

            // dump($data);
            return parent::export(200, $msg = '获取成功', $newArray, 0, 0, 0, count($pnum));
            exit;
        } else {
            // $result['code'] = 401;
            // $result['errmsg'] = '用户名不存在!';
            // return $result;
            return parent::export(401, $msg = '用户名不存在!');
            exit;
        }

        //文章列表

        //return $result;
    }

    public function filterDistance($arr)
    {
        return($arr['result'] = 2);
    }
    public function datainfo()
    {
        $this->dao->where('id', input('id'))->setInc('hits');
        $info = $this->dao->where('id', input('id'))->cache(true)->find();
        $info['pic'] = $info['pic']?__PUBLIC__.$info['pic']:__HOME__."/images/sample-images/blog-post".rand(1, 3).".jpg";
        $title_style = explode(';', $info['title_style']);
        $info['title_color'] = $title_style[0];
        $info['title_weight'] = $title_style[1];
        $title_thumb = $info['thumb'];
        $info['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:__HOME__.'/images/sample-images/blog-post'.rand(1, 3).'.jpg';
        $this->assign('info', $info);
        return view('data/datainfo');
    }
    public function info()
    {
        //内容信息
        $this->dao->where('id', input('id'))->setInc('hits');
        $info = $this->dao->where('id', input('id'))->cache(true)->find();
        $info['pic'] = $info['pic']?__PUBLIC__.$info['pic']:"__HOME__/images/sample-images/blog-post".rand(1, 3).".jpg";

        $title_style = explode(';', $info['title_style']);
        $info['title_color'] = $title_style[0];
        $info['title_weight'] = $title_style[1];
        $info['addtime'] = date('Y-m-d', $info['createtime']);
        $title_thumb = $info['thumb'];
        $info['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:'__HOME__/images/sample-images/blog-post'.rand(1, 3).'.jpg';
        $info['title_thumb'] ='https://'.$_SERVER['HTTP_HOST'].$info['title_thumb'];


        // $info['content'] = $string = str_replace(array("<h4>","","</h4>"),array("<div>","","</div>"),$info['content']);
        $info['content'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['content']);
        $info['content'] = str_replace('<img', '<img bindtap="imgYu" style="width:100%;height:auto;"', $info['content']);

        $info['content'] = str_replace('section', 'div', $info['content']);
        if (DBNAME == school) {
            $info['city'] = explode(',', $info['city']);
            $info['city'] = toCity($info['city'][1]);
            if ($info['pici']) {
                $info['pici'] = explode(',', rtrim($info['pici'], ','));
                if (is_array($info['pici'])) {
                    // dump($v['leibie']);
                    foreach ($info['pici'] as $key => $value) {
                        $info['pici'][$key] = toLeibie($value);
                    }
                }
            }

            if ($info['leibie']) {
                $info['leibie'] = explode(',', rtrim($info['leibie'], ','));
                if (is_array($info['leibie'])) {
                    // dump($v['leibie']);
                    foreach ($info['leibie'] as $key => $value) {
                        if ($key<3) {
                            $info['leibie'][$key] = toLeibie($value);
                        } else {
                            unset($info['leibie'][$key]);
                        }
                    }
                }
            }
        }
        // dump($info);
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $info;
        // // dump($info['content']);
        // return $result;
        return parent::export(200, $msg = '获取成功', $info);
        exit;
    }

    public function inf()
    {
        //内容信息
        $this->dao->where('id', input('id'))->setInc('hits');
        $info = $this->dao->where('id', input('id'))->cache(true)->find();
        $info['pic'] = $info['pic']?__PUBLIC__.$info['pic']:"__HOME__/images/sample-images/blog-post".rand(1, 3).".jpg";

        $title_style = explode(';', $info['title_style']);
        $info['title_color'] = $title_style[0];
        $info['title_weight'] = $title_style[1];
        $info['addtime'] = date('Y-m-d', $info['createtime']);
        $title_thumb = $info['thumb'];
        $info['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:'__HOME__/images/sample-images/blog-post'.rand(1, 3).'.jpg';
        $info['title_thumb'] ='https://'.$_SERVER['HTTP_HOST'].$info['title_thumb'];


        // $info['content'] = $string = str_replace(array("<h4>","","</h4>"),array("<div>","","</div>"),$info['content']);
        $info['content'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['content']);
        $info['content'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['content']);
        $info['content'] = str_replace('section', 'div', $info['content']);
        if (DBNAME == school) {
            $info['city'] = explode(',', $info['city']);
            $info['city'] = toCity($info['city'][1]);
            if ($info['pici']) {
                $info['pici'] = explode(',', rtrim($info['pici'], ','));
                if (is_array($info['pici'])) {
                    // dump($v['leibie']);
                    foreach ($info['pici'] as $key => $value) {
                        $info['pici'][$key] = toLeibie($value);
                    }
                }
            }

            if ($info['leibie']) {
                $info['leibie'] = explode(',', rtrim($info['leibie'], ','));
                if (is_array($info['leibie'])) {
                    // dump($v['leibie']);
                    foreach ($info['leibie'] as $key => $value) {
                        if ($key<3) {
                            $info['leibie'][$key] = toLeibie($value);
                        } else {
                            unset($info['leibie'][$key]);
                        }
                    }
                }
            }
        }
        // dump($info);
        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $info;
        // // dump($info['content']);
        // return $result;
        return parent::export(200, $msg = '获取成功', $info);
        exit;
    }
    public function details()
    {
        $post = input();
        $id = $post['id'];
        $fields = $post['fields'];
        $info = db('school')->field($fields)->cache(true)->find($id);

        $info['zsjz'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['zsjz']);
        $info['zsjz'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['zsjz']);
        $info['zsjz'] = str_replace('section', 'div', $info['zsjz']);

        $info['ksap'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['ksap']);
        $info['ksap'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['ksap']);
        $info['ksap'] = str_replace('section', 'div', $info['ksap']);

        $info['bkzd'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['bkzd']);
        $info['bkzd'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['bkzd']);
        $info['bkzd'] = str_replace('section', 'div', $info['bkzd']);

        $info['content'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['content']);
        $info['content'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['content']);
        $info['content'] = str_replace('section', 'div', $info['content']);

        $info['ljkt'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['ljkt']);
        $info['ljkt'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['ljkt']);
        $info['ljkt'] = str_replace('section', 'div', $info['ljkt']);

        $info['fsxyz'] = str_replace('/public/uploads/ueditor/image/', 'https://'.$_SERVER['HTTP_HOST'].'/public/uploads/ueditor/image/', $info['fsxyz']);
        $info['fsxyz'] = str_replace('<img', '<img style="width:100%;height:auto;"', $info['fsxyz']);
        $info['fsxyz'] = str_replace('section', 'div', $info['fsxyz']);

        // $result['code'] = 200;
        // $result['errmsg'] = '获取成功';
        // $result['data'] = $info[$fields];
        // return $result;
        return parent::export(200, $msg = '获取成功', $info[$fields]);
        exit;
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
    public function getAchievementResult($x, $y, $formula, $range)
    {
        $formula = '$num ='.$formula.';';
        $formula = str_replace("%", "/100", $formula);
        // dump($formula);
        eval($formula);
        $rangearr = explode('-', $range);
        $min = $rangearr[0];
        $max = $rangearr[1];
        // echo($range.'/'.$num);
        if ($num>$max) {
            //保底
            $result = '3';
        } elseif ($num<$min) {
            //冲刺
            $result = '1';
        } else {
            //正常
            $result = '2';
        }
        return $result;
    }
}
