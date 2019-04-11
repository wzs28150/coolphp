<?php
namespace app\api\controller;
use think\Input;
use think\Db;
use cool\Leftnav;
use think\Request;
use think\Controller;
use app\api\controller\Common;
class Commonapi extends Common
{
    protected $pagesize;
    //设置北京时间为默认时区
    public function _initialize()
    {
        $post = input();
        // $sys = F('System');
        // //获取控制方法
        $request = Request::instance();
        // // dump($request->header());
        // $token = $request->header('token');
        parent::_initialize();
        $action = $request->action();
        $controller = $request->controller();
        // // define('TOKEN',$token);
        define('MODULE_NAME', strtolower($controller));
        define('ACTION_NAME', strtolower($action));
        // //导航
        $category = db('category');
        $thisCat = $category->where('id', input('catId'))->find();
        // // dump($thisCat['module']);
        define('DBNAME', strtolower($thisCat['module']));
        $this->pagesize = $thisCat['pagesize']>0 ? $thisCat['pagesize'] : '';


    }

    public function export($code, $msg = '', $data = null, $current_page = 0, $last_page = 0, $per_page = 0, $total = 0, $status = 0)
    {
        header("Access-Control-Allow-Origin: *");
        // $result['code'] = $code;
        // $result['errmsg'] = $msg;
        // $result['data'] = $data;
        // $result['current_page'] = $current_page;
        // $result['last_page'] = $last_page;
        // $result['per_page'] = $per_page;
        // $result['total'] = $total;
        // $result['status'] = $status;
        return $data;
        exit;
    }
    public function _empty()
    {
        return $this->error('空操作，返回上次访问页面中...');
    }
}
