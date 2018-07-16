<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use cool\Leftnav;
use app\admin\model\System as SysModel;
class System extends Common
{
    /********************************站点管理*******************************/
    //站点设置
    public function system($sys_id=1){
        $table = db('system');
        if(request()->isPost()) {
            $post = input('post.');  //获取过滤后全部post变量

              $datas['name'] =input('post.name');   //名字
              $datas['url']  =input('post.url');    //url
              $datas['title']  =input('post.title');//头部
              $datas['key']  =input('post.key');    //网站名称
              $datas['des']  =input('post.des');    //网站名称
              $datas['bah']  =input('post.bah');    //备案号
              $datas['copyright']  =input('post.copyright'); //copyright
              $datas['logo']  =input('post.logo');

              $un = array('name','url','title','key','des','bah','copyright','logo');
                  foreach ($post as $key => $value) {
                      foreach ($un as $key1 => $value1) {
                        if ($value1 == $key) {
                          unset($post[$key]);
                        }
                      }
                  }

            $datas['others'] = serialize($post);  //序列化

            if($table->where('id',1)->update($datas)!==false) {
                savecache('System');
                return json(['code' => 1, 'msg' => '站点设置保存成功!', 'url' => url('system/system')]);
            } else {
                return json(array('code' => 0, 'msg' =>'站点设置保存失败！'));
            }
        }else{
            $system = $table->field('id,name,url,title,key,des,bah,copyright,logo,others')->find($sys_id);

            $uncertainty = unserialize($system['others']);//把不确定的给反序列化了
            // dump($uncertainty);
            $this->assign('uncertainty',$uncertainty);
            $this->assign('system', $system);
            return $this->fetch();
        }
    }
    public function email(){
        $table = db('config');
        if(request()->isPost()) {
            $datas = input('post.');
            foreach ($datas as $k=>$v){
                $table->where(['name'=>$k,'inc_type'=>'smtp'])->update(['value'=>$v]);
            }
            return json(['code' => 1, 'msg' => '邮箱设置成功!', 'url' => url('system/email')]);
        }else{
            $smtp = $table->where(['inc_type'=>'smtp'])->select();
            $info = convert_arr_kv($smtp,'name','value');
            $this->assign('info', $info);
            return $this->fetch();
        }
    }
    public function trySend(){
        $sender = input('email');
        //检查是否邮箱格式
        if (!is_email($sender)) {
            return json(['code' => -1, 'msg' => '测试邮箱码格式有误']);
        }
        $send = send_email($sender, '测试邮件', '您好！这是一封来自'.$this->system['name'].'的测试邮件！');
        if ($send) {
            return json(['code' => 1, 'msg' => '邮件发送成功！']);
        } else {
            return json(['code' => -1, 'msg' => '邮件发送失败！']);
        }
    }

}
