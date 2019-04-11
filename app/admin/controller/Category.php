<?php
namespace app\admin\controller;
use cool\Tree;
class Category extends Common
{
    protected $dao, $categorys , $module;
    function _initialize()
    {
        parent::_initialize();
        foreach ((array)$this->module as $rw){
          if($rw['type']==1 && $rw['status']==1){
    				$data['module'][$rw['id']] = $rw;
    			}
        }
        $this->module=$data['module'];
        $this->assign($data);
        unset($data);
        $this->dao = db('category');
        $gid =  session('gid');
        if($gid>2){
          $glist = db('auth_group')->field('rules')->find($gid);
          $rlist = db('auth_rule')->field('catid')->where('id','in',$glist['rules'])->where('catid','<>',
          '')->select();
          $rlist = array_column($rlist, 'catid');
          $rules = explode(',',$glist['rules']);
          foreach ($this->categorys as $key => $value) {
            if(in_array($key,$rlist)){

            }else{

              unset($this->categorys[$key]);
            }
          }
        }

    }
    /**
     * 列表页
     */
    public function index()
    {
        if ($this->categorys) {
            foreach ($this->categorys as $r) {
                $r['str_manage'] = '';
                $r['str_manage'] .= '<a class="blue layui-btn layui-btn-normal layui-btn-xs" title="添加子栏目" href="' . url('Category/add', array('parentid' => $r['id'])) . '"> <i class="layui-icon layui-icon-add-1"></i>添加子栏目</a><a class="green layui-btn layui-btn-normal layui-btn-xs" href="' . url('Category/edit', array('id' => $r['id'])) . '" title="修改"><i class="layui-icon layui-icon-edit"></i>修改</a><a class="red layui-btn layui-btn-normal layui-btn-xs" href="javascript:del(\'' . $r['id'] . '\')" title="删除"><i class="layui-icon layui-icon-delete"></i>删除</a> ';
                if ($r['module'] == 'page') {
                    // $r['str_manage'] .= '<a class="orange layui-btn layui-btn-normal layui-btn-xs" href="' . url('page/edit', array('id' => $r['id'])) . '" title="修改内容"><i class="layui-icon layui-icon-form"></i>修改内容</a>';
                }
                $r['modulename'] = $this->module[$r['moduleid']]['title'];
                $r['dis'] = $r['ismenu'] == 1 ? '<font color="green">显示</font>' : '<font color="red">不显示</font>';
                $array[] = $r;
            }

            $str = "<tr><td class='visible-lg visible-md'>\$id</td>";
            $str .= "<td class='text-left'>\$spacer \$catname</td>";

            $str .= "<td class='visible-lg visible-md'>\$modulename</td><td class='visible-lg visible-md'>\$dis</td>";
            $str .= "<td><input type='text' size='10' data-id='\$id' value='\$listorder' class='layui-input list_order'></td><td>\$str_manage</td></tr>";
            $tree = new Tree ($array);
            $tree->icon = array('&nbsp;&nbsp;&nbsp;│  ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
            $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $categorys = $tree->get_tree(0, $str);

            $this->assign('categorys', $categorys);
        }
        $this->assign('title','栏目列表');
        return $this->fetch();
    }
    /**
     * 添加页面
     */
    public function add()
    {
        $parentid =	input('param.parentid');
        //模型列表
        $module = db('module')->where('status',1)->field('id,title,name')->select();
        $this->assign('modulelist',$module);

        //父级模型ID
        $vo['moduleid'] =$this->categorys[$parentid]['moduleid'];
        $this->assign('module', $vo);
        $this->assign('catdir', $this->categorys[$parentid]['catdir']);
        //栏目选择列表
        foreach($this->categorys as $r) {
            $array[] = $r;
        }
        $str  = "<option value='\$id' \$selected>\$spacer \$catname</option>";
        $tree = new Tree ($array);
        $categorys = $tree->get_tree(0, $str,$parentid);
        $this->assign('categorys', $categorys);
        //模版
        $templates= template_file();
        $this->assign ( 'templates',$templates );
        //管理员权限组
        $usergroup=db('auth_group')->select();
        $this->assign('rlist',$usergroup);
        $this->assign('title','添加栏目');
        return $this->fetch();
    }
    /**
     * 执行添加
     */
    public function insert()
    {
        $data = input('post.');
        if(!empty($data['readgroup'])){
            $data['readgroup'] = implode(',',$data['readgroup']);
        }
        $data['module'] = $this->module[$data['moduleid']]['name'];
        $data['child'] = $data['child']?1:0;
        $id = db('category')->insertGetId($data);
        if($id) {
            if($data['module']=='page'){
                $data2['id']=$id;
                if($data['title']==''){
                    $data2['title'] = $data['catname'];
                }
                if($data['keywords'] !=''){
                    $data2['keywords'] = $data['keywords'];
                }
                if($data['description'] !=''){
                    $data2['description'] = $data['description'];
                }
                if($data['content'] !=''){
                    $data2['content'] = $data['content'];
                }else{
                    $data2['content']="";
                }
                $page=db('page');
                $page->insert($data2);
            }
            if($data['aid']) {
                $Attachment =db('Attachment');
                $aids =  implode(',',$data['aid']);
                $data['status']= '1';
                $Attachment->where("aid in (".$aids.")")->updata($data);
            }
            //更新权限管理  href catid pid   title
            $data3['catid'] = $id;
            if ($data['parentid']) {
                $rul = db('menu')->field('id')->where('catid', $data['parentid'])->find();
                $data3['pid'] = $rul['id'];
            } else {
                $data3['pid'] = 28;
            }
            $data3['title'] = $data['catname'];
            if($data['module'] == 'page'){
              $data3['href'] = 'page/edit?id='.$id;
            }else{
              $data3['href'] = $data['module'] . '/index?catid='.$id;
            }

            $data3['addtime'] = time();
            $data3['authopen'] = 0;
            $data3['menustatus'] = 1;
            $authrule = db('menu');
            $authid = $authrule->insertGetId($data3);
            $this->repair();
            savecache('Category');
            $result['msg'] = '栏目添加成功!';
            cache('cate', NULL);
            $result['url'] = url('index');
            $result['code'] = 1;
            return $result;
        }else{
            $result['msg'] = '栏目添加失败!';
            $result['code'] = 0;
            return $result;
        }
    }
    /**
     * 修改页面
     * @return [type] [description]
     */
    public function edit()
    {
        $id = input('id');
        $this->assign('module',$this->categorys[$id]['moduleid']);
        $module = db('module')->field('id,title,name')->select();
        $this->assign('modulelist',$module);

        $record = $this->categorys[$id];
        $record['imgUrl'] = imgUrl($record['image']);
        $record['readgroup'] = explode(',',$record['readgroup']);
        $parentid =	intval($record['parentid']);
        $result = $this->categorys;
        foreach($result as $r) {
            if($r['type']==1) continue;
            $r['selected'] = $r['id'] == $parentid ? 'selected' : '';
            $array[] = $r;
        }
        $str  = "<option value='\$id' \$selected>\$spacer \$catname</option>";
        $tree = new Tree ($array);
        $categorys = $tree->get_tree(0, $str,$parentid);
        $this->assign('categorys', $categorys);
        $this->assign('record', $record);
        $usergroup=db('auth_group')->select();
        $this->assign('rlist',$usergroup);
        $this->assign('title','编辑栏目');
        //模版
        $templates= template_file();
        $this->assign ( 'templates',$templates );
        return $this->fetch();
    }
    /**
     * 执行修改
     */
    public function catUpdate()
    {
        $data = input('post.');
        $data['module'] = db('module')->where(array('id'=>$data['moduleid']))->value('name');
        if(!empty($data['readgroup'])){
            $data['readgroup'] = implode(',',$_POST['readgroup']);
        }else{
            $data['readgroup']='';
        }
        $data['arrparentid'] = $this->get_arrparentid($data['id']);
        $data['child'] = ($data['child']==1) ? '1' : '0';
        if (false !==db('category')->update($data)) {
            if($data['child']==1){
                $arrchildid = $this->get_arrchildid($data['id']);
                $data2['ismenu'] = $data['ismenu'];
                $data2['pagesize'] = $data['pagesize'];
                $data2['readgroup'] = $data['readgroup'];
                db('category')->where( ' id in ('.$arrchildid.')')->update($data2);
            }
            $this->repair();
            savecache('Category');
            $result['msg'] = '栏目修改成功!';
            cache('cate', NULL);
            $result['url'] = url('index');
            $result['code'] = 1;
            return $result;
        } else {
            $result['msg'] = '栏目修改失败!';
            $result['code'] = 0;
            return $result;
        }
    }

    /**
     * 修复栏目关系
     */
    public function repair()
    {
        @set_time_limit(500);
        $this->categorys = $categorys = array();
        $categorys =  $this->dao->where("parentid=0")->order('listorder ASC,id ASC')->select();
        $this->set_categorys($categorys);
        if(is_array($this->categorys)) {
            foreach($this->categorys as $id => $cat) {
                if($id == 0 || $cat['type']==1) continue;
                $this->categorys[$id]['arrparentid'] = $arrparentid = $this->get_arrparentid($id);
                $this->categorys[$id]['arrchildid'] = $arrchildid = $this->get_arrchildid($id);
                $this->categorys[$id]['parentdir'] = $parentdir = $this->get_parentdir($id);
                $this->dao->update(array('parentdir'=>$parentdir,'arrparentid'=>$arrparentid,'arrchildid'=>$arrchildid,'id'=>$id));
            }
        }
    }
    /**
     * 修复菜单权限列表里的内容 待优化 递归
     * @return [type] [description]
     */
    public function fixed()
    {
      // dump($this->categorys);
      db('menu')->where('catid','>',0)->delete();
      // exit;
      $catelist0 = db('category')->where('parentid',0)->fetchsql(false)->order('listorder desc')->select();
      foreach ($catelist0 as $key => $value) {
        $data['title'] = $value['catname'];
        $data['href'] = 'Article/index?catid='.$value['id'];
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
      $catelist = db('category')->where('parentid','in',$parentidstr)->fetchsql(false)->order('listorder desc')->select();
      $menulist = db('menu')->where('id','in',$authmenuarr)->fetchsql(false)->select();
    // dump($catelist);exit;  dump($menulist);
      foreach ($menulist as $k => $v) {
        foreach ($catelist as $key => $value) {
          if($value['parentid'] == $v['catid']){
            $data['title'] = $value['catname'];
            $data['href'] = 'Article/index?catid='.$value['id'];
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
      $catelist2 = db('category')->where('parentid','in',$parentidstr2)->fetchsql(false)->order('listorder desc')->select();
      $menulist2 = db('menu')->where('id','in',$authmenuarr2)->fetchsql(false)->select();
      foreach ($menulist2 as $k => $v) {
        foreach ($catelist2 as $key => $value) {
          if($value['parentid'] == $v['catid']){
            $data['title'] = $value['catname'];
            $data['href'] = 'Article/index?catid='.$value['id'];
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

    }

    public function set_categorys($categorys = array())
    {
        if (is_array($categorys) && !empty($categorys)) {
            foreach ($categorys as $id => $c) {
                $this->categorys[$c['id']] = $c;
                $r = $this->dao->where("parentid",$c['id'])->Order('listorder ASC,id ASC')->select();
                $this->set_categorys($r);
            }
        }
        return true;
    }
    /**
     * 获取所有父级id
     * @param  [int] $id          [当前id]
     * @param  string $arrparentid [description]
     * @return [type]              [description]
     */
    public function get_arrparentid($id, $arrparentid = '')
    {
        if(!is_array($this->categorys) || !isset($this->categorys[$id])) return false;
        $parentid = $this->categorys[$id]['parentid'];
        $arrparentid = $arrparentid ? $parentid.','.$arrparentid : $parentid;
        if($parentid) {
            $arrparentid = $this->get_arrparentid($parentid, $arrparentid);
        } else {
            $this->categorys[$id]['arrparentid'] = $arrparentid;
        }
        return $arrparentid;
    }
    /**
     * 获取所有子级id
     * @param  [int] $id [description]
     * @return [type]     [description]
     */
    public function get_arrchildid($id)
    {
        $arrchildid = $id;
        if(is_array($this->categorys)) {
            foreach($this->categorys as $catid => $cat) {
                if($cat['parentid'] && $id != $catid) {
                    $arrparentids = explode(',', $cat['arrparentid']);
                    if(in_array($id, $arrparentids)){
                        $arrchildid .= ','.$catid;
                    }
                }
            }
        }
        return $arrchildid;
    }
    /**
     * 获取父级id目录
     * @param  [type] $id [当前id]
     */
    public function get_parentdir($id)
    {
        if($this->categorys[$id]['parentid']==0){
            return '';
        }
        $arrparentid = $this->categorys[$id]['arrparentid'];
        unset($r);
        if ($arrparentid) {
            $arrparentid = explode(',', $arrparentid);
            $arrcatdir = array();
            foreach($arrparentid as $pid) {
                if($pid==0) continue;
                $arrcatdir[] = $this->categorys[$pid]['catdir'];
            }
            return implode('/', $arrcatdir).'/';
        }
    }
    /**
     * 删除
     */
    public function del()
    {
        $catid = input('param.id');
        $modules = $this->categorys[$catid]['module'];
        $modulesId = $this->categorys[$catid]['moduleid'];
        $scount = $this->dao->where(array('parentid'=>$catid))->count();
        if($scount){
            $result['info'] = '请先删除其子栏目!';
            $result['status'] = 0;
            return $result;
        }

        $module  = db($modules);
        $arrchildid = $this->categorys[$catid]['arrchildid'];

        if($modules != 'page'){
            $fields = F($modulesId.'_Field');
            $fieldse=array();
            foreach ($fields as $k=>$v){
                $fieldse[] = $k;
            }
            if(in_array('catid',$fieldse)){
                $where =  "catid in(".$arrchildid.")";
                $count = $module->where($where)->count();
            }else{
                $count = $module->count();
            }
            if($count){
                $result['info'] = '请先删除该栏目下所有数据!';
                $result['status'] = 0;
                return $result;
            }
        }
        $pid = $this->categorys[$catid]['parentid'];
        $scat = $this->dao->where(array('parentid'=>$pid))->count();
        if($scat==1){
            $this->dao->where(array('id'=>$pid))->update(array('child'=>0));
        }
        $this->dao->where('id in ('.$arrchildid.')')->delete();
        $arr=explode(',',$arrchildid);
        foreach((array)$arr as $r){
            if($this->categorys[$r]['module']=='page'){
                $module=db('page');
                $module->delete($r);
            }
        }
        //删权限
        db('menu')->where('catid',$catid)->delete();
        $this->repair();
        savecache('Category');
        $result['info'] = '栏目删除成功!';
        cache('cate', NULL);
        $result['url'] = url('index');
        $result['status'] = 1;
        return $result;
    }
    /**
     * 排序
     */
    public function cOrder()
    {
        $data = input('post.');
        $this->dao->update($data);
        $result = ['msg' => '排序成功！', 'code' => 1,'url'=>url('index')];
        savecache('Category');
        cache('cate', NULL);
        return $result;
    }
}
