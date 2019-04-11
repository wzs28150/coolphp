<?php
namespace app\home\controller;
use app\admin\controller\Message;

class Index extends Common
{
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        // dump($_SERVER);
        // if($_SERVER["REQUEST_URI"] != "/index.php") {
        //      header('Location:/index.php');
        // }
        // header('Location:/index.php');
        $this->assign('categories', $categories);
        return $this->fetch();
    }
    public function sendbook()
    {
        $message= db('message');
        if (request()->isPost()) {
            // dump(Input());exit;
            $message->data(
                [
                'name' => Input('name'),
                'email' => Input('email'),
                'tel' => Input('tel'),
                'address' => Input('address'),
                'content' => Input('content'),
                'addtime' =>time()
                ]
            );

            $insert_message= $message->insert();
            if ($insert_message) {
                return json(['err_code'=>118,'err_info'=>'成功留言']);
                exit;
            } else {
                return json(['err_code'=>115,'err_info'=>'留言失败']);
                exit;
            }
        }
    }

    public function free()
    {
        $message= db('message');
        if (request()->isPost()) {
            $message->data(
                [
                'name' => Input('name'),
                'tel' => Input('tel'),
                'content' => Input('content'),
                'addtime' =>time()
                ]
            );
            $insert_message= $message->insert();
            if ($insert_message) {
                return json(['err_code'=>118,'err_info'=>'成功留言']);
                exit;
            } else {
                return json(['err_code'=>115,'err_info'=>'留言失败']);
                exit;
            }
        }
    }



    public function search()
    {
        if (request()->isPost()) {

            $list = db('product')
                ->where('title', like, '%'.input('search').'%')
                ->paginate(9);
            // 获取分页显示
            $page = $list->render();

            $this->assign('products', $list);
            $this->assign('page', $page);
        }
        return $this->fetch();
    }

    public function info()
    {

        $newproducts=db('product')->where(array('isnew'=> 1))->select();

        $catdir = db('category')->where(array('id'=>$newproducts[0]['catid']))->field('catdir')->select();

        $this->assign('catdir', $catdir[0]['catdir']);

        return $this->fetch();

    }
}
