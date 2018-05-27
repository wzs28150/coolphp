<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:55:"/www/wwwroot/hrbkcwl.com/app/admin/view/index/main.html";i:1511879065;s:56:"/www/wwwroot/hrbkcwl.com/app/admin/view/common/head.html";i:1511791799;s:56:"/www/wwwroot/hrbkcwl.com/app/admin/view/common/foot.html";i:1511791799;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo config('sys_name'); ?>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="__STATIC__/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="__ADMIN__/css/global.css" media="all">
    <link rel="stylesheet" href="__STATIC__/common/css/font.css" media="all">
</head>
<body class="skin-0">
<style>
.layui-elem-field {
    border: 1px solid #F5F5F5;
}
</style>
<div class="admin-main layui-anim layui-anim-upbit">
  <div class="layui-row">
    <div class="layui-col-xs12 layui-col-md6">
      <div class="grid-demo">
        <fieldset class="layui-elem-field" style="margin-top: 20px;">
          <legend>今日访客</legend>
          <div class="layui-row" style="margin: 20px 0;">
            <div class="layui-col-md4">
              <div class="grid-demo grid-fk-bg2">
                <div class="layui-col-md4">
                  <div class="ico">PV</div>
                </div>
                <div class="layui-col-md8">
                  <div class="num timer" id="pv" data-to="<?php echo $pv; ?>" data-speed="1500" data-decimals="10">0</div>
                  <div class="title">访问量</div>
                </div>
              </div>
            </div>
            <div class="layui-col-md4">
              <div class="grid-demo grid-fk-bg1">
                <div class="layui-col-md4">
                  <div class="ico">UV</div>
                </div>
                <div class="layui-col-md8">
                  <div class="num timer" id="uv" data-to="<?php echo $uv; ?>" data-speed="1500">0</div>
                  <div class="title">独立访客量</div>
                </div>
              </div>
            </div>
            <div class="layui-col-md4">
              <div class="grid-demo grid-fk-bg3">
                <div class="layui-col-md4">
                  <div class="ico">IP</div>
                </div>
                <div class="layui-col-md8">
                  <div class="num timer" id="ip" data-to="<?php echo $ip; ?>" data-speed="1500">0</div>
                  <div class="title">独立IP</div>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
      <div class="grid-demo">
        <fieldset class="layui-elem-field" style="margin-top: 20px;">
          <legend>页面关注度数据【近三个月】</legend>
          <div class="layui-form" style="margin:20px;">
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
                <tr>
                  <th>名称</th>
                  <th>关注度</th>
                  <th>链接</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>访问最多的页面</td>
                  <td>
                    <div class="layui-progress">
                      <?php if($totlenum == 0): ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                      <?php elseif($fwzdlist['pv'] == 0): ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                      <?php else: ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="<?php echo $fwzdlist['pv']/$totlenum*100; ?>%"></div>
                      <?php endif; ?>
                    </div>
                    <?php echo $fwzdlist['pv']; ?>
                  </td>
                  <td>
                    <a href="<?php echo $fwzdlist['name']; ?>"><?php echo $fwzdlist['name']; ?></a>
                  </td>
                </tr>
                <tr>
                  <td>查看最多的产品</td>
                  <td>
                    <div class="layui-progress">
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="40%"></div>
                    </div>
                    2,1454
                  </td>
                  <td>
                    <a href="">http://localhost:8088/</a>
                  </td>
                </tr>
                <tr>
                  <td>看的最多的新闻</td>
                  <td>
                    <div class="layui-progress">
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="40%"></div>
                    </div>
                    2,1454
                  </td>
                  <td>
                    <a href="">http://localhost:8088/</a>
                  </td>
                </tr>
                <tr>
                  <td>访问最少的页面</td>
                  <td>
                    <div class="layui-progress">
                      <?php if($totlenum == 0): ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                      <?php elseif($fwzslist['pv'] == 0): ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                      <?php else: ?>
                      <div class="layui-progress-bar layui-bg-blue" lay-percent="<?php echo $fwzslist['pv']/$totlenum*100; ?>%"></div>
                      <?php endif; ?>
                    </div>
                    <?php echo $fwzslist['pv']; ?>
                  </td>
                  <td>
                    <a href="<?php echo $fwzslist['name']; ?>"><?php echo $fwzslist['name']; ?></a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
    </div>
    <div class="layui-col-xs12 layui-col-md6">
      <div class="grid-demo" style="margin:20px;">
        <div id="main" style="width: 100%;height:400px; padding-top:12px;"></div>
      </div>
    </div>
  </div>

  <div class="layui-row">
    <div class="layui-col-xs12 layui-col-md6">
      <div class="grid-demo">
        <fieldset class="layui-elem-field" style="margin-top: 20px;">
          <legend>程序信息</legend>
          <div class="layui-form sys-info table-responsive" style="margin:20px;">
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <th>检测更新</th>
                  <td><a href="">进行在线更新</a></td>
                  <th>程序名称</th>
                  <td> <?php echo config('sys_name'); ?></td>
                </tr>
                <tr>
                  <th>当前版本</th>
                  <td><?php echo config('version'); ?></td>
                  <th>使用手册</th>
                  <td> <a href="">在线查看手册</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
      <div class="grid-demo">
        <fieldset class="layui-elem-field" style="margin-top: 20px;">
          <legend>服务器信息</legend>
          <div class="layui-form sys-info table-responsive" style="margin:20px;">
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <th>网站域名</th>
                  <td><?php echo $config['url']; ?></td>
                  <th>网站目录</th>
                  <td><?php echo $config['document_root']; ?></td>
                </tr>
                <tr>
                  <th>服务器操作系统</th>
                  <td><?php echo $config['server_os']; ?></td>
                  <th>WEB运行环境</th>
                  <td><?php echo $config['server_soft']; ?></td>
                </tr>
                <tr>
                  <th>MySQL数据库版本</th>
                  <td><?php echo $config['mysql_version']; ?></td>
                  <th>运行PHP版本</th>
                  <td><?php echo $config['php_version']; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
    </div>
    <div class="layui-col-xs12 layui-col-md6">
      <div class="grid-demo">
        <fieldset class="layui-elem-field" style="margin-top: 20px;">
          <legend>SEO信息</legend>
          <div class="layui-form sys-info table-responsive" style="margin:20px;">
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <th>Alexa全球排名</th>
                  <td><span id="alexa_num">0</span></td>
                  <th>Alexa地区排名</th>
                  <td><span id="alexa_area_num">0</span></td>
                </tr>
                <tr>
                  <th>百度收录</th>
                  <td><span id="baidu_count">0</span></td>
                  <th>百度反链</th>
                  <td><span id="baidu_fl_count">0</span></td>
                </tr>
                <tr>
                  <th>360收录</th>
                  <td><span id="haosou360_count">0</span></td>
                  <th>搜狗收录</th>
                  <td><span id="sogou_count">0</span></td>
                </tr>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
    </div>
  </div>


</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script>
  layui.use('table', function() {
    var table = layui.table;
  })
  layui.use(['countTo'], function(countTo) {
    countTo.init();
  });
  layui.use('element', function() {
    var $ = layui.jquery,
      element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

    //触发事件
    var active = {
      setPercent: function() {
        //设置50%进度
        element.progress('demo', '50%')
      },
      loading: function(othis) {
        var DISABLED = 'layui-btn-disabled';
        if (othis.hasClass(DISABLED)) return;

        //模拟loading
        var n = 0,
          timer = setInterval(function() {
            n = n + Math.random() * 10 | 0;
            if (n > 100) {
              n = 100;
              clearInterval(timer);
              othis.removeClass(DISABLED);
            }
            element.progress('demo', n + '%');
          }, 300 + Math.random() * 1000);

        othis.addClass(DISABLED);
      }
    };

    $('.site-demo-active').on('click', function() {
      var othis = $(this),
        type = $(this).data('type');
      active[type] ? active[type].call(this, othis) : '';
    });

    $.get("/admin/index/seo", function(result){
      $('#alexa_num').html(result.alexa_num);
      $('#alexa_area_num').html(result.alexa_area_num);
      $('#baidu_count').html(result.baidu_count);
      $('#baidu_fl_count').html(result.baidu_fl_count);
      $('#sogou_count').html(result.sogou_count);
      $('#haosou360_count').html(result.haosou360_count);
    },'json');
  });
</script>
<script type="text/javascript" src="__STATIC__/plugins/echarts/echarts.js"></script>
<script type="text/javascript" src="__STATIC__/plugins/echarts/westeros.js"></script>
<script type="text/javascript">
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById('main'));

  // 指定图表的配置项和数据
  var option = {
    title: {
      text: '访问概况'
    },
    tooltip: {
      trigger: 'axis'
    },
    color:['#62df62', '#ffa44c', '#628bdf'],
    legend: {
      data: ['uv', 'pv', 'ip'],
    },
    grid: {
      left: '2%',
      right: '3.8%',
      bottom: '0',
      containLabel: true
    },

    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: [<?php echo $riqistr; ?>]
    },
    yAxis: {
      type: 'value'
    },
    series: [{
        name: 'uv',
        type: 'line',
        stack: '总量',
        smooth :true,
        animation :true,
        itemStyle : {
          normal : {
            lineStyle:{
              color:'#62df62'
            }
          }
        },
        data: [<?php echo $uvstr; ?>]
      },
      {
        name: 'pv',
        type: 'line',
        stack: '总量',
        smooth :true,
        animation :true,
        itemStyle : {
          normal : {
            lineStyle:{
              color:'#ffa44c'
            }
          }
        },
        data: [<?php echo $pvstr; ?>]
      },
      {
        name: 'ip',
        type: 'line',
        stack: '总量',
        smooth :true,
        animation :true,
        itemStyle : {
          normal : {
            lineStyle:{
              color:'#628bdf'
            }
          }
        },
        data: [<?php echo $ipstr; ?>]
      }
    ]
  };

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
  window.onresize = function() {
    //重置容器高宽
    myChart.resize();
  };
</script>
</body>

</html>
