<?php
namespace app\api\controller;
use think\Controller;
use think\Cache;
date_default_timezone_set('PRC');
class Common extends Controller
{

    public function _initialize()
    {

    }

    public function object_array($array)
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
    function makeToken($token)
    {
        $key = "yikaobang";
        $jwt = JWT::encode($token, $key);
        return $jwt;
    }
    function decodeToken($jwt)
    {
        $key = "yikaobang";
        JWT::$leeway = 60;
        $decoded = JWT::decode($jwt, $key, array('HS256'));
        $arr = (array)$decoded;
        return $arr;
    }
    public function _empty()
    {
        return $this->error('空操作，返回上次访问页面中...');
    }
}
