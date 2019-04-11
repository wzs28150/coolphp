<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Input;
use think\Cache;
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
        $menus = F('Menus');
        if(!$menus) {
            $menus = db('menu')->order('sort asc,id asc,addtime desc')->select();
            F('Menus', $menus);
        }

        $menus =  subtree($menus);
        // dump($menus);
        // exit;
        $this->assign('menus', $menus);
        return $this->fetch();
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
        $addons = db('addons')->where('has_adminlist', 1)->select();
        $this->assign('addons', $addons);
        $this->assign('addonsnum', count($addons));
        //磁盘信息
        $disk = round(100 - disk_free_space($_SERVER['DOCUMENT_ROOT'])/disk_total_space($_SERVER['DOCUMENT_ROOT'])*100, 2);
        $this->assign('disk', $disk);
        //待审文章
        $dsarticle = db('article')->where('status', 3)->count();
        $this->assign('dsarticle', $dsarticle);
        //待审评论
        $dscomment = db('comment')->where('status', '<>', 1)->count();
        $this->assign('dscomment', $dscomment);

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
        $list = db('article')->where('status', 1)->order('hits desc')->limit(10)->select();
        $rsult['code'] = 0;
        $rsult['msg'] = "";
        foreach ($list as $k=>$v ){
            $list[$k]['createtime'] = date('Y-m-d H:i:s', $v['createtime']);
            $list[$k]['catid'] = getcatname($v['catid']);
        }
        $rsult['data'] = $list;
        $rsult['count'] = 10;
        $rsult['rel'] = 1;
        return $rsult;
    }
    public function getsysinfo()
    {

        if(php_uname('s') == 'Windows NT') {
            $type=input('type');
            $info = new SysInfo();
            $memory = $info->getMemoryUsage();
            $cpu = $info->getCpuUsage();
        }else{
            $status= $this->get_used_status();
            $cpu = $status['cpu_usage'];
            $memory['usage'] = $status['mem_usage'];
            // dump($status);
        }

        if($memory) {
            cookie('memory', $memory['usage']);
        }
        if($cpu) {
            cookie('cpu', $cpu);
        }
        $data['cpu'] = round(cookie('cpu'));
        $data['memory'] = round(cookie('memory'));
        echo json_encode($data);
    }
    public function get_used_status()
    {
        $fp = popen('top -b -n 1', "r");//获取某一时刻系统cpu和内存使用情况
        $rs = "";
        while(!feof($fp)){
            //dump(fgets($fp));
            $rs .= fread($fp, 1024);
        }
        pclose($fp);
        $sys_info = explode("\n", $rs);

        $tast_info = explode(",", $sys_info[1]);//进程 数组
        $cpu_info = explode(",", $sys_info[2]);  //CPU占有量  数组
        $mem_info = explode(",", $sys_info[3]); //内存占有量 数组

        //正在运行的进程数
        $tast_running = trim(trim($tast_info[1], 'running'));


        //CPU占有量
        $cpu_usage = floatval(explode(':', str_replace(' ', '', $cpu_info[0]))[1]);  //百分比

        //内存占有量
        $mem_total = explode(':', str_replace(' ', '', $mem_info[0]))[1];

        $mem_used = str_replace('k used', '', $mem_info[1]);
        $mem_usage = round(100*intval($mem_used)/intval($mem_total), 2);  //百分比
        // dump($cpu_info);

        /*硬盘使用率 begin*/
        $fp = popen('df -lh | grep -E "^(/)"', "r");
        $rs = fread($fp, 1024);
        pclose($fp);
        $rs = preg_replace("/\s{2,}/", ' ', $rs);  //把多个空格换成 “_”
        $hd = explode(" ", $rs);
        $hd_avail = trim($hd[3], 'G'); //磁盘可用空间大小 单位G
        $hd_usage = trim($hd[4], '%'); //挂载点 百分比
        //print_r($hd);
        /*硬盘使用率 end*/

        //检测时间
        $fp = popen("date +\"%Y-%m-%d %H:%M\"", "r");
        $rs = fread($fp, 1024);
        pclose($fp);
        $detection_time = trim($rs);

        /*获取IP地址  begin*/
        /*
        $fp = popen('ifconfig eth0 | grep -E "(inet addr)"','r');
        $rs = fread($fp,1024);
        pclose($fp);
        $rs = preg_replace("/\s{2,}/",' ',trim($rs));  //把多个空格换成 “_”
        $rs = explode(" ",$rs);
        $ip = trim($rs[1],'addr:');
        */
        /*获取IP地址 end*/
        /*
        $file_name = "/tmp/data.txt"; // 绝对路径: homedata.dat
        $file_pointer = fopen($file_name, "a+"); // "w"是一种模式，详见后面
        fwrite($file_pointer,$ip); // 先把文件剪切为0字节大小， 然后写入
        fclose($file_pointer); // 结束
        */

        return array('cpu_usage'=>$cpu_usage,'mem_usage'=>$mem_usage,'hd_avail'=>$hd_avail,'hd_usage'=>$hd_usage,'tast_running'=>$tast_running,'detection_time'=>$detection_time);
    }
    /**
     * seo 显示
     *
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
     *
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
        Cache::clear();
        $R = RUNTIME_PATH;
        // echo $R;
        $this->_deleteDir($R);
        $result['info'] = '清除缓存成功!';
        $result['status'] = 1;
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
