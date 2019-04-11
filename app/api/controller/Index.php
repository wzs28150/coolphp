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
        $data = array();
        // 第一个
        $data[0]['id'] = 0;
        $data[0]['islighter'] = true;
        $data[0]['bg'] = '';
        $list0 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path')->where('catid', 59)->select();
        foreach ($list0 as $key => $value) {
            $data[0]['children']['list'][$key]['id'] = $value['id'];
            if ($value['islighter'] == 'true') {
                $data[0]['children']['list'][$key]['islighter'] = true;
            } else {
                $data[0]['children']['list'][$key]['islighter'] = false;
            }
            $data[0]['children']['list'][$key]['title'] = $value['title'];
            $data[0]['children']['list'][$key]['des'] = $value['des'];
            $data[0]['children']['list'][$key]['algin'] = 'center';
            $data[0]['children']['list'][$key]['button'] = array('title' => '了解详细', 'path'=>$value['path'] );
            $data[0]['children']['list'][$key]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$value['bg'];
        }
        $data[0]['children']['hasCtrl'] = true;
        // 第二个
        $list1 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path,subtitle')->where('catid', 60)->select();
        $data[1]['id'] = 1;
        if ($list1[0]['islighter'] == 'true') {
            $data[1]['islighter'] = true;
        } else {
            $data[1]['islighter'] = false;
        }
        $data[1]['title'] = $list1[0]['title'];
        $data[1]['des'] = $list1[0]['des'];
        $data[1]['subtitle'] = $list1[0]['subtitle'];
        $data[1]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$list1[0]['bg'];
        $data[1]['button'] = array('title' => '了解更多', 'path'=>$list1[0]['path'],'icon'=> array('far', 'lightbulb'));
        // 第三个
        $list2 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path,subtitle')->where('catid', 61)->select();
        $data[2]['id'] = 2;
        if ($list2[0]['islighter'] == 'true') {
            $data[2]['islighter'] = true;
        } else {
            $data[2]['islighter'] = false;
        }
        $data[2]['title'] = $list2[0]['title'];
        $data[2]['des'] = $list2[0]['des'];
        $data[2]['subtitle'] = $list2[0]['subtitle'];
        $data[2]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$list2[0]['bg'];
        $data[2]['button'] = array('title' => '了解更多', 'path'=>$list2[0]['path'],'icon'=> array('far', 'lightbulb'));
        $data[2]['video'] = '../../static/video/index_bg3.mp4';
        $data[2]['hasTitleLine'] = true;
        // 第四个
        $data[3]['id'] = 3;
        $data[3]['islighter'] = false;
        $data[3]['bg'] = '';
        $list3 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path')->where('catid', 62)->select();
        foreach ($list3 as $key => $value) {
            $data[3]['children']['list'][$key]['id'] = $value['id'];
            if ($value['islighter'] == 'true') {
                $data[3]['children']['list'][$key]['islighter'] = true;
            } else {
                $data[3]['children']['list'][$key]['islighter'] = false;
            }
            $data[3]['children']['list'][$key]['title'] = $value['title'];
            $data[3]['children']['list'][$key]['des'] = $value['des'];
            $data[3]['children']['list'][$key]['algin'] = 'left';
            $data[3]['children']['list'][$key]['button'] = array('title' => '了解详细', 'path'=>$value['path'] );
            $data[3]['children']['list'][$key]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$value['bg'];
        }
        $data[3]['children']['hasCtrl'] = true;
        // 第五个
        $list4 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path,subtitle')->where('catid', 63)->select();
        $data[4]['id'] = 4;
        if ($list4[0]['islighter'] == 'true') {
            $data[4]['islighter'] = true;
        } else {
            $data[4]['islighter'] = false;
        }
        $data[4]['title'] = $list4[0]['title'];
        $data[4]['des'] = $list4[0]['des'];
        $data[4]['subtitle'] = $list4[0]['subtitle'];
        $data[4]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$list4[0]['bg'];
        $data[4]['button'] = array('title' => '了解更多', 'path'=>$list4[0]['path'],'icon'=> array('far', 'lightbulb'));
        $data[4]['hasTitleLine'] = true;
        // 第六个
        $list5 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path,subtitle')->where('catid', 64)->select();
        $data[5]['id'] = 5;
        if ($list5[0]['islighter'] == 'true') {
            $data[5]['islighter'] = true;
        } else {
            $data[5]['islighter'] = false;
        }
        $data[5]['title'] = $list5[0]['title'];
        $data[5]['des'] = $list5[0]['des'];
        $data[5]['subtitle'] = $list5[0]['subtitle'];
        $data[5]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$list5[0]['bg'];
        $data[5]['button'] = array('title' => '了解更多', 'path'=>$list5[0]['path'],'icon'=> array('far', 'lightbulb'));
        $data[5]['hasTitleLine'] = true;
        // 第七个
        $list6 = db('indexpage')->field('id,islighter,title,des,thumb as bg,path,subtitle')->where('catid', 65)->select();
        $data[6]['id'] = 6;
        if ($list6[0]['islighter'] == 'true') {
            $data[6]['islighter'] = true;
        } else {
            $data[6]['islighter'] = false;
        }
        $data[6]['title'] = $list6[0]['title'];
        $data[6]['des'] = $list6[0]['des'];
        $data[6]['subtitle'] = $list6[0]['subtitle'];
        $data[6]['bg'] = 'http://'.$_SERVER['HTTP_HOST'].'/public/'.$list6[0]['bg'];
        $data[6]['button'] = array('title' => '联系我们', 'path'=>$list6[0]['path'],'icon'=> array('far', 'lightbulb'));
        $data[6]['hasTitleLine'] = true;
        $sys = F('System');
        $uncertainty = unserialize($sys['others']);
        foreach ($uncertainty as $key => $value) {
            $sys[$key] = $value;
        }
        $data[6]['contactInfo'] = array('tel' => $sys['tel'], 'code' => $sys['code'],'email' => $sys['email'],'address' => $sys['address']);
        return parent::export(200, '请求成功', $data);
        exit;
    }
    public function config()
    {
        $sys = F('System');
        $uncertainty = unserialize($sys['others']);
        foreach ($uncertainty as $key => $value) {
            $sys[$key] = $value;
        }
        $sys['qrcode'] = 'http://'.$_SERVER['HTTP_HOST'].'/public'.$sys['erw'];
        $sys['menu'][0] = array('catname' => '网站首页', 'path' => '/' );
        $sys['menu'][1] = array('catname' => '关于我们', 'path' => '/About' );
        $sys['menu'][2] = array('catname' => '飞行体验', 'path' => '/Fly' );
        $sys['menu'][3] = array('catname' => 'VR课堂', 'path' => '/Vr' );
        $sys['menu'][4] = array('catname' => '海外视野', 'path' => '/Overseas' );
        $sys['menu'][5] = array('catname' => '退伍士兵', 'path' => '/Soldiers' );
        $sys['menu'][6] = array('catname' => '联系我们', 'path' => '/Contact' );
        unset($sys['others']);
        return parent::export(200, '请求成功', $sys);
        exit;
    }
}
