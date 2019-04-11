<?php
namespace app\api\controller;
use think\Controller;
use think\Input;
use think\Db;
use think\Request;
use think\Config;
use think\Cache;
use app\api\controller\Common;
class Weixin extends Common
{
    //默认配置
    protected $config = [
        'url' => "https://api.weixin.qq.com/sns/jscode2session", //微信获取session_key接口url
        'appid' => 'your appId', // APPId
        'secret' => 'your secret', // 秘钥
        'grant_type' => 'authorization_code', // grant_type，一般情况下固定的
    ];

    public function _initialize()
    {
        parent::_initialize();
        if ($wx = Config::get('wx')) {
            $this->config = array_merge($this->config, $wx);
        }
        $code = input("code", '', 'htmlspecialchars_decode');
        if($code) {
            $this->code = input("code", '', 'htmlspecialchars_decode');
        }else{
            $result['code'] = 400;
            $result['msg'] = '缺少必要的参数!';
            return $result;
        }
        $this->params = [
            'appid' => $this->config['appid'],
            'secret' => $this->config['secret'],
            'js_code' => $code,
            'grant_type' => $this->config['grant_type']
        ];
        $post = input();
    }

    public function checklogin()
    {
        $id = input('id');
        $info = db('member')->find($id);
        if ($info) {
            if(!cache('myschool'.$id)) {
                 $x = $info['tkfs'];
                 $y = $info['gkfs'];
                 $school = cache('school');
                 $zyfsarray = array_column($school, 'zyfs');
                 $sys = db('system')->find(1);
                 $otherstr = $sys['others'];
                 $otherarr = unserialize($otherstr);
                 $list = array();
                foreach ($zyfsarray as $key => $value) {
                    if($value && $value!='[]') {
                         $arr = $this->object_array(json_decode($value));
                        foreach ($arr as $k => $v) {
                            if($v['wkzdf'] && $v['lkzdf'] && $v['gongshi']) {
                                 $chongarr = explode('-', $otherarr['chong']);
                                 $wenarr = explode('-', $otherarr['wen']);
                                 $baoarr = explode('-', $otherarr['bao']);
                                 $num = '';
                                 $formula = '$num ='.$v['gongshi'].';';
                                 $formula = str_replace("%", "/100", $formula);
                                 $formula = str_replace("（", "(", $formula);
                                 $formula = str_replace("）", ")", $formula);
                                 // dump($formula);
                                 eval($formula);
                                 // echo  $num;
                                if($info['cjfl'] == 1) {
                                    // 文科
                                    if($num > $v['wkzdf']-$chongarr[1] && $num  < $v['wkzdf']-$chongarr[0]) {
                                         $v['result'] = 1;
                                    } elseif($num >= $v['wkzdf']+$wenarr[0] && $num  <= $v['wkzdf']+$wenarr[1]) {
                                        $v['result'] = 2;
                                    } elseif($num > $v['wkzdf']+$baoarr[0] && $num  < $v['wkzdf']+$baoarr[1]) {
                                        $v['result'] = 3;
                                    }
                                } else {
                                    // echo $v['lkzdf']-$chongarr[1];
                                    if($num > $v['lkzdf']-$chongarr[1] && $num  < $v['lkzdf']-$chongarr[0]) {
                                        $v['result'] = 1;
                                    } elseif($num >= $v['lkzdf']+$wenarr[0] && $num  <= $v['lkzdf']+$wenarr[1]) {
                                        $v['result'] = 2;
                                    } elseif($num > $v['lkzdf']+$baoarr[0] && $num  < $v['lkzdf']+$baoarr[1]) {
                                        $v['result'] = 3;
                                    }
                                }
                                if($v['result']) {
                                    $v['school'] = $school[$key]['school'];
                                    $v['title_thumb'] =  $school[$key]['title_thumb'];
                                    $v['isjianzhang'] = $school[$key]['isjianzhang'];
                                    $v['city'] = $school[$key]['city'];
                                    // dump($school[$key]['leibie']);
                                    $v['leibie'] = $school[$key]['leibie'];
                                    $v['pici'] = $school[$key]['pici'];

                                    $v['id'] = $school[$key]['id'];
                                    $v['year'] = $school[$key]['year'];
                                    // dump($v);
                                    array_push($list, $v);
                                }

                            }
                        }
                    }
                }
                 cache('myschool'.$id, $list, 0);
            }
            unset($info['openid']);
            $mid = $info['major'];
            $major = db('tag')->find($mid);
            session('id', $id);
            $data['session_id'] = session_id();
            $data['major'] = $major['title'];
            $data['code'] = 200;
            $data['info'] = $info;
            return $data;
            exit;
        } else {
            $data['code'] = 500;
            return $data;
            exit;
        }

    }

    public function login()
    {
        // 获取openid
        $res = $this->makeRequest($this->config['url'], $this->params);
        if ($res['code'] !== 200 || !isset($res['result']) || !isset($res['result'])) {
            return ['code'=>ErrorCode::$RequestTokenFailed, 'message'=>'请求Token失败'];
        }
        $reqData = json_decode($res['result'], true);
        if (!isset($reqData['session_key'])) {
            return ['code'=>$this->RequestTokenFailed, 'message'=>'请求Token失败'];
        }
        $openid = $reqData['openid'];
        $sessionKey = $reqData['session_key'];
        $time = time(); //当前时间
        $tokenarr = array(
          "openid" => $openid,
          "sessionKey" => $sessionKey,
          'exp' => $time + 7200
        );
        $token = parent::makeToken($tokenarr);
        session('openid', $openid);
        session('token', $token);
        session('sessionKey', $sessionKey);
        // echo session('openid');
        // 根据openid 查询用户是否存在于数据库
        $map['openid'] = $reqData['openid'];
        $res = $this->isMember($map);
        if ($res) {
            // 更新token
            $this->memberUpdate($openid, $token, $sessionKey);
            // 存在 返回数据
            $mid = $res['major'];
            $major = db('tag')->find($mid);
            $data['major'] = $major['title'];
            $data['info'] = $res;
            $data['res_code'] = 200;
        } else {
            // 不存在 返回 拉起注册
            $data['res_code'] = 201;
        }
        $data['majorlist'] = $this->getmajor();
        $data['session_id'] = session_id();
        $data['token'] = $token;
        $data['msg'] = '请求成功';
        return $data;
        exit;

    }
    /**
     * 用户不存在执行注册
     *
     * @return [type] [description]
     */
    public function regetToken()
    {
        $openid = session('openid');
        $sessionKey = session('sessionKey');
        $user_info = input();
        $user_info = $user_info['user_info'];
        // dump($user_info);exit;
        $res = $this->memberInsert($openid, $user_info, $sessionKey);
        $map['openid'] = $openid;
        $info = $this->getMember($map);
        $data['info'] = $info;
        $result['code'] = 200;
        $result['msg'] = '请求成功';
        $result['data'] = $info;
        return $result;
        exit;
    }

    public function checkToken()
    {
        $post = input();
        $id = $post['uid'];
        if(cache('info'.$id)) {
            $result['code'] = 200;
            $result['msg'] = '请求成功';
            $result['data'] = cache('info'.$id);
            return $result;
        }else{
            $info = db('member')->find($id);
            if($info) {
                session('openid', $info['openid']);
                $data['session_id'] = session_id();
                $data['token'] = $token;
                $map['id'] = $id;
                $data['info'] = $this->getMember($map);
                $data['majorlist'] = $this->getmajor();
                $data['major'] = getmajor1($info['major']);
                cache('info'.$id, $data, 0);
                $result['code'] = 200;
                $result['msg'] = '请求成功';
                $result['data'] = $data;
                return $result;
            } else {
                $result['code'] = 400;
                $result['msg'] = '请求失败';
                return $result;
            }
        }
    }

    public function getmajor()
    {
        $list = db('tag')->field('id,title')->where('catid', 42)->select();
        $status = db('member_setting')->field('status')->find(1);
        $system = db('system')->field('others')->find(1);
        $uncertainty = unserialize($system['others']);
        $scoreinfo = $uncertainty['scoreinfo'];
        // $data['list'] = $list;
        // $data['scoreinfo'] = $scoreinfo;
        return $list;
    }
    /**
     * 判断用户是否存在
     *
     * @param  [type] $openid [openid]
     * @return boolean         [如果存在返回个人信息不存在返回false]
     */
    protected function isMember($where)
    {
        $res = db('member')->where($where)->find();
        if($res) {
            return $res;
        }else{
            return false;
        }
    }
    protected function getMember($where,$isAll = false)
    {
        $info = db('member')->where($where)->find();
        if($info) {
            if(!$isAll) {
                unset($info['openid']);
                unset($info['token']);
                unset($info['mobileinfo']);
                unset($info['sessionkey']);
            }
            return $info;
        }else{
            return false;
        }
    }
    protected function memberInsert($openid,$user_info,$sessionKey)
    {
        $data['openid'] = $openid;
        $data['sessionkey'] = $sessionKey;
        $data['addtime'] = time();
        $data['token'] = session('token');
        $data['nickname'] = $user_info;
        $data['level'] = 1;
        $res = db('member')->insertGetId($data);
        if($res) {
            return $res;
        }else{
            return false;
        }
    }

    protected function memberUpdate($openid,$token,$sessionKey)
    {
        $data['token'] = $token;
        $data['sessionkey'] = $sessionKey;
        try {
            $res = db('member')->where('openid', $openid)->update($data);
            return true;
        } catch (Exception $e) {
            return true;
        }

    }
    /**
     * 发起http请求
     *
     * @param  string $url    访问路径
     * @param  array  $params 参数，该数组多于1个，表示为POST
     * @param  int    $expire 请求超时时间
     * @param  array  $extend 请求伪造包头参数
     * @param  string $hostIp HOST的地址
     * @return array    返回的为一个请求状态，一个内容
     */
    protected function makeRequest($url, $params = array(), $expire = 0, $extend = array(), $hostIp = '')
    {
        if (empty($url)) {
            return array('code' => '100');
        }

        $_curl = curl_init();
        $_header = array(
            'Accept-Language: zh-CN',
            'Connection: Keep-Alive',
            'Cache-Control: no-cache'
        );
        // 方便直接访问要设置host的地址
        if (!empty($hostIp)) {
            $urlInfo = parse_url($url);
            if (empty($urlInfo['host'])) {
                $urlInfo['host'] = substr(DOMAIN, 7, -1);
                $url = "http://{$hostIp}{$url}";
            } else {
                $url = str_replace($urlInfo['host'], $hostIp, $url);
            }
            $_header[] = "Host: {$urlInfo['host']}";
        }

        // 只要第二个参数传了值之后，就是POST的
        if (!empty($params)) {
            curl_setopt($_curl, CURLOPT_POSTFIELDS, http_build_query($params));
            curl_setopt($_curl, CURLOPT_POST, true);
        }

        if (substr($url, 0, 8) == 'https://') {
            curl_setopt($_curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($_curl, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($_curl, CURLOPT_URL, $url);
        curl_setopt($_curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($_curl, CURLOPT_USERAGENT, 'API PHP CURL');
        curl_setopt($_curl, CURLOPT_HTTPHEADER, $_header);

        if ($expire > 0) {
            curl_setopt($_curl, CURLOPT_TIMEOUT, $expire); // 处理超时时间
            curl_setopt($_curl, CURLOPT_CONNECTTIMEOUT, $expire); // 建立连接超时时间
        }

        // 额外的配置
        if (!empty($extend)) {
            curl_setopt_array($_curl, $extend);
        }

        $result['result'] = curl_exec($_curl);
        $result['code'] = curl_getinfo($_curl, CURLINFO_HTTP_CODE);
        $result['info'] = curl_getinfo($_curl);
        if ($result['result'] === false) {
            $result['result'] = curl_error($_curl);
            $result['code'] = -curl_errno($_curl);
        }

        curl_close($_curl);
        return $result;
    }

    public function setMemberInfo()
    {
        $post = input();
        $data = $post['Data'];
        // dump($post);exit;
        $tkfs = $data['tkfs'];
        $major = $data['major'];
        $data['paiming'] = $this->getnum($tkfs, $major);
        $id = $data['id'];
        $map['id'] = $id;

        $yzm = $data['yzm'];
        if($yzm != session('smsCode')) {
            $result['code'] = 402;
            $result['msg'] = '短信验证码错误！';
            return $result;
        }
        // echo $this->isMember($map);
        $res = $this->isMember($map);
        if($res) {
            $time = time(); //当前时间
            // dump($data); exit;
            $res = db('member')->where('id', $id)->update($data);
            $map['id'] = $id;
            $data = $this->getMember($map, false);
            $mid = $data['major'];
            $major = db('tag')->find($mid);
            Cache::clear();
            $data['majortitle'] = $major['title'];
            $result['token'] = $token;
            $result['code'] = 200;
            $result['msg'] = '请求成功';
            $result['data'] = $data;
            return $result;
        }
    }
    public function getnum($tkfs,$major)
    {
        $next = db('excel')->field('subnum')->where('score', '<=', $tkfs)->where('major', $major)->order('score desc')->fetchsql(false)->find();
        // echo $next;exit;
        return $next["subnum"];
    }

    public function datainfo()
    {
        db('article')->where('id', input('id'))->setInc('hits');
        $info = db('article')->where('id', input('id'))->cache(true)->find();
        $info['pic'] = $info['pic']?__PUBLIC__.$info['pic']:__HOME__."/images/sample-images/blog-post".rand(1, 3).".jpg";
        $title_style = explode(';', $info['title_style']);
        $info['title_color'] = $title_style[0];
        $info['title_weight'] = $title_style[1];
        $title_thumb = $info['thumb'];
        $info['title_thumb'] = $title_thumb?__PUBLIC__.$title_thumb:__HOME__.'/images/sample-images/blog-post'.rand(1, 3).'.jpg';
        $info['content'] = str_replace('https://yikaobang.hrbkcwl.com', 'https://mini.hljykb.com', $info['content']);
        $this->assign('info', $info);
        return view('data/datainfo');
    }

    public function delschooltyoe()
    {
      echo 1;
    }
}
