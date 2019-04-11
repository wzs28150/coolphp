<?php
namespace app\api\controller;
use think\Config;
use We;
use think\Cache;
class Pay extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $post = input();
        $uid = $post['id'];
        $userinfo = db('member')->field('openid')->find($uid);
        if($userinfo) {
            $openid = $userinfo['openid'];
            $this->openid = $openid;
        }else{
            $result['code'] = 400;
            $result['errmsg'] = '参数错误';
            return $result;
        }

    }
    public function index()
    {
		Cache::clear();
        $config = Config::get('wx');
        $price = db('vipcontent')->find(1);
        $wechat = new \WeChat\Pay($config);

        $options = [
        'body'             => 'Vip办理支付',
        'out_trade_no'     => time(),
        'total_fee'        => $price['yhj'] * 100,
        'openid'           => $this->openid,
        'trade_type'       => 'JSAPI',
        'notify_url'       => 'https://'.$_SERVER['HTTP_HOST'].'/api_notify',
        'spbill_create_ip' => '127.0.0.1',
        ];
        // dump($wechat);
        // exit();
        // 尝试创建订单
        $data = $wechat->createOrder($options);

        // 订单数据处理
        if($data['return_code'] === "SUCCESS") {
            $prepay_id = $data['prepay_id'];
            // 创建微信端发起支付参数及签名
            $options2 = $wechat->createParamsForJsApi($prepay_id);
            // 微信端发起支付参数及签名JSON化
            $result['code'] = 200;
            $result['errmsg'] = '请求成功';
            $result['data'] = $options2;
            return $result;
        }else{
            $result['code'] = 400;
            $result['errmsg'] = '请求失败';
            return $result;
        }

    }
    public function pay()
    {

    }

    public function notify()
    {
        $xml=file_get_contents('php://input', 'r');
        $res=$this->toArray($xml);
        if ($res['return_code'] == 'SUCCESS' && $res['result_code'] == 'SUCCESS') {
            $data['openid'] = $res['openid'];
            $data['sn'] = $res['out_trade_no'];
            $data['price'] = $res['cash_fee'];
            $userinfo = db('member')->where('openid', $data['openid'])->find();
            $data['username'] = $userinfo['name'];
            $data['userid'] = $userinfo['id'];
            $data['tel'] = $userinfo['tel'];
            $data['createtime'] = time();
            $member_setting = db('member_setting')->field('dqsj')->find(1);
			db('member')->where('openid', $data['openid'])->update(['level' => 2]);
            if(intval(date('m'))<=intval($member_setting['dqsj'])) {
                $qssj = strtotime(((date('Y', time())-1).'-'.$member_setting['dqsj']).'-01 00:00:00');
                $dqsj = strtotime(((date('Y', time())).'-'.$member_setting['dqsj']).'-01 00:00:00');

            }else{
                $qssj = strtotime(((date('Y', time())).'-'.$member_setting['dqsj']).'-01 00:00:00');
                $dqsj = strtotime(((date('Y', time())+1).'-'.$member_setting['dqsj']).'-01 00:00:00');
            }
            $orderres = db('order')->field('createtime')->where('openid', $data['openid'])->where('createtime', '<', $dqsj)->where('createtime', '>', $qssj)->order('createtime desc')->fetchsql(false)->find();
            file_put_contents('./notify.text', $orderres);
            if($orderres) {
                $str='<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                echo $str;
            }else{
                db('order')->insert($data);
               
                $str='<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                echo $str;
            }

        }else{
            $str='<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
            echo $str;
        }
    }

    /**
     * 将xml转为array
     *
     * @param  string $xml xml字符串
     * @return array       转换得到的数组
     */
    public function toArray($xml)
    {
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $result= json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $result;
    }
}
