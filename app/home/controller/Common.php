<?php
namespace app\home\controller;

use think\Input;
use think\Db;
use cool\Leftnav;
use think\Request;
use think\Controller;

date_default_timezone_set('PRC');
class Common extends Controller
{
    protected $pagesize;
    //设置北京时间为默认时区
    public function _initialize()
    {
        if (!cache('sys')) {
            $sys =  db('system')->find(1);
            if ($sys['others']) {
                $others = unserialize($sys['others']);
                $sys = array_merge($sys, $others);
            }

            cache('sys', $sys, 3600);
        }
        // dump(cache('sys'));
        $this->assign('sys', cache('sys'));
        //获取控制方法
        $request = Request::instance();
        $action = $request->action();
        $controller = $request->controller();
        // dump(strtolower($controller));
        //
        $this->assign('action', ($action));
        $this->assign('controller', strtolower($controller));
        define('MODULE_NAME', strtolower($controller));
        define('ACTION_NAME', strtolower($action));

        //导航

        $category = db('category');
        $thisCat = $category->where('id', input('catId'))->find();
        $this->assign('title', $thisCat['title']);
        $this->assign('keywords', $thisCat['keywords']);
        $this->assign('description', $thisCat['description']);
        define('DBNAME', strtolower($thisCat['module']));
        $this->pagesize = $thisCat['pagesize']>0 ? $thisCat['pagesize'] : '';
        // 获取缓存数据
        $cate = cache('cate');
        if (!$cate) {
            // $tree = $category->field('id,parentid,catname,catdir,ismenu,arrparentid')->where(['ismenu'=>1])->order('listorder')->select();
            $column_one = $category->where(['parentid'=>0,'ismenu'=>1])->order('listorder')->select();
            $column_two = $category->where(['ismenu'=>1])->order('listorder')->select();
            $tree = new Leftnav();
            $cate = $tree->index_top($column_one, $column_two);
            // $cate = subtree2($tree);
            cache('cate', $cate, 3600);
        }
        // dump($cate);
        $this->assign('category', $cate);
        //广告
        $adList = cache('adList');
        if (!$adList) {
            $adList = db('ad')->where(['type_id'=>1,'open'=>1])->order('sort asc')->limit('4')->select();
            cache('adList', $adList, 3600);
        }
        $this->assign('adList', $adList);

        $adList2 = cache('adList2');
        if (!$adList2) {
            $adList2 = db('ad')->where(['type_id'=>10,'open'=>1])->order('sort asc')->limit('4')->select();
            cache('adList2', $adList2, 3600);
        }
        $this->assign('adList', $adList);
        $this->assign('adList2', $adList2);
        //友情链接
        $linkList = cache('linkList');
        if (!$linkList) {
            $linkList = db('link')->where('open', 1)->order('sort asc')->select();
            cache('linkList', $linkList, 3600);
        }
        $this->assign('linkList', $linkList);
        $this->assign('module', MODULE_NAME);
    }
    public function _empty()
    {
        return $this->error('空操作，返回上次访问页面中__HOME__.');
    }
}
