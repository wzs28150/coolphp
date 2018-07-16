<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Input;
use app\admin\controller\SysInfo;
class Index extends Common
{
    public function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        //导航
        // 获取缓存数据
        $authRule = cache('authRule');
        if(!$authRule){
            $authRule = db('auth_rule')->where('menustatus=1')->order('sort')->select();
            cache('authRule', $authRule, 3600);
        }
        //声明数组
        $menus = array();
        foreach ($authRule as $key=>$val){
            $authRule[$key]['href'] = url($val['href']);
            if($val['pid']==0){
                if(session('gid')!=1){
                    if(in_array($val['id'],$this->adminRules)){
                        $menus[] = $val;
                    }
                }else{
                    $menus[] = $val;
                }
            }
        }
        foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['pid']){
                    if(session('gid')!=1) {
                        if (in_array($vv['id'], $this->adminRules)) {
                            $menus[$k]['children'][] = $vv;
                        }
                    }else{
                        $menus[$k]['children'][] = $vv;
                    }
                }
            }
        }

        foreach ($menus as $k=>$v){
          foreach ($v['children'] as $kk=>$vv){
            foreach ($authRule as $kkk=>$vvv){
              if($vv['id']==$vvv['pid']){
                if(session('gid')!=1) {
                    if (in_array($vv['id'], $this->adminRules)) {
                        $menus[$k]['children'][$kk]['children'][] = $vvv;
                    }
                }else{
                    $menus[$k]['children'][$kk]['children'][] = $vvv;
                }
              }
            }
          }
        }
        // dump($menus);
        $this->assign('menus', $menus);
        return $this->fetch();
    }
    public function getleftnav(){
      $authRule = cache('authRule');
      if (!$authRule) {
          $authRule = db('auth_rule')->where('menustatus=1')->order('sort asc,pid asc')->select();
          // dump($authRule);exit;
          cache('authRule', $authRule, 3600);
      }

      $topid = Input('topid');

      // dump($authRule);
      // dump($topid);exit;
      // 声明菜单数组数组
      $menus = array();
      $topmenus = array();
      foreach ($authRule as $key=>$val) {
          $authRule[$key]['href'] = url($val['href']);
          if ($val['pid']==0) {
              // if (session('aid')!=1) {
              //     if (in_array($val['id'], $this->adminRules)) {
              //         $topmenus[] = $val;
              //     }
              // } else {
              //     $topmenus[] = $val;
              // }
          }else{
            if($val['pid'] == $topid){
              if (session('gid')!=1) {
                  if (in_array($val['id'], $this->adminRules)) {
                      $menus[] = $val;
                  }
              } else {
                  $menus[] = $val;
              }
            }
          }
      }
      foreach ($menus as $k=>$v) {
          foreach ($authRule as $kk=>$vv) {
              if ($v['id']==$vv['pid']) {
                  if (session('aid')!=1) {
                      if (in_array($vv['id'], $this->adminRules)) {
                          $menus[$k]['children'][] = $vv;
                      }
                  } else {
                      $menus[$k]['children'][] = $vv;
                  }
              }
          }
      }
      echo  json_encode($menus, true);
    }
    /**
     * 首页主体展示
     */
    public function main()
    {
        $version = Db::query('SELECT VERSION() AS ver');
        $config  = [
            'url'             => $_SERVER['HTTP_HOST'],
            'document_root'   => $_SERVER['DOCUMENT_ROOT'],
            'server_os'       => PHP_OS,
            'server_port'     => $_SERVER['SERVER_PORT'],
            'server_ip'       => $_SERVER['SERVER_ADDR'],
            'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
            'php_version'     => PHP_VERSION,
            'mysql_version'   => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize')
        ];

        $this->assign('config', $config);
        //获取快捷插件列表
        $addons = db('addons')->where('has_adminlist',1)->select();
        $this->assign('addons', $addons);
        $this->assign('addonsnum', count($addons));
        //磁盘信息
        $disk = round(100 - disk_free_space($_SERVER['DOCUMENT_ROOT'])/disk_total_space($_SERVER['DOCUMENT_ROOT'])*100,2);
        $this->assign('disk', $disk);
        //待审文章
        $dsarticle = db('article')->where('status',3)->count();
        $this->assign('dsarticle', $dsarticle);
        //待审评论
        $dscomment = db('comment')->where('status','<>',1)->count();
        $this->assign('dscomment', $dscomment);
        //待处理报修
        $dsrepairs = db('repairs')->where('status','<>',1)->count();
        $this->assign('dsrepairs', $dsrepairs);

        //待阅首长信箱
        $letter = db('letter')->where('recontent','null')->fetchsql(false)->count();
        $this->assign('letter', $letter);
        return $this->fetch();
    }

    public function getpv()
    {
      $stattime = strtotime(date("Y-m-d"), time());
      $shijianxian = Db::query("select date(from_unixtime(stattime)) as riqi, sum(pv)as pvnum,sum(uv)as uvnum,sum(ip)as ipnum   from cool_visit_detail where from_unixtime(stattime) >= date(now()) - interval 7 day group by day(from_unixtime(stattime));");
      $riqistr = '';
      $pvstr = '';
      $uvstr = '';
      $ipstr = '';
      // dump($shijianxian);
      foreach ($shijianxian as $key => $value) {
          // $riqistr.=',"'.$value['riqi'].'"';
          // $pvstr.=','.$value['pvnum'];
          // $uvstr.=','.$value['uvnum'];
          // $ipstr.=','.$value['ipnum'];
          $riqistr[$key] = $value['riqi'];
          $pvstr[$key] = $value['pvnum'];
          $uvstr[$key] = $value['uvnum'];
      }
      // $riqistr = substr($riqistr, 1);
      // $pvstr = substr($pvstr, 1);
      // $uvstr = substr($uvstr, 1);
      // $ipstr = substr($ipstr, 1);
      $result['riqistr'] = $riqistr;
      $result['pvstr'] = $pvstr;
      $result['uvstr'] = $uvstr;
      // $result['ipstr'] = $ipstr;
      return $result;
    }
    public function getnews()
    {
      $list = db('article')->where('status',1)->order('hits desc')->limit(10)->select();
      $rsult['code'] = 0;
      $rsult['msg'] = "";
      foreach ($list as $k=>$v ){
          $list[$k]['createtime'] = date('Y-m-d H:i:s',$v['createtime']);
          $list[$k]['catid'] = getcatname($v['catid']);
      }
      $rsult['data'] = $list;
      $rsult['count'] = 10;
      $rsult['rel'] = 1;
      return $rsult;
    }
    public function getsysinfo()
    {
      $type=input('type');
      $info = new SysInfo();
      $memory = $info->getMemoryUsage();
      $cpu = $info->getCpuUsage();
      if($memory){
        cookie('memory',$memory['usage']);
      }
      if($cpu){
        cookie('cpu',$cpu);
      }
      $data['cpu'] = cookie('cpu');
      $data['memory'] = cookie('memory');
      echo json_encode($data);
    }
    /**
     * seo 显示
     * @return [type] [description]
     */
    // public function seo()
    // {
    //     if (!function_exists('fsocketopen') && !function_exists('curl_init')) {
    //         echo '没有支持的curl或fsocketopen组件';
    //         exit;
    //     }
    //
    //     $seo_info = array();
    //     $seo_info = db('plus_seoinfo')->order('id desc')->find();
    //     //dump($seo_info); exit;
    //     $now = time();
    //     if (empty($seo_info) or $now - $seo_info['create_time'] > 60*60*6) {
    //         $site = str_replace(array("http://",'/'), '', 'http://www.hrbkcwl.com');
    //         $url = "http://www.alexa.com/siteinfo/{$site}";
    //         $html = $this->seo_http_send($url);
    //         //var_dump($html);exit;
    //         if (preg_match("#API at http://aws.amazon.com/awis -->(.*)</strong>#isU", $html, $matches)) {
    //             $seo_info['alexa_num'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['alexa_num'] = $seo_info['alexa_num'] = empty($seo_info['alexa_num'])? 0 : $seo_info['alexa_num'];
    //         if (preg_match("#Flag'><strong class=\"metrics-data align-vmiddle\">(.*)</strong>#isU", $html, $matches)) {
    //             $seo_info['alexa_area_num'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['alexa_area_num'] = $seo_info['alexa_area_num'] = empty($seo_info['alexa_area_num'])? 0 : $seo_info['alexa_area_num'];
    //
    //         $baiduurl = "http://www.baidu.com/s?wd=site:{$site}";
    //         $baiduhtml = Html2Text($this->seo_http_send($baiduurl));
    //         //echo $baiduhtml;exit;
    //         if (preg_match("#结果数约([\d]+)个#", $baiduhtml, $matches)) {
    //             $seo_info['baidu_count'] = isset($matches[1])? $matches[1] : 0;
    //         }
    //         if (empty($seo_info['baidu_count']) and preg_match("#网站共有([\d, ]+)个#", $baiduhtml, $matches)) {
    //             $seo_info['baidu_count'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['baidu_count'] = $seo_info['baidu_count'] = empty($seo_info['baidu_count'])? 0 : $seo_info['baidu_count'];
    //
    //         $baiduflurl = "http://www.baidu.com/s?wd=domain:{$site}";
    //         $baiduflhtml = Html2Text($this->seo_http_send($baiduflurl));
    //         //echo $baiduflhtml;exit;
    //         if (preg_match("#相关结果约([\d]+)个#", $baiduflhtml, $matches)) {
    //             $seo_info['baidu_fl_count'] = isset($matches[1])? $matches[1] : 0;
    //         }
    //         if (empty($seo_info['baidu_count']) and preg_match("#网站共有([\d, ]+)个#", $baiduflhtml, $matches)) {
    //             $seo_info['baidu_fl_count'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['baidu_fl_count'] = $seo_info['baidu_fl_count'] = empty($seo_info['baidu_fl_count'])? 0 : $seo_info['baidu_fl_count'];
    //
    //         $sogouurl = "http://www.sogou.com/web?query=site:{$site}";
    //         $sogouhtml = Html2Text($this->seo_http_send($sogouurl));
    //         if (preg_match("#结果数约([\d]+)个#", $sogouhtml, $matches)) {
    //             $seo_info['sogou_count'] = isset($matches[1])? $matches[1] : 0;
    //         }
    //         if (empty($seo_info['sogou_count']) and preg_match("#找到约([\d, ]+)条结果#", $sogouhtml, $matches)) {
    //             $seo_info['sogou_count'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['sogou_count'] = $seo_info['sogou_count'] = empty($seo_info['sogou_count'])? 0 : $seo_info['sogou_count'];
    //
    //         $haosouurl = "http://www.haosou.com/s?q=site%3A{$site}";
    //         $haosouhtml = Html2Text($this->seo_http_send($haosouurl));
    //         if (preg_match("#结果数约([\d]+)个#", $haosouhtml, $matches)) {
    //             $seo_info['haosou360_count'] = isset($matches[1])? $matches[1] : 0;
    //         }
    //         if (empty($seo_info['haosou360_count']) and preg_match("#结果约([\d, ]+)个#", $haosouhtml, $matches)) {
    //             $seo_info['haosou360_count'] = isset($matches[1])? trim($matches[1]) : 0;
    //         }
    //         $data['haosou360_count'] = $seo_info['haosou360_count'] = empty($seo_info['haosou360_count'])? 0 : $seo_info['haosou360_count'];
    //         $data['create_time'] = time();
    //         $res = db('plus_seoinfo')->insert($data);
    //     }
    //     echo json_encode($seo_info);
    //     exit;
    // }
    /**
     * 获取seo信息
     * @param  [type]  $url     [description]
     * @param  integer $limit   [description]
     * @param  string  $post    [description]
     * @param  string  $cookie  [description]
     * @param  integer $timeout [description]
     * @return [type]           [description]
     */
    // private function seo_http_send($url, $limit=0, $post='', $cookie='', $timeout=5)
    // {
    //     $return = '';
    //     $matches = parse_url($url);
    //     $scheme = $matches['scheme'];
    //     $host = $matches['host'];
    //     $path = $matches['path'] ? $matches['path'].(@$matches['query'] ? '?'.$matches['query'] : '') : '/';
    //     $port = !empty($matches['port']) ? $matches['port'] : 80;
    //
    //     if (function_exists('curl_init') && function_exists('curl_exec')) {
    //         $ch = curl_init();
    //         curl_setopt($ch, CURLOPT_URL, $scheme.'://'.$host.':'.$port.$path);
    //         curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //         curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    //         curl_setopt($ch, CURLOPT_USERAGENT, @$_SERVER['HTTP_USER_AGENT']);
    //         if ($post) {
    //             curl_setopt($ch, CURLOPT_POST, 1);
    //             $content = is_array($port) ? http_build_query($post) : $post;
    //             curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
    //         }
    //         if ($cookie) {
    //             curl_setopt($ch, CURLOPT_COOKIE, $cookie);
    //         }
    //         curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    //         curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
    //         $data = curl_exec($ch);
    //         $status = curl_getinfo($ch);
    //         $errno = curl_errno($ch);
    //         curl_close($ch);
    //         if ($errno || $status['http_code'] != 200) {
    //             return;
    //         } else {
    //             return !$limit ? $data : substr($data, 0, $limit);
    //         }
    //     }
    //
    //     if ($post) {
    //         $content = is_array($port) ? http_build_query($post) : $post;
    //         $out = "POST $path HTTP/1.0\r\n";
    //         $header = "Accept: */*\r\n";
    //         $header .= "Accept-Language: zh-cn\r\n";
    //         $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
    //         $header .= "User-Agent: ".@$_SERVER['HTTP_USER_AGENT']."\r\n";
    //         $header .= "Host: $host:$port\r\n";
    //         $header .= 'Content-Length: '.strlen($content)."\r\n";
    //         $header .= "Connection: Close\r\n";
    //         $header .= "Cache-Control: no-cache\r\n";
    //         $header .= "Cookie: $cookie\r\n\r\n";
    //         $out .= $header.$content;
    //     } else {
    //         $out = "GET $path HTTP/1.0\r\n";
    //         $header = "Accept: */*\r\n";
    //         $header .= "Accept-Language: zh-cn\r\n";
    //         $header .= "User-Agent: ".@$_SERVER['HTTP_USER_AGENT']."\r\n";
    //         $header .= "Host: $host:$port\r\n";
    //         $header .= "Connection: Close\r\n";
    //         $header .= "Cookie: $cookie\r\n\r\n";
    //         $out .= $header;
    //     }
    //
    //     $fpflag = 0;
    //     $fp = false;
    //     if (function_exists('fsocketopen')) {
    //         $fp = fsocketopen($host, $port, $errno, $errstr, $timeout);
    //     }
    //     if (!$fp) {
    //         $context = stream_context_create(array(
    //             'http' => array(
    //                 'method' => $post ? 'POST' : 'GET',
    //                 'header' => $header,
    //                 'content' => $content,
    //                 'timeout' => $timeout,
    //             ),
    //         ));
    //         $fp = @fopen($scheme.'://'.$host.':'.$port.$path, 'b', false, $context);
    //         $fpflag = 1;
    //     }
    //
    //     if (!$fp) {
    //         return '';
    //     } else {
    //         stream_set_blocking($fp, true);
    //         stream_set_timeout($fp, $timeout);
    //         @fwrite($fp, $out);
    //         $status = stream_get_meta_data($fp);
    //         if (!$status['timed_out']) {
    //             while (!feof($fp) && !$fpflag) {
    //                 if (($header = @fgets($fp)) && ($header == "\r\n" ||  $header == "\n")) {
    //                     break;
    //                 }
    //             }
    //             if ($limit) {
    //                 $return = stream_get_contents($fp, $limit);
    //             } else {
    //                 $return = stream_get_contents($fp);
    //             }
    //         }
    //         @fclose($fp);
    //         return $return;
    //     }
    // }
    public function navbar()
    {
        return $this->fetch();
    }
    public function nav()
    {
        return $this->fetch();
    }
    /**
     * 清理缓存
     */
    public function clear()
    {
        $R = RUNTIME_PATH;
        if ($this->_deleteDir($R)) {
            $result['info'] = '清除缓存成功!';
            $result['status'] = 1;
        } else {
            $result['info'] = '清除缓存失败!';
            $result['status'] = 0;
        }
        $result['url'] = url('admin/index/index');
        return $result;
    }
    private function _deleteDir($R)
    {
        $handle = opendir($R);
        while (($item = readdir($handle)) !== false) {
            if ($item != '.' and $item != '..') {
                if (is_dir($R . '/' . $item)) {
                    $this->_deleteDir($R . '/' . $item);
                } else {
                    if (!unlink($R . '/' . $item)) {
                        die('error!');
                    }
                }
            }
        }
        closedir($handle);
        return rmdir($R);
    }

    /**
     * 退出登陆
     */
    public function logout()
    {
        session(null);
        $this->redirect('login/index');
    }
}
