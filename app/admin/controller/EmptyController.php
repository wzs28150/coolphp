<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use cool\Form;
class EmptyController extends Common {
    protected $dao, $fields;
    public function _initialize() {
        parent::_initialize();
        // dump(request());
        $this->moduleid = $this->mod[MODULE_NAME];
        $this->dao = db(MODULE_NAME);
        $fields = F($this->moduleid . '_Field');
        foreach ($fields as $key => $res) {
            $res['setup'] = string2array($res['setup']);
            $this->fields[$key] = $res;
        }
        unset($fields);
        unset($res);
        // dump(MODULE_NAME);
        $this->assign('fields', $this->fields);
    }
    public function index() {
        if (request()->isPost()) {
            $request = Request::instance();
            $modelname = strtolower($request->controller());
            $model = db($modelname);
            $keyword = input('post.key');
            $page = input('page') ? input('page') : 1;
            $status = input('status');
            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $order = "listorder asc,id desc";
            // if (input('post.catid')) {
            //     $catids = db('category')->where('parentid', input('post.catid'))->column('id');
            //     if ($catids) {
            //         $catid = input('post.catid') . ',' . implode(',', $catids);
            //     } else {
            //         $catid = input('post.catid');
            //     }
            // }
            $catid = input('post.catid');
            if ($status) {
                $map['status'] = $status;
            }
            if (!empty($keyword)) {
                $map['title'] = array(
                    'like',
                    '%' . $keyword . '%'
                );
            }
            $prefix = config('database.prefix');
            $Fields = Db::getFields($prefix . $modelname);
            foreach ($Fields as $k => $v) {
                $field[$k] = $k;
            }
            if (input('post.catid')) {
                if (in_array('catid', $field)) {
                    $map['catid'] = array(
                        'like',
                        '%' . $catid. '%'
                    );
                }
            }

            // dump($catid);
            if ($modelname == 'lhb') {
                $year = input('year');
                $month = input('month');
                if ($year && $month) {
                    $firsttime = strtotime(date($year . '-' . $month . '-01'));
                    $time = strtotime(date($year . '-' . ($month + 1) . '-01'));
                    $lasttime = strtotime('-1 day', $time);
                } else {
                    $time = strtotime(date('Y-m-01', time()));
                    $lasttime = strtotime('-1 day', $time);
                    $firsttime = strtotime(date('Y-m-01', strtotime('-1 month')));
                }
                $map['createtime'] = [['>=', $firsttime], ['<=', $lasttime], 'and'];
            }
            $gid = session('gid');
            if ($gid > 2) {
                $map['userid'] = session('aid');
            }
            $list = $model->where($map)->order($order)->paginate(array(
                'list_rows' => $pageSize,
                'page' => $page
            ))->toArray();
            // echo $model->getLastSql();
            $rsult['code'] = 0;
            $rsult['msg'] = "获取成功";
            $lists = $list['data'];
            // dump($lists);
            foreach ($lists as $k => $v) {
                $lists[$k]['createtime'] = date('Y-m-d H:i:s', $v['createtime']);
                $lists[$k]['catname'] = getcatname(input('catid'));
                $lists[$k]['catdir'] = getcatname($v['catid'], 'catdir');
                $lists[$k]['userid'] = getadmininfo($v['userid'],'username');
                if ($v['mid']) {
                    $lists[$k]['mid'] = getmemberinfo($v['mid'], 'name');
                    $lists[$k]['oid'] = getoirganizationinfo($v['oid'], 'title');
                }
            }
            $rsult['modelname'] = $modelname;
            $rsult['data'] = $lists;
            $rsult['count'] = $list['total'];
            $rsult['rel'] = 1;
            return $rsult;
        } else {
            $request = Request::instance();
            $modelname = strtolower($request->controller());
            $this->assign('modelname', $modelname);
            return $this->fetch('content/index');
        }
    }
    public function edit() {
        $id = input('id');
        $request = Request::instance();
        $controllerName = $request->controller();
        if ($controllerName == 'Page') {
            $p = $this->dao->where('id', $id)->find();
            if (empty($p)) {
                $data['id'] = $id;
                $data['title'] = $this->categorys[$id]['catname'];
                $data['keywords'] = $this->categorys[$id]['keywords'];
                $this->dao->insert($data);
            }
        }

        $info = $this->dao->where('id', $id)->find();
        $form = new Form($info);
        $returnData['vo'] = $info;
        $returnData['form'] = $form;
        $this->assign('info', $info);
        $this->assign('form', $form);
        $this->assign('title', '编辑内容');
        return $this->fetch('content/edit');
    }
    public function update() {
        $request = Request::instance();
        $controllerName = $request->controller();
        $model = $this->dao;
        $fields = $this->fields;
				// dump(input('post.'));exit;
        $data = $this->checkfield($fields, input('post.'));
        if ($data['code'] == "0") {
            $result['msg'] = $data['msg'];
            $result['code'] = 0;
            return $result;
        }
        if (isset($fields['updatetime'])) {
            $data['userid'] = session('aid');
        }
        if (isset($fields['updatetime'])) {
            $data['updatetime'] = time();
        }
        $title_style = '';
        if (isset($data['style_color'])) {
            $title_style.= 'color:' . $data['style_color'] . ';';
            unset($data['style_color']);
        } else {
            $title_style.= 'color:#222;';
        }
        if (isset($data['style_bold'])) {
            $title_style.= 'font-weight:' . $data['style_bold'] . ';';
            unset($data['style_bold']);
        } else {
            $title_style.= 'font-weight:normal;';
        }
        if ($fields['title']['setup']['style'] == 1) {
            $data['title_style'] = $title_style;
        }
        if ($controllerName != 'Page') {
            $data['updatetime'] = time();
        }
        if (isset($data['isposid'])) {
            $data['isposid'] = implode(',', $data['isposid']);
        }
        if (isset($fields['catid'])) {
          if(is_array($data['catid'])){
            $data['catid'] = implode(',', $data['catid']);
          }
        }
        unset($data['aid']);
        unset($data['pics_name']);
        //编辑多图和多文件
        foreach ($fields as $k => $v) {
            if ($v['type'] == 'files') {
                if (!$data[$k]) {
                    $data[$k] = '';
                }
                $data[$v['field']] = $data['images'];
            }
        }
        // dump($data);exit;
        $list = $model->update($data);
        if (false !== $list) {
            if ($controllerName == 'Page') {
                // $result['url'] = url("admin/category/index");
                $result['url'] = url("/admin/page/edit/", array(
                    'id' => input('backid')
                ));
            } else {
                $result['url'] = url("admin/" . $controllerName . "/index", array(
                    'catid' => input('backid')
                ));
            }
            $result['msg'] = '修改成功!';
            $result['code'] = 1;
            return $result;
        } else {
            $result['msg'] = '修改失败!';
            $result['code'] = 0;
            return $result;
        }
    }
    public function set_categorys($categorys = array()) {
        if (is_array($categorys) && !empty($categorys)) {
            foreach ($categorys as $id => $c) {
                $this->categorys[$c['id']] = $c;
                $r = db('category')->where("parentid = $c[id]")->order('listorder ASC,id ASC')->select();
                $this->set_categorys($r);
            }
        }
        return true;
    }
    public function checkfield($fields, $post) {
        foreach ($post as $key => $val) {
            if (isset($fields[$key])) {
                $setup = $fields[$key]['setup'];
                if (!empty($fields[$key]['required']) && empty($post[$key])) {
                    $result['msg'] = $fields[$key]['errormsg'] ? $fields[$key]['errormsg'] : '缺少必要参数！' . "$key";
                    $result['code'] = 0;
                    return $result;
                }
                if (isset($setup['multiple'])) {
                    if (is_array($post[$key])) {
                        $post[$key] = implode(',', $post[$key]);
                    }
                }
                if (isset($setup['inputtype'])) {
                    if ($setup['inputtype'] == 'checkbox') {
                        $post[$key] = implode(',', $post[$key]);
                    }
                }
                if (isset($setup['type'])) {
                    if ($fields[$key]['type'] == 'checkbox') {
                        $post[$key] = implode(',', $post[$key]);
                    }
                }
                if ($fields[$key]['type'] == 'datetime') {
                    $post[$key] = strtotime($post[$key]);
                } elseif ($fields[$key]['type'] == 'textarea') {
                    $post[$key] = addslashes($post[$key]);
                } elseif($fields[$key]['type']=='linkage'){
                    if($post[$key][0]){
                        $post[$key] = implode(',',$post[$key]);
                    }else{
                        unset($post[$key]);
                    }
                }elseif($fields[$key]['type']=='multicolumn'){
                  // dump($post[$key]);
                    // if($post[$key][0]){
                    //     $post[$key] = implode(',',$post[$key]);
                    // }else{
                    //     unset($post[$key]);
                    // }
                } elseif ($fields[$key]['type'] == 'editor') {
                    if (isset($post['add_description']) && $post['description'] == '' && isset($post['content'])) {
                        $content = stripslashes($post['content']);
                        $description_length = intval($post['description_length']);
                        $post['description'] = str_cut(str_replace(array(
                            "\r\n",
                            "\t",
                            '[page]',
                            '[/page]',
                            '&ldquo;',
                            '&rdquo;'
                        ) , '', strip_tags($content)) , $description_length);
                        $post['description'] = addslashes($post['description']);
                    }
                    if (isset($post['auto_thumb']) && $post['thumb'] == '' && isset($post['content'])) {
                        $content = $content ? $content : stripslashes($post['content']);
                        $auto_thumb_no = intval($post['auto_thumb_no']) * 3;
                        if (preg_match_all("/(src)=([\"|']?)([^ \"'>]+\.(gif|jpg|jpeg|bmp|png))\\2/i", $content, $matches)) {
                            $post['thumb'] = $matches[$auto_thumb_no][0];
                        }
                    }
                }
            }
        }
        return $post;
    }
    public function add() {
        $form = new Form();
        $this->assign('form', $form);
        $this->assign('title', '添加内容');
        return $this->fetch('content/edit');
    }
    public function insert() {
        $request = Request::instance();
        $controllerName = $request->controller();
        $model = $this->dao;
        $fields = $this->fields;
        $data = $this->checkfield($fields, input('post.'));
        // ["title-morevideo"] =&gt; array(3) {
        //   [0] =&gt; string(3) "111"
        //   [1] =&gt; string(3) "222"
        //   [2] =&gt; string(3) "333"
        // }
        // ["url-morevideo"] =&gt; array(3) {
        //   [0] =&gt; string(3) "111"
        //   [1] =&gt; string(3) "222"
        //   [2] =&gt; string(3) "333"
        // }
        // ["description-morevideo"] =&gt; array(3) {
        //   [0] =&gt; string(3) "111"
        //   [1] =&gt; string(3) "222"
        //   [2] =&gt; string(3) "333"
        // }
        // dump($data);exit;
        if (isset($data['code']) && $data['code'] == 0) {
            return $data;
        }
        if ($fields['createtime'] && empty($data['createtime'])) {
            $data['createtime'] = time();
        }
        if ($fields['updatetime'] && empty($data['updatetime'])) {
            $data['updatetime'] = time();
        }
        if ($controllerName != 'Page') {
            if ($fields['updatetime']) {
                $data['updatetime'] = $data['createtime'];
            }
        }
        $data['userid'] = session('aid');
        $data['username'] = session('username');
        $title_style = '';
        if (isset($data['style_color'])) {
            $title_style.= 'color:' . $data['style_color'] . ';';
            unset($data['style_color']);
        } else {
            $title_style.= 'color:#222;';
        }
        if (isset($data['style_bold'])) {
            $title_style.= 'font-weight:' . $data['style_bold'] . ';';
            unset($data['style_bold']);
        } else {
            $title_style.= 'font-weight:normal;';
        }
        if ($fields['title']['setup']['style'] == 1) {
            $data['title_style'] = $title_style;
        }
        $aid = $data['aid'];
        unset($data['style_color']);
        unset($data['style_bold']);
        unset($data['aid']);
        unset($data['pics_name']);
        //编辑多图和多文件
        foreach ($fields as $k => $v) {
            if ($v['type'] == 'files') {
                if (!$data[$k]) {
                    $data[$k] = '';
                }
                $data[$v['field']] = $data['images'];
            }
        }
        $id = $model->insertGetId($data);
        if ($id !== false) {
            $catid = $controllerName == 'page' ? $id : $data['catid'];
            if ($aid) {
                $Attachment = db('attachment');
                $aids = implode(',', $aid);
                $data2['id'] = $id;
                $data2['catid'] = $catid;
                $data2['status'] = '1';
                $Attachment->where("aid in (" . $aids . ")")->update($data2);
            }
            if ($controllerName == 'page') {
                $result['url'] = url("admin/page/edit/id/".$data['catid'].".html");
            } else {
                $result['url'] = url("admin/" . $controllerName . "/index", array(
                    'catid' => $data['catid']
                ));
            }
            $result['msg'] = '添加成功!';
            $result['code'] = 1;
            return $result;
        } else {
            $result['msg'] = '添加失败!';
            $result['code'] = 0;
            return $result;
        }
    }
    public function listDel() {
        $id = input('post.id');
        $model = $this->dao;
        $model->where(array(
            'id' => $id
        ))->delete(); //转入回收站
        return ['code' => 1, 'msg' => '删除成功！'];
    }
    public function delAll() {
        $map['id'] = array(
            'in',
            input('param.ids/a')
        );
        $model = $this->dao;
        $model->where($map)->delete();
        $result['code'] = 1;
        $result['msg'] = '删除成功！';
        $result['url'] = url('index', array(
            'catid' => input('post.catid')
        ));
        return $result;
    }
    public function listorder() {
        $model = $this->dao;
        $catid = input('catid');
        $data = input('post.');
        $model->update($data);
        $result = ['msg' => '排序成功！', 'url' => url('index', array(
            'catid' => $catid
        )) , 'code' => 1];
        return $result;
    }
    public function delImg() {
        $file = ROOT_PATH . __PUBLIC__ . input('post.url');
        if (file_exists($file)) {
            is_dir($file) ? dir_delete($file) : unlink($file);
        }
        if (input('post.id')) {
            $picurl = input('post.picurl');
            $picurlArr = explode(':', $picurl);
            $pics = substr(implode(":::", $picurlArr) , 0, -3);
            $model = $this->dao;
            $map['id'] = input('post.id');
            $model->where($map)->update(array(
                'pics' => $pics
            ));
        }
        $result['msg'] = '删除成功!';
        $result['code'] = 1;
        return $result;
    }
    public function listStatus() {
        $id = Input('id');
        if (Input('status') == 1) {
            $status = 3;
        } else {
            $status = 1;
        }
        // echo $status;
        $data['status'] = $status;
        $res = db('article')->where('id', $id)->update($data);
        if ($res) {
            if (Input('status') == 1) {
                $result['url'] = url('Article/index?status=3');
            }
            $result['msg'] = '修改成功!';
            $result['code'] = 1;
            return $result;
        } else {
            $result['msg'] = '修改失败!';
            $result['code'] = 0;
            return $result;
        }
    }
    public function getRegion(){
        $Region=db("region");
        $map['pid'] = input("pid");
        $list=$Region->where($map)->select();
        return $list;
    }
}
