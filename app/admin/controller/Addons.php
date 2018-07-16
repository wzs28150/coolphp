<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
class Addons extends Common
{
  public function _initialize()
  {
      parent::_initialize();
      $this->addonsListM = db('addons')->field('name')->select();
      $list  = db('menu')->field('aid,roleid')->where('pid',115)->where('aid','>',0)->order('sort')->select();
      foreach ($list as $key => $value) {
        $this->adminRules[$value['aid']] = $value['roleid'];
      }
  }
  /**
   * 插件列表
   */
  public function index()
  {
      if(request()->isPost()){
        if(session('gid')==1){
          // 管理员可以根据文件来读取列表进行安装
          $page =input('page')?input('page'):1;
          $pageSize =input('limit')?input('limit'):config('pageSize');
          $list = $this -> getDir(ADDONS_PATH);
          $count = count($list);
          foreach ($list as $key => $value) {
            $class          =   get_addon_class($value);
            if(!class_exists($class)){
              $result['msg'] = '插件不存在!';
              $result['code'] = 0;
              return $result;
            }
            $addons  =   new $class;
            $addonsJson = $addons->info;
            $list[$key]=$addonsJson;
          }

          foreach ($list as $key => $value)
          {
            $list[$key]['id'] = $key + 1;
            if($this -> deep_in_array($value['name'], $this->addonsListM))
            {
              $info = db('addons')->where('name',$value['name'])->find();
              $list[$key]['aid'] = $info['id'];
              $list[$key]['status'] = 1;
            }
            else
            {
              $list[$key]['status'] = 0;
            }
            $list[$key]['has_adminlist'] = $this->gethasadminlist($value['name']);

          }

          $list = $this -> page_array($pageSize,$page,$list,0);
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = $list;
          $rsult['count'] = $count;
          $rsult['rel'] = 1;
          return $rsult;
        }else{
          // 非管理员只能查看已安装的
          $page =input('page')?input('page'):1;
          $pageSize =input('limit')?input('limit'):config('pageSize');

          $list = db('addons')->select();
          foreach ($list as $key => $value) {
            $list[$key]['aid'] = $list[$key]['id'];
            if(!in_array(session('gid'),explode(',',$this->adminRules[$value['id']]))){
              unset($list[$key]);
            }
          }
          $count = count($list);
          $list = $this -> page_array($pageSize,$page,$list,0);
          $rsult['code'] = 0;
          $rsult['msg'] = "获取成功";
          $rsult['data'] = $list;
          $rsult['count'] = $count;
          $rsult['rel'] = 1;
          return $rsult;
        }
      }


      if(session('gid')==1){
        // 管理员可以根据文件来读取列表进行安装
        $page =input('page')?input('page'):1;
        $pageSize =input('limit')?input('limit'):config('pageSize');
        $list = $this -> getDir(ADDONS_PATH);
        $count = count($list);
        foreach ($list as $key => $value) {
          $class          =   get_addon_class($value);
          if(!class_exists($class)){
            return $this->error('插件不存在!返回上次访问页面中...');
          }
          $addons  =   new $class;
          $addonsJson = $addons->info;
          $list[$key]=$addonsJson;
        }
        foreach ($list as $key => $value)
        {
          $list[$key]['id'] = $key + 1;
          if($this -> deep_in_array($value['name'], $this->addonsListM))
          {
            $info = db('addons')->where('name',$value['name'])->find();
            $list[$key]['aid'] = $info['id'];
            $list[$key]['status'] = 1;
          }
          else
          {
            $list[$key]['status'] = 0;
          }
          $list[$key]['has_adminlist'] = $this->gethasadminlist($value['name']);

        }

        $list = $this -> page_array($pageSize,$page,$list,0);
        $this->assign('list',$list);
      }else{
        // 非管理员只能查看已安装的
        $page =input('page')?input('page'):1;
        $pageSize =input('limit')?input('limit'):config('pageSize');

        $list = db('addons')->select();
        foreach ($list as $key => $value) {
          $list[$key]['aid'] = $list[$key]['id'];
          if(!in_array(session('gid'),explode(',',$this->adminRules[$value['id']]))){
            unset($list[$key]);
          }
        }
        $count = count($list);
        $list = $this -> page_array($pageSize,$page,$list,0);
        $this->assign('list',$list);
      }


      $title = "插件列表";
      $this->assign('title',$title);
    return $this->fetch();
  }

  /**
   * 插件安装
   * @return [type] [description]
   */
  public function install()
  {
    $addonsName = Input('addonsname');
    $class          =   get_addon_class($addonsName);
    if(!class_exists($class)){
      $result['msg'] = '插件不存在';
      $result['code'] = 0;
      return $result;
      exit;
    }
    $addons  =   new $class;
    $info = $addons->info;
    if(!$info || !$addons->checkInfo()){
      $result['msg'] = '插件信息缺失';
      $result['code'] = 0;
      return $result;
      exit;
    }
    session('addons_install_error',null);
    $install_flag   =   $this->dosqlfile(ADDONS_PATH.$addonsName.'/sql/install.sql');
    if(!$install_flag){
        $result['msg'] = '执行插件预安装操作失败'.session('addons_install_error');
        $result['code'] = 0;
        return $result;
        exit;
    }
    $info['status'] = 1;
    $info['create_time'] = time();
    $res = db('addons')->insertGetId($info);
    $config['config']=json_encode($addons->getConfig());
    $updateres = db('addons')->where('name', $addonsName)->update($config);
    if($res){
      if($updateres){
        //设置权限
        $data['title'] = $info['title'];
        $data['aid'] = $res;
        $data['pid'] = 307;
        $data['addtime'] = time();
        $authres = db('auth_rule')->insert($data);
        if($authres){
          $result['msg'] = '插件安装成功!';
          $result['url'] = url('index');
          $result['code'] = 1;
          return $result;
          exit;
        }else{
          $result['msg'] = '插件安装失败!';
          $result['code'] = 0;
          return $result;
          exit;
        }

      }else{
        $result['msg'] = '插件安装失败!';
        $result['code'] = 0;
        return $result;
        exit;
      }
    }else{
        $result['msg'] = '插件安装失败!';
        $result['code'] = 0;
        return $result;
        exit;
    }
  }

  /**
   * 卸载程序
   */
  public function uninstall()
  {
    $addonsName = Input('addonsname');
    $class      =   get_addon_class($addonsName);
    $db_addons = db('addons')->where('name',$addonsName)->find();
    if(!$db_addons || !class_exists($class)){
      $result['msg'] = '插件不存在!';
      $result['code'] = 0;
      return $result;
      exit;
    }
    session('addons_uninstall_error',null);
    $addons =   new $class;
    $uninstall_flag =  $this->dosqlfile(ADDONS_PATH.$addonsName.'/sql/uninstall.sql');
    // dump($uninstall_flag);exit;
    if(!$uninstall_flag){
      $result['msg'] = '执行插件预卸载操作失败'.session('addons_uninstall_error');
      $result['code'] = 0;
      return $result;
      exit;
    }
    $hooks_list   =  db('addons')->where('name',$addonsName)->find();
    $hooks_update   =  db('addons')->delete($hooks_list['id']);
    if($hooks_update === false){
      $result['msg'] = '插件卸载失败!';
      $result['code'] = 0;
      return $result;
      exit;
    }else{
      //删除权限
      $authres = db('auth_rule')->where('aid',$hooks_list['id'])->delete();
      $result['msg'] = '插件卸载成功!';
      $result['url'] = url('index');
      $result['code'] = 1;
      return $result;
      exit;
    }
  }

  /**
   * 获取文件下所有子目录
   * @param  [type] $dir          [父级目录结构]
   * @return [type] $dirArray     [子目录数组]
   */
  private function getDir($dir)
  {
      $dirArray[]=NULL;
      if (false != ($handle = opendir ( $dir ))) {
          $i=0;
          while ( false !== ($file = readdir ( $handle )) ) {
              if ($file != "." && $file != ".."&&!strpos($file,".")) {
                  $dirArray[$i]=$file;
                  $i++;
              }
          }
          //关闭句柄
          closedir ( $handle );
      }
      return $dirArray;
  }

  /**
   * 插件数组分页类
   * @param  [type] $count [每页多少条数据]
   * @param  [type] $page  [当前第几页]
   * @param  [type] $array [查询出来的所有数组]
   * @param  [type] $order [0 - 不变   1- 反序]
   * @return [type] $array [返回数据]
   */
  private function page_array($count,$page,$array,$order)
  {
    global $countpage; #定全局变量
    $page=(empty($page))?'1':$page; #判断当前页面是否为空 如果为空就表示为第一页面
      $start=($page-1)*$count; #计算每次分页的开始位置
    if($order==1){
      $array=array_reverse($array);
    }
    $totals=count($array);
    $countpage=ceil($totals/$count); #计算总页面数
    $pagedata=array();
    $pagedata=array_slice($array,$start,$count);
    return $pagedata; #返回查询数据
  }
  /**
   * 查找某个值是否存在于多维数组中
   * @param  [type] $value [要查找的值]
   * @param  [arr ] $array [目标数组]
   * @return [bool]        [返回布尔结果]
   */
  private function deep_in_array($value, $array)
  {
      foreach($array as $item) {
          if(!is_array($item)) {
              if ($item == $value) {
                  return true;
              } else {
                  continue;
              }
          }

          if(in_array($value, $item)) {
              return true;
          } else if($this -> deep_in_array($value, $item)) {
              return true;
          }
      }
      return false;
  }
  /**
   * 执行sql文件
   * @param  [type] $file [文件名]
   * @return [type]       [description]
   */
  private function dosqlfile($file)
  {
    $_sql = file_get_contents($file);
    $_arr = explode(';', $_sql);
    $num = 0;
    unset($_arr[count($_arr)-1]);
    // dump($_arr);exit;
    foreach ($_arr as $_value) {
      $res = db()->query($_value.';');
    }
    return true;
  }

  /**
   * 设置插件是否显示在后台首页快捷方式
   */
  public function adminlist()
  {
    $addonsName = Input('addonsname');
    $class          =   get_addon_class($addonsName);
    $db_addons = db('addons')->where('name',$addonsName)->find();
    if(!$db_addons || !class_exists($class)){
      $result['msg'] = '插件不存在!';
      $result['code'] = 0;
      return $result;
      exit;
    }
    $data['has_adminlist'] = Input('has_adminlist') == 1 ? 0 : 1;
    $hooks_update   =  db('addons')->where('name',$addonsName)->update($data);
    if($hooks_update === false){
      $result['msg'] = '设置失败!';
      $result['code'] = 0;
      return $result;
      exit;
    }else{
      $result['msg'] = '设置成功!';
      $result['url'] = url('index');
      $result['code'] = 1;
      return $result;
      exit;
    }
  }

  /**
   * 获取插件后台快捷方式状态
   * @param  [type] $name [description]
   * @return [type]       [description]
   */
  public function gethasadminlist($addonsName)
  {
    $db_addons = db('addons')->where('name',$addonsName)->find();
    return $db_addons['has_adminlist'];
  }
  /**
   * 加载插件后台主页面
   * @return [type] [description]
   */
  public function loadadmin()
  {
    $id = input('id');
    $info = db('addons')->find($id);
    $menus = getleftnav(115,1,array('aid'=>$id));
    $this->assign('menus', $menus);
    $this->assign('info',$info);
    return $this->fetch();
  }

  public function add()
  {
    if(request()->isPost()){
      // 读取自动生成定义文件
      $post = input('post.');
      // dump($post);exit;
      // $post = [
      //     'name' => 'ceshi',
      //     'title' => '测试系统',
      //     'description' => '测试系统',
      //     'status' => 0,
      //     'author' => 'by wzs',
      //     'version' => '0.1',
      //     'is_page'=>0,
      //     'is_weixin'=>0,
      //     'has_adminlist'=>0,
      //     'icon'=>'layui-icon-dialogue'
      // ];
      $build = [
          $post['name'] =>[
              '__file__'  => ['common.php',ucfirst($post['name']).'.php','index.html'],
              '__dir__'   =>  ['controller','view','sql'],
              'controller'=>  ['Index','Admin'],
              'view'      =>  ['index/index','admin/main'],
              'sql'       =>  ['install.sql','uninstall.sql']
          ]
       ];
      foreach ($build as $key => $value) {
        if($this->makedir(APP_PATH.'../addons/'.$key)){
          if($value['__file__']){
            foreach ($value['__file__'] as $fk => $fv) {

              if($fv == ucfirst($post['name']).'.php'){
                  $myfile = fopen(APP_PATH.'../addons/'.$key.'/'.$fv, "w");
                  $file = APP_PATH.'/extra/mainfile.txt'; //先读取文件
                  $this->insertfile($file,APP_PATH.'../addons/'.$key.'/'.$fv,$post);
              }else{
                fopen(APP_PATH.'../addons/'.$key.'/'.$fv, "w");
              }
            }
          }
          if($value['__dir__']){
            foreach ($value['__dir__'] as $fk => $fv) {
              $this->makedir(APP_PATH.'../addons/'.$key.'/'.$fv);
            }
          }
          if($value['controller']){
            foreach ($value['controller'] as $fk => $fv) {
              fopen(APP_PATH.'../addons/'.$key.'/controller/'.$fv.'.php', "a");
              if($fv == 'Admin'){
                $file = APP_PATH.'/extra/adminfile.txt';
                $this->insertfile($file,APP_PATH.'../addons/'.$key.'/controller/'.$fv.'.php',$post);
              }
            }
          }
          if($value['view']){
            foreach ($value['view'] as $fk => $fv) {
              $arr = explode('/',$fv);
              if($this->makedir(APP_PATH.'../addons/'.$key.'/view/'.$arr[0])){
                fopen(APP_PATH.'../addons/'.$key.'/view/'.$arr[0].'/'.$arr[1].'.html', "a");
              }
            }
          }
          if($value['sql']){
            foreach ($value['sql'] as $fk => $fv) {
              fopen(APP_PATH.'../addons/'.$key.'/sql/'.$fv, "a");
            }
          }
        }
      }
      $result['msg'] = '预安装成功!';
      $result['url'] = url('/admin/Addons/index');
      $result['code'] = 1;
      return $result;
      exit;
    }
    else
    {
      $iconarr = ['layui-icon-rate-half','layui-icon-rate','layui-icon-rate-solid','layui-icon-cellphone','layui-icon-vercode','layui-icon-login-wechat','layui-icon-login-qq','layui-icon-login-weibo','layui-icon-password','layui-icon-username','layui-icon-refresh-3','layui-icon-auz','layui-icon-spread-left','layui-icon-shrink-right','layui-icon-snowflake','layui-icon-tips','layui-icon-note','layui-icon-home','layui-icon-senior','layui-icon-refresh','layui-icon-refresh-1','layui-icon-flag','layui-icon-theme','layui-icon-notice','layui-icon-website','layui-icon-console','layui-icon-face-surprised','layui-icon-set','layui-icon-template-1','layui-icon-app','layui-icon-template','layui-icon-praise','layui-icon-tread','layui-icon-male','layui-icon-female','layui-icon-camera','layui-icon-camera-fill','layui-icon-more','layui-icon-more-vertical','layui-icon-rmb','layui-icon-dollar','layui-icon-diamond','layui-icon-fire','layui-icon-return','layui-icon-location','layui-icon-read','layui-icon-survey','layui-icon-face-smile','layui-icon-face-cry','layui-icon-cart-simple','layui-icon-cart','layui-icon-next','layui-icon-prev','layui-icon-upload-drag','layui-icon-upload','layui-icon-download-circle','layui-icon-component','layui-icon-file-b','layui-icon-user','layui-icon-find-fill','layui-icon-loading','layui-icon-loading-1','layui-icon-add-1','layui-icon-play','layui-icon-pause','layui-icon-headset','layui-icon-video','layui-icon-voice','layui-icon-speaker','layui-icon-fonts-del','layui-icon-fonts-code','layui-icon-fonts-html','layui-icon-fonts-strong','layui-icon-unlink','layui-icon-picture','layui-icon-link','layui-icon-face-smile-b','layui-icon-align-left','layui-icon-align-right','layui-icon-align-center','layui-icon-fonts-u','layui-icon-fonts-i','layui-icon-tabs','layui-icon-radio','layui-icon-circle','layui-icon-edit','layui-icon-share','layui-icon-delete','layui-icon-form','layui-icon-cellphone-fine','layui-icon-dialogue','layui-icon-fonts-clear','layui-icon-layer','layui-icon-date','layui-icon-water','layui-icon-code-circle','layui-icon-carousel','layui-icon-prev-circle','layui-icon-layouts','layui-icon-util','layui-icon-templeate-1','layui-icon-upload-circle','layui-icon-tree','layui-icon-table','layui-icon-chart','layui-icon-chart-screen','layui-icon-engine','layui-icon-triangle-d','layui-icon-triangle-r','layui-icon-file','layui-icon-set-sm','layui-icon-add-circle','layui-icon-404','layui-icon-about','layui-icon-up','layui-icon-down','layui-icon-left','layui-icon-right','layui-icon-circle-dot','layui-icon-search','layui-icon-set-fill','layui-icon-group','layui-icon-friends','layui-icon-reply-fill','layui-icon-menu-fill','layui-icon-log','layui-icon-picture-fine','layui-icon-face-smile-fine','layui-icon-list','layui-icon-release','layui-icon-ok','layui-icon-help','layui-icon-chat','layui-icon-top','layui-icon-star','layui-icon-star-fill','layui-icon-close-fill','layui-icon-close','layui-icon-ok-circle','layui-icon-add-circle-fine'];
      $this->assign('iconarr',$iconarr);
      $this->assign('title','预添加插件');
      return $this->fetch();
    }
  }

  public function makedir($path)
  {
    $dir = iconv("UTF-8", "GBK", $path);
    if (!file_exists($dir)){
        mkdir ($dir,0777,true);
        return true;
    } else {
        return true;
    }
  }
  public function insertfile($txtfile,$phpfile,$post)
  {
    $str = file_get_contents($txtfile);
    $str = preg_replace('/@name/i',$post['name'],$str);
    $str = preg_replace('/@uname/i',ucfirst($post['name']),$str);
    $str = preg_replace('/@description/i',$post['description'],$str);
    $str = preg_replace('/@title/i',$post['title'],$str);
    $str = preg_replace('/@status/i',$post['status'],$str);
    $str = preg_replace('/@author/i',$post['author'],$str);
    $str = preg_replace('/@version/i',$post['version'],$str);
    $str = preg_replace('/@is_page/i',$post['is_page'],$str);
    $str = preg_replace('/@is_weixin/i',$post['is_weixin'],$str);
    $str = preg_replace('/@has_adminlist/i',$post['has_adminlist'],$str);
    $str = preg_replace('/@icon/i',$post['icon'],$str);
    file_put_contents($phpfile, $str);
  }
}
