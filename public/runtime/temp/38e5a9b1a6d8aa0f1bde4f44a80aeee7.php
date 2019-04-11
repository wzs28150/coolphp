<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:42:"F:\cool-php/app/admin\view\index/main.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1554966007;}*/ ?>
<!DOCTYPE html>
  <html>
  <head>
    <meta charset="utf-8">
    <title><?php echo config('sys_name'); ?>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/public/static/admin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/public/static/admin/css/admin.css" media="all">
    <link rel="stylesheet" href="/public/static/admin/css/template.css" media="all">
  </head>
  <!-- <?php if($controller == 'Index' and $action == 'index'): ?>
  <body class="layui-layout-body">
  <?php else: ?>
  <body>
  <?php endif; ?> -->
<body>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md8">
        <div class="layui-row layui-col-space15">
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header">快捷方式</div>
              <div class="layui-card-body">
                <div class="layui-carousel layadmin-carousel layadmin-shortcut">
                  <div carousel-item>
                    <ul class="layui-row layui-col-space10  layui-this">
                      <li class="layui-col-xs6">
                        <a lay-href="<?php echo url('/admin/System/system'); ?>">
                          <i class="layui-icon layui-icon-set"></i>
                          <cite>系统设置</cite>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="<?php echo url('/admin/Category/index'); ?>">
                          <i class="layui-icon layui-icon-align-center"></i>
                          <cite>内容管理</cite>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="<?php echo url('/admin/Article/index?status=3'); ?>">
                          <i class="layui-icon layui-icon-auz"></i>
                          <cite>文章审核</cite>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="<?php echo url('/admin/Auth/adminList'); ?>">
                          <i class="layui-icon layui-icon-password"></i>
                          <cite>权限管理</cite>
                        </a>
                      </li>

                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header">待办事项</div>
              <div class="layui-card-body">

                <div class="layui-carousel layadmin-carousel layadmin-backlog">
                  <div carousel-item>
                    <ul class="layui-row layui-col-space10">
                      <li class="layui-col-xs12">
                        <a href="/admin/Addons/loadadmin/id/79.html" target="_blank" class="layadmin-backlog-body">
                          <h3>待审评论</h3>
                          <p><cite><?php echo $dscomment; ?></cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs12">
                        <a lay-href="/admin/Article/index?status=3.html" class="layadmin-backlog-body">
                          <h3>待审文章</h3>
                          <p><cite><?php echo $dsarticle; ?></cite></p>
                        </a>
                      </li>
                      <!-- <li class="layui-col-xs6">
                        <a href="/admin/Addons/loadadmin/id/81.html" target="_blank" class="layadmin-backlog-body">
                          <h3>待阅首长信箱</h3>
                          <p><cite><?php echo $letter; ?></cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a href="/admin/Addons/loadadmin/id/80.html" target="_blank" data-name="待处理报修" class="layadmin-backlog-body">
                          <h3>待处理报修</h3>
                          <p><cite><?php echo $dsrepairs; ?></cite></p>
                        </a>
                      </li> -->
                    </ul>
                    <!-- <ul class="layui-row layui-col-space10">
                      <li class="layui-col-xs6">
                        <a href="javascript:;" class="layadmin-backlog-body">
                          <h3>待审友情链接</h3>
                          <p><cite style="color: #FF5722;">5</cite></p>
                        </a>
                      </li>
                    </ul> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="layui-col-md12">
            <div class="layui-card">
              <div class="layui-card-header">数据概览</div>
              <div class="layui-card-body">
                <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">
                  <div carousel-item id="LAY-index-dataview">
                    <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>

      <div class="layui-col-md4">
        <div class="layui-card">
          <div class="layui-card-header">版本信息</div>
          <div class="layui-card-body layui-text">
            <table class="layui-table">
              <colgroup>
                <col width="100">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <td>当前版本</td>
                  <td>
                    <script type="text/html" template>
                      COOLPHP v1.0.1
                      <!-- <a href="http://fly.layui.com/docs/3/" target="_blank" style="padding-left: 15px;">更新日志</a> -->
                    </script>
                  </td>
                </tr>
                <tr>
                  <td>基于框架</td>
                  <td>
                    <script type="text/html" template>
                      layui-v2.3.0/thinkphp<?php echo THINK_VERSION;?>
                    </script>
                 </td>
                </tr>
                <tr>
                  <td>主要特色</td>
                  <td>零门槛 / 响应式 / 清爽 / 极简 / 灵活 / 可扩展</td>
                </tr>
                <tr>
                  <td>获取渠道</td>
                  <td style="padding-bottom: 0;">
                    <div class="layui-btn-container">
                      <!-- <a href="http://www.layui.com/admin/" target="_blank" class="layui-btn layui-btn-danger">获取授权</a> -->
                      <a href="http://hrbkcwl.com/" target="_blank" class="layui-btn">检查更新</a>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- <div class="layui-card">
          <div class="layui-card-header">效果报告</div>
          <div class="layui-card-body layadmin-takerates">
            <div class="layui-progress" lay-showPercent="yes">
              <h3>转化率（日同比 28% <span class="layui-edge layui-edge-top" lay-tips="增长" lay-offset="-15"></span>）</h3>
              <div class="layui-progress-bar" lay-percent="65%"></div>
            </div>
            <div class="layui-progress" lay-showPercent="yes">
              <h3>签到率（日同比 11% <span class="layui-edge layui-edge-bottom" lay-tips="下降" lay-offset="-15"></span>）</h3>
              <div class="layui-progress-bar" lay-percent="32%"></div>
            </div>
          </div>
        </div> -->

        <div class="layui-card">
          <div class="layui-card-header">实时监控</div>
          <div class="layui-card-body layadmin-takerates">
            <div class="layui-progress" lay-showPercent="true" lay-filter="demo">
              <h3>CPU使用率</h3>
              <div class="layui-progress-bar layui-bg-blue"  lay-percent="0%"></div>
            </div>
            <div class="layui-progress" lay-showPercent="true" lay-filter="demo2">
              <h3>内存占用率</h3>
              <!-- <div class="layui-progress-bar layui-bg-red" lay-percent="<?php echo $memory; ?>%"></div> -->
              <div class="layui-progress-bar layui-bg-blue"  lay-percent="0%"></div>
            </div>
            <div class="layui-progress" lay-showPercent="true">
              <h3>磁盘占用率</h3>
              <div class="layui-progress-bar layui-bg-red" lay-percent="<?php echo $disk; ?>%"></div>
            </div>
          </div>
        </div>

        <div class="layui-card">
          <div class="layui-card-header">文档手册</div>
          <div class="layui-card-body">
            <div class="layui-carousel layadmin-carousel layadmin-news shouce"  data-autoplay="true" data-anim="fade" lay-filter="news">
              <div carousel-item>
                <div><a href="/public/static/admin/pdf/doc.pdf" target="_blank" style="height: 51px!important;line-height: 51px;" class="layui-bg-red">COOLPHP 快速上手文档</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <script src="/public/static/admin/layui/layui.js"></script>
  <script>
  layui.config({
    base: '/public/static/admin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index','console']);
  </script>
</body>
</html>
