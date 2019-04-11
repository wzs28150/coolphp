<?php
namespace cool;

class Sms
{
    private $sedUrl;
    private $apiKey;
    private $apiSecret;
    private $sign;
    /**
     * 构造方法
     * @param string $apiKey    接口账号
     * @param string $apiSecret 接口密码
     */
    public function __construct()
    {
        $table = db('config');
        $array = array('sms_url', 'sms_appkey', 'sms_secretKey', 'sms_templateCode');
        foreach ($array as $k=>$v) {
          $info[$v] = array_column($table->field('value')->where(['name'=>$v,'inc_type'=>'sms'])->fetchsql(false)->select(),'value')[0];
        }
        $this->sedUrl = $info["sms_url"];
        $this->apiKey = $info["sms_appkey"];
        $this->apiSecret = $info["sms_secretKey"];
        $this->sign = $info["sms_templateCode"];
    }
    /**
     * 短信发送
     * @param string $phone   	手机号码
     * @param string $content 	短信内容
     * @param integer $isreport	是否需要状态报告
     * @return void
     */
    public function send($phone, $content='', $isreport = 1)
    {
        if(!$content){
          $smsCode = rand_string(5, 1);
          $smscontent = '【'.$this->sign.'】您好，您的验证码是:'.$smsCode;
        }
        $requestData = array(
            'un' => $this->apiKey,
            'pw' => $this->apiSecret,
            'sm' => $smscontent,
            'da' => $phone,
            'rd' => $isreport,
            'dc' => 15,
            'rf' => 2,
            'tf' => 3,
        );
        // dump($requestData);
        $url = $this->sedUrl . '?' . http_build_query($requestData);
        // {"success": true, "id": "157936116417279990"}
        $res = $this->object_array(json_decode($this->request($url)));
        if($res['success']){
          if(!$content){
            return $smsCode;
          }else{
            return true;
          }
        }
    }
    /**
     * 请求发送
     * @return string 返回发送状态
     */
    private function request($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    protected function object_array($array)
    {
      if(is_object($array)) {
          $array = (array)$array;
       } if(is_array($array)) {
           foreach($array as $key=>$value) {
               $array[$key] = $this->object_array($value);
               }
       }
       return $array;
    }

}
