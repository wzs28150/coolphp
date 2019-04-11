<?php
namespace app\home\controller;

use think\Db;
use think\Request;
use cool\Form;
class EmptyController extends Common
{
    protected $dao, $fields;
    public function _initialize()
    {
        parent::_initialize();
        $this->dao = db(DBNAME);
        $this->assign('dbname', DBNAME);
        $this->assign('catId', input('catId'));
        $this->assign('catname', getcatname(input('catId')));
        $this->assign('parentId', getcatname(input('catId'), 'parentid'));
        $this->assign('arrparentId', getcatname(getcatname(input('catId'), 'parentid'), 'arrparentid'));
    }
    public function index()
    {
        if (DBNAME == 'page') {
            //这个dao相当于调用数据表的名字
            $rightNavInfo = db('category')->find(input('catId'));
            if($rightNavInfo['arrparentid'] != '0') {
                $navlist = db('category')->field('id,catname,catdir,child,parentid,url')->where('parentid', $rightNavInfo['parentid'])->where('ismenu', 1)->order('listorder,id')->select();
                $this->assign('navlist', $navlist);
            }
            $info = $this->dao->where('id', input('catId'))->find();
            $this->assign('info', $info);

            // $NavList = db('category')->field('id,catname,catdir,child,parentid,url')->where('parentid',input('catId'))->where('ismenu',1)->order('listorder,id')->select();
            // dump($NavList);
            if ($info['template']) {
                $template = $info['template'];
            } else {
                $info['template'] = db('category')->where('id', $info['id'])->value('template_show');
                if ($info['template']) {
                    $template = $info['template'];
                } else {
                    $template = DBNAME . '_show';
                }
            }
            return $this->fetch($template);
        } else {
            $rightNavInfo = db('category')->find(input('catId'));
            if($rightNavInfo['parentid'] != 0) {
                $navlist = db('category')->field('id,catname,catdir,child,parentid,url')->where('parentid', $rightNavInfo['parentid'])->where('ismenu', 1)->order('listorder,id')->select();
                $this->assign('navlist', $navlist);
            }
            // dump($navlist);
            $map['catid'] = input('catId');
            $list = $this->dao->alias('a')->join(config('database.prefix') . 'category c', 'a.catid = c.id', 'left')->where($map)->field('a.*,c.catdir,c.catname')->order('listorder asc,createtime desc')->fetchsql(false)->paginate($this->pagesize);
            // dump($list);
            // 获取分页显示
            $page = $list->render();
            $list = $list->toArray();
            foreach ($list['data'] as $k => $v) {
                $list['data'][$k]['controller'] = $v['catdir'];
                $list_style = explode(';', $v['title_style']);
                $list['data'][$k]['title_color'] = $list_style[0];
                $list['data'][$k]['title_weight'] = $list_style[1];
                $title_thumb = $v['thumb'];
                $list['data'][$k]['title_thumb'] = $title_thumb ? __PUBLIC__ . $title_thumb : __HOME__ . '/images/portfolio-thumb/p' . ($k + 1) . '.jpg';
            }
            $this->assign('list', $list['data']);
            $this->assign('page', $page);
            // dump($list);
            $cattemplate = db('category')->where('id', input('catId'))->value('template_list');
            $template = $cattemplate ? $cattemplate : DBNAME . '_list';
            return $this->fetch($template);
        }
    }
    public function info()
    {
        //内容信息
        $this->dao->where('id', input('id'))->setInc('hits');
        $info = $this->dao->where('id', input('id'))->find();
        $info['pic'] = $info['pic']?__PUBLIC__.$info['pic']:"__HOME__/images/sample-images/blog-post".rand(1, 3).".jpg";
        $title_style = explode(';', $info['title_style']);
        $info['title_color'] = $title_style[0];
        $info['title_weight'] = $title_style[1];
        $title_thumb = $info['thumb'];
        $info['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:'__HOME__/images/sample-images/blog-post'.rand(1, 3).'.jpg';
        $this->assign('info', $info);

        $rightNavInfo = db('category')->find(input('catId'));
        if($rightNavInfo['parentid'] != 0) {
            $navlist = db('category')->field('id,catname,catdir,child,parentid,url')->where('parentid', $rightNavInfo['parentid'])->where('ismenu', 1)->order('listorder,id')->select();
            $this->assign('navlist', $navlist);
        }
        //文章内容页模板
        if($info['template']) {
            $template = $info['template'];
        }else{
            $cattemplate = db('category')->where('id', $info['catid'])->value('template_show');
            if($cattemplate) {
                $template = $cattemplate;
            }else{
                $template = DBNAME.'_show';
            }
        }
        return $this->fetch($template);
    }
    public function load()
    {
        $thumbgroup = db('picture')->field('thumbgroup')->where('id', input('id'))->find();
        // $info = $this->dao->where('id',input('id'))->find();
        $thumbgroup = substr($thumbgroup['thumbgroup'], 0, -1);
        $thumbgrouparry = explode(';', $thumbgroup);
        foreach ($thumbgrouparry as $key => $value) {
            $thumbgrouparry[$key] = '/public' . $value;
        }
        return json(['data' => $thumbgrouparry, 'code' => 1, 'message' => '操作完成']);
    }
    public function page()
    {
        $listnav = db('category')->where(array('parentid' => 10))->field(['id', 'catname'])->select();
        foreach ($listnav as $k => $v) {
            $listnav[$k]['num'] = db('blog')->where(array('catid' => $v['id']))->count();
            $str .= ',' . $v['id'];
            // $str=$str.','.$v['id'];
        }
        $map = 'catid in(' . substr($str, 1) . ')';
        $list = db('case')->where($map)->paginate(8);
        //echo db('case')->getlastsql();exit;
        $page = $list->render();
        $list = $list->toArray();
        $this->assign('page', $page);
        $this->assign('list', $list['data']);
        return $this->fetch('case_load');
    }
    public function deal()
    {
        $newproducts = db('product')->where(array('isnew' => 1))->select();
        $catdir = db('category')->where(array('id' => $newproducts[0]['catid']))->field('catdir')->select();
        $list = db('product')->where('isnew', 1)->paginate(9);
        //分页显示
        $page = $list->render();
        $this->assign('catdir', $catdir[0]['catdir']);
        $this->assign('page', $page);
        $this->assign('products', $newproducts);
        return $this->fetch('page_show');
    }
}
