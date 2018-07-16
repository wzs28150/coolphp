<?php
namespace app\admin\controller;
use think\Db;
use cool\Leftnav;
use app\admin\model\Admin;
use app\admin\model\AuthGroup;
use app\admin\model\authRule;
use think\Validate;
class Auth extends Common
{
    //管理员列表
    public function adminList(){
        if(request()->isPost()){
            $val=input('val');
            $url['val'] = $val;
            $this->assign('testval',$val);
            $map='';
            if($val){
                $map['username|email|tel']= array('like',"%".$val."%");
            }
            if (session('aid')!=1){
                $map['admin_id']=session('aid');
            }
            $list=Db::table(config('database.prefix').'admin')->alias('a')
                ->join(config('database.prefix').'auth_group ag','a.group_id = ag.group_id','left')
                ->field('a.*,ag.title')
                ->where($map)
                ->select();
            return $result = ['code'=>0,'msg'=>'获取成功!','data'=>$list,'rel'=>1];
        }
        return view();
    }

    public function adminAdd(){
        if(request()->isPost()){
            $data = input('post.');
            $check_user = Admin::get(['username'=>$data['username']]);
            if ($check_user) {
                return $result = ['code'=>0,'msg'=>'用户已存在，请重新输入用户名!'];
            }
            $data['pwd'] = input('post.pwd', '', 'md5');
            $data['add_time'] = time();
            $data['ip'] = request()->ip();
            //验证
            $msg = $this->validate($data,'Admin');
            if($msg!='true'){
                return $result = ['code'=>0,'msg'=>$msg];
            }
            //单独验证密码
            $checkPwd = Validate::is(input('post.pwd'),'require');
            if (false === $checkPwd) {
                return $result = ['code'=>0,'msg'=>'密码不能为空！'];
            }
            //添加
            if (Admin::create($data)) {
                return ['code'=>1,'msg'=>'管理员添加成功!','url'=>url('adminList')];
            } else {
                return ['code'=>0,'msg'=>'管理员添加失败!'];
            }
        }else{
            $auth_group=db('auth_group')->select();
            $this->assign('authGroup',json_encode($auth_group,true));
            $this->assign('title',lang('add').lang('admin'));
            $this->assign('info','null');
            $this->assign('selected', 'null');
            return view('adminForm');
        }
    }
    //删除管理员
    public function adminDel(){
        $admin_id=input('post.admin_id');
        if (session('aid')==1){
            Admin::destroy(['admin_id'=>$admin_id]);
            return $result = ['code'=>1,'msg'=>'删除成功!'];
        }else{
            return $result = ['code'=>0,'msg'=>'您没有删除管理员的权限!'];
        }
    }
    //修改管理员状态
    public function adminState(){
        $id=input('post.id');
        if (empty($id)){
            $result['status'] = 0;
            $result['info'] = '用户ID不存在!';
            $result['url'] = url('adminList');
            exit;
        }
        $status=db('admin')->where('admin_id='.$id)->value('is_open');//判断当前状态情况
        if($status==1){
            $data['is_open'] = 0;
            db('admin')->where('admin_id='.$id)->update($data);
            $result['status'] = 1;
            $result['open'] = 0;
        }else{
            $data['is_open'] = 1;
            db('admin')->where('admin_id='.$id)->update($data);
            $result['status'] = 1;
            $result['open'] = 1;
        }
        return $result;
    }
    //更新管理员信息
    public function adminEdit(){
        if(request()->isPost()){
            $data = input('post.');
            $pwd=input('post.pwd');

            $map['admin_id'] = array('neq',input('post.admin_id'));
            $where['admin_id'] = input('post.admin_id');
            if(input('post.username')){
                $map['username'] = input('post.username');
                $check_user = Admin::get($map);
                if ($check_user) {
                    return $result = ['code'=>0,'msg'=>'用户已存在，请重新输入用户名!'];
                }
            }
            if ($pwd){
                $data['pwd']=input('post.pwd','','md5');
            }else{
                unset($data['pwd']);
            }
            $msg = $this->validate($data,'Admin');
            if($msg!='true'){
                return $result = ['code'=>0,'msg'=>$msg];
            }
            Admin::update($data);
            return $result = ['code'=>1,'msg'=>'管理员修改成功!','url'=>url('adminList')];
        }else{
            $auth_group = AuthGroup::all();
            $info = Admin::get(['admin_id'=>input('admin_id')]);
            $data = db('admin')->find(input('admin_id'));
            $this->assign('data', $data);
            $selected = db('auth_group')->where('group_id',$info['group_id'])->find();
            $this->assign('selected',json_encode($selected,true));
            $this->assign('info', $info->toJson());
            $this->assign('authGroup',json_encode($auth_group,true));
            $this->assign('title',lang('edit').lang('admin'));
            return view('adminForm');
        }
    }
    /*-----------------------用户组管理----------------------*/
    //用户组管理
    public function adminGroup(){
        if(request()->isPost()){
            $list = AuthGroup::all();
            return $result = ['code'=>0,'msg'=>'获取成功!','data'=>$list,'rel'=>1];
        }
        return view('adminGroup');
    }
    //删除管理员分组
    public function groupDel(){
        AuthGroup::destroy(['group_id'=>input('id')]);
        return $result = ['code'=>1,'msg'=>'删除成功!'];
    }
    //添加分组
    public function groupAdd(){
        if(request()->isPost()){
            $data=input('post.');
            $data['addtime']=time();
            AuthGroup::create($data);
            $result['msg'] = '用户组添加成功!';
            $result['url'] = url('adminGroup');
            $result['code'] = 1;
            return $result;
        }else{
            $this->assign('title','添加用户组');
            $this->assign('info','null');
            return $this->fetch('groupForm');
        }
    }
    //修改分组
    public function groupEdit(){
        if(request()->isPost()) {
            $data=input('post.');
            AuthGroup::update($data);
            $result = ['code'=>1,'msg'=>'用户组修改成功!','url'=>url('adminGroup')];
            return $result;
        }else{
            $id = input('id');
            $info = AuthGroup::get(['group_id'=>$id]);
            $this->assign('info', json_encode($info,true));
            $this->assign('title','编辑用户组');
            return $this->fetch('groupForm');
        }
    }
    //分组配置规则
    public function groupAccess(){
        $nav = new Leftnav();
        $admin_rule=db('menu')->field('id,pid,title,roleid')->order('sort asc')->select();
        $rules = db('auth_group')->where('group_id',input('id'))->value('rules');
        $arr = $nav->auth($admin_rule,$pid=0,input('id'));
        $arr[] = array(
            "id"=>0,
            "pid"=>0,
            "title"=>"全部",
            "open"=>true
        );
        $this->assign('data',json_encode($arr,true));
        return $this->fetch('groupAccess');
    }
    public function groupSetaccess(){
        $rules = input('post.rules');

        if(empty($rules)){
            return array('msg'=>'请选择权限!','code'=>0);
        }
        $post = input('post.');
        //添加
        $rulesarr = db('menu')->where('id','in',$post['rules'])->select();
        foreach ($rulesarr as $key => $value) {
          if(!in_array($post['group_id'],explode(',',$value['roleid']))){
            $arr = explode(',',$value['roleid']);
            array_push($arr,$post['group_id']);
            asort($arr);
            db('menu')->where('id',$value['id'])->setField('roleid', implode(',',$arr));
          }
        }
        //删除
        $rulesdelarr = db('menu')->where('id','not in',$post['rules'])->select();
        foreach ($rulesdelarr as $key => $value) {
          if(in_array($post['group_id'],explode(',',$value['roleid']))){
            $arr = explode(',',$value['roleid']);
            $arr = array_diff($arr, [$post['group_id']]);
            asort($arr);
            db('menu')->where('id',$value['id'])->setField('roleid', implode(',',$arr));
          }
        }
        return array('msg'=>'权限配置成功!','url'=>url('adminGroup'),'code'=>1);
    }

    /********************************权限管理*******************************/
    public function adminRule(){
        if(request()->isPost()){
            $nav = new Leftnav();
            $arr = cache('menu');
            if(!$arr){
                // $authRule = authRule::(function($query){
                //     $query->order('sort', 'asc');
                // });
                $menu = db('menu')->select();
                $arr = $nav->menu($menu);
                cache('menu', $arr, 3600);
            }
            return $result = ['code'=>0,'msg'=>'获取成功!','data'=>$arr,'rel'=>1];
        }
        return view('adminRule');
    }
    public function ruleAdd(){
        if(request()->isPost()){
            $data = input('post.');
            $data['addtime'] = time();
            db('menu')->insert($data);
            cache('authRule', NULL);
            cache('authRuleList', NULL);
            return $result = ['code'=>1,'msg'=>'权限添加成功!','url'=>url('adminRule')];
        }else{
            $nav = new Leftnav();
            $arr = cache('authRuleList');
            if(!$arr){
                $authRule = db('menu')->select();
                $arr = $nav->menu($authRule);
                cache('authRuleList', $arr, 3600);
            }
            $addons = db('addons')->select();
            $this->assign('addons',$addons);
            $this->assign('admin_rule',$arr);//权限列表
            return $this->fetch('ruleAdd');
        }
    }
    public function ruleOrder(){
        $menu=db('menu');
        $data = input('post.');
        if($menu->update($data)!==false){
            cache('authRuleList', NULL);
            cache('authRule', NULL);
            return $result = ['code'=>1,'msg'=>'排序更新成功!','url'=>url('adminRule')];
        }else{
            return $result = ['code'=>0,'msg'=>'排序更新失败!'];
        }
    }
    public function ruleState(){
        $id=input('post.id');
        $statusone=db('menu')->where(array('id'=>$id))->value('menustatus');//判断当前状态情况
        cache('menu', NULL);
        cache('menu', NULL);
        if($statusone==1){
            $statedata = array('menustatus'=>0);
            db('menu')->where(array('id'=>$id))->setField($statedata);
            $result['status'] = 1;
            $result['menustatus'] = 0;
        }else{
            $statedata = array('menustatus'=>1);
            db('menu')->where(array('id'=>$id))->setField($statedata);
            $result['status'] = 1;
            $result['menustatus'] = 1;
        }
        return $result;
    }
    public function ruleTz(){
        $id=input('post.id');
        $statusone=db('menu')->where(array('id'=>$id))->value('authopen');//判断当前状态情况
        cache('authRule', NULL);
        cache('authRuleList', NULL);
        if($statusone==1){
            $statedata = array('authopen'=>0);
            db('menu')->where(array('id'=>$id))->setField($statedata);
            $result['status'] = 1;
            $result['authopen'] = 0;
        }else{
            $statedata = array('authopen'=>1);
            db('menu')->where(array('id'=>$id))->setField($statedata);
            $result['status'] = 1;
            $result['authopen'] = 1;
        }
        return $result;
    }

    public function ruleDel(){
        db('menu')->delete(input('param.id'));
        cache('authRule', NULL);
        cache('authRuleList', NULL);
        return $result = ['code'=>1,'msg'=>'删除成功!'];
    }
    /**
     * 修复文章栏目与权限的关系,插件菜单与权限的关系
     */
    public function ruleFix()
    {
      db('menu')->where('catid','>',0)->delete();
      //一级
      $catelist0 = db('category')->where('parentid',0)->fetchsql(false)->order('listorder desc')->select();
      foreach ($catelist0 as $key => $value) {
        $data['title'] = $value['catname'];
        $data['href'] = $value['module'].'/index?catid='.$value['id'];
        $data['pid'] = 28;
        $data['addtime'] = time();
        $data['menustatus'] = 1;
        $data['catid'] = $value['id'];
        $data['roleid'] = 2;
        $data['sort'] = $value['listorder'];
        $authmenu[] = db('menu')->insertGetId($data);
        $parentidarr[] = $value['id'];
      }
      $parentidstr = implode(",", $parentidarr);
      $authmenuarr = implode(",", $authmenu);
      //二级
      $catelist = db('category')->where('parentid','in',$parentidstr)->fetchsql(false)->order('listorder desc')->select();
      $menulist = db('menu')->where('id','in',$authmenuarr)->fetchsql(false)->select();
      foreach ($menulist as $k => $v) {
        foreach ($catelist as $key => $value) {
          if($value['parentid'] == $v['catid']){
            $data['title'] = $value['catname'];
            $data['href'] = $value['module'].'/index?catid='.$value['id'];
            $data['pid'] = $v['id'];
            $data['addtime'] = time();
            $data['menustatus'] = 1;
            $data['catid'] = $value['id'];
            $data['sort'] = $value['listorder'];
            $data['roleid'] = 2;
            $authmenu2[] = db('menu')->insertGetId($data);
            $parentidarr2[] = $value['id'];
          }
        }
      }
      $parentidstr2= implode(",", $parentidarr2);
      $authmenuarr2 = implode(",", $authmenu2);
      //三级
      $catelist2 = db('category')->where('parentid','in',$parentidstr2)->fetchsql(false)->order('listorder desc')->select();
      $menulist2 = db('menu')->where('id','in',$authmenuarr2)->fetchsql(false)->select();
      foreach ($menulist2 as $k => $v) {
        foreach ($catelist2 as $key => $value) {
          if($value['parentid'] == $v['catid']){
            $data['title'] = $value['catname'];
            $data['href'] = $value['module'].'/index?catid='.$value['id'];
            $data['pid'] = $v['id'];
            $data['addtime'] = time();
            $data['menustatus'] = 1;
            $data['catid'] = $value['id'];
            $data['sort'] = $value['listorder'];
            $data['roleid'] = 2;
            $authmenu2[] = db('menu')->insertGetId($data);
            $parentidarr2[] = $value['id'];
          }
        }
      }
      db('menu')->where('aid','>',0)->delete();
      $list = $this -> getDir(ADDONS_PATH);
      foreach ($list as $key => $value) {
        $info = db('addons')->where('name',$value)->find();
        $data['title'] = $info['title'];
        $data['href'] = $info['name'];
        $data['pid'] = 115;
        $data['icon'] = substr($info['icon'],11);
        $data['addtime'] = time();
        $data['menustatus'] = 0;
        $data['aid'] = $info['id'];
        $data['roleid'] = '1,2';
        $data['sort'] = 99 + $key;
        $authmenu[$info['id']] = db('menu')->insertGetId($data);
        unset($data);
        unset($info);
      }
      foreach ($authmenu as $key => $value) {
        $info = db('addons')->find($key);
        $list2 = db($info['name'].'_category')->where('pid',0)->select();
        foreach ($list2 as $k => $v) {
          $data['title'] = $v['title'];
          $data['href'] = $v['href'];
          $data['pid'] = $value;
          $data['icon'] = '';
          $data['addtime'] = time();
          $data['menustatus'] = 1;
          $data['aid'] = $key;
          $data['roleid'] = '1,2';
          $authmenu1[] = array('pid' => db('menu')->insertGetId($data),'aid' =>$info['id'],'id'=>$v['id']);
          unset($data);
        }
      }
      foreach ($authmenu1 as $key => $value) {
        $info = db('addons')->find($value['aid']);
        $list3 = db($info['name'].'_category')->where('pid',$value['id'])->select();
        foreach ($list3 as $k => $v) {
          $data['title'] = $v['title'];
          $data['href'] = $v['href'];
          $data['pid'] = $value['pid'];
          $data['icon'] = '';
          $data['addtime'] = time();
          $data['menustatus'] = 1;
          $data['aid'] = $value['aid'];
          $data['roleid'] = '1,2';
          $authmenu2[] = db('menu')->insertGetId($data);
        }
      }
      return $result = ['code'=>1,'msg'=>'修复成功!'];
    }

    public function getrid($catid)
    {
      $list = db('menu')->field('id')->where('catid',$catid)->find();
      return $list['id'];
    }
    private function auins($arr,$pid='274')
    {
      // $firstclist = db('category')->field('id,catname,module')->where('parentid',0)->order('id')->select();
      foreach ($arr as $key => $value) {
        $data[$key] = array(
          'href' => $value['module'].'/index/catid/'.$value['id'].'.html',
          'title' => $value['catname'],
          'type' => '1',
          'status' => '1',
          'authopen' => '1',
          'icon' => '',
          'condition' => '',
          'pid' => $pid,
          'sort' => '0',
          'addtime' => time(),
          'zt' => null,
          'menustatus' => '0',
          'catid' => $value['id'],
          'aid' => 0
        );
      }
      $res = db('menu')->insertAll($data);
      return $res;
      // dump($data);
    }
    public function ruleEdit(){
        if(request()->isPost()) {
            $datas = input('post.');
            if(authRule::update($datas)) {
                cache('authRule', NULL);
                cache('authRuleList', NULL);
                return json(['code' => 1, 'msg' => '保存成功!', 'url' => url('adminRule')]);
            } else {
                return json(['code' => 0, 'msg' =>'保存失败！']);
            }
        }else{
            $admin_rule = authRule::get(function($query){
                $query->where(['id'=>input('id')])->field('id,href,title,icon,sort,menustatus');
            });
            $this->assign('rule',$admin_rule);
            return $this->fetch('ruleEdit');
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
}
