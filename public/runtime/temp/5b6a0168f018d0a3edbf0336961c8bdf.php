<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:43:"F:\cool-php/app/admin\view\index/index.html";i:1555029462;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1555029087;}*/ ?>
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
    <link rel="stylesheet" href="/public/static/plugins/font-awesome/css/font-awesome.min.css" media="all">
  </head>
  <!-- <?php if($controller == 'Index' and $action == 'index'): ?>
  <body class="layui-layout-body">
  <?php else: ?>
  <body>
  <?php endif; ?> -->
<body>

<div id="LAY_app">
  <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
      <!-- 头部区域 -->
      <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item layadmin-flexible" lay-unselect>
          <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
        </li>
        <li class="layui-nav-item layui-hide-xs" lay-unselect>
          <a href="/index.html" target="_blank" title="前台">
              <i class="layui-icon layui-icon-website"></i>
            </a>
        </li>
        <li class="layui-nav-item" lay-unselect>
          <a href="javascript:;" layadmin-event="refresh" data-url="<?php echo url('clear'); ?>" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
        </li>
      </ul>
      <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

        <!-- <li class="layui-nav-item" lay-unselect>
            <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>
              <span class="layui-badge-dot"></span>
            </a>
          </li> -->
        <li class="layui-nav-item layui-hide-xs" lay-unselect>
          <a href="javascript:;" layadmin-event="theme">
              <i class="layui-icon layui-icon-theme"></i>
            </a>
        </li>
        <li class="layui-nav-item layui-hide-xs" lay-unselect>
          <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
        </li>
        <li class="layui-nav-item" lay-unselect>
          <a href="javascript:;">
              <cite><?php echo session('username'); ?></cite>
            </a>
          <dl class="layui-nav-child">
            <dd><a lay-href="/admin/auth/adminEdit.html?admin_id=<?php echo session('aid'); ?>">基本资料</a></dd>
            <dd><a lay-href="/admin/auth/adminEdit.html?admin_id=<?php echo session('aid'); ?>">修改密码</a></dd>
            <hr>
            <dd style="text-align: center;"><a href="<?php echo url('index/logout'); ?>"><?php echo lang('logout'); ?></a></dd>
          </dl>
        </li>

        <li class="layui-nav-item layui-hide-xs" lay-unselect>
          <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
        </li>
        <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
          <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
        </li>
      </ul>
    </div>

    <!-- 侧边菜单 -->
    <div class="layui-side layui-side-menu">
      <div class="layui-side-scroll">
        <div class="layui-logo" lay-href="<?php echo url('main'); ?>">
          <span style="font-size:30px;font-weight: bold;"><?php echo config('sys_name'); ?></span>
        </div>

        <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
          <li data-name="home" class="layui-nav-item">
            <a lay-href="<?php echo url('main'); ?>" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
          </li>
          <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
          <li data-name="<?php echo $vo['title']; ?>" class="layui-nav-item">
            <?php if($vo['children']): ?>
            <a href="javascript:;" lay-tips="<?php echo $vo['title']; ?>" lay-direction="2">
              <i class="layui-icon layui-icon-<?php echo $vo['icon']; ?>"></i>
                <cite><?php echo $vo['title']; ?></cite>
            </a>
            <?php else: ?>
            <a lay-href="<?php echo $vo['href']; ?>" lay-tips="<?php echo $vo['title']; ?>" lay-direction="2">
              <i class="layui-icon layui-icon-<?php echo $vo['icon']; ?>"></i>
                <cite><?php echo $vo['title']; ?></cite>
            </a>
            <?php endif; if($vo['children']): if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voa): $mod = ($i % 2 );++$i;?>
                <dl class="layui-nav-child">
                  <?php if($voa['children']): ?>
                  <dd data-name="<?php echo $vob['title']; ?>">
                    <a href="javascript:;"><?php echo $voa['title']; ?></a>
                    <dl class="layui-nav-child">
                      <!-- <?php if(is_array($voa['children']) || $voa['children'] instanceof \think\Collection || $voa['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $voa['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vob): $mod = ($i % 2 );++$i;?>
                        <dd data-name="<?php echo $vob['title']; ?>"><a lay-href="<?php echo $vob['href']; ?>"><?php echo $vob['title']; ?></a></dd>
                        <?php endforeach; endif; else: echo "" ;endif; ?> -->
                      <?php if(is_array($voa['children']) || $voa['children'] instanceof \think\Collection || $voa['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $voa['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vob): $mod = ($i % 2 );++$i;?>
                      <dd data-name="<?php echo $vob['title']; ?>" class="layui-nav-item">
                        <?php if($vob['children']): ?>
                        <a href="javascript:;"><?php echo $vob['title']; ?></a>
                        <dl class="layui-nav-child">
                          <?php if(is_array($vob['children']) || $vob['children'] instanceof \think\Collection || $vob['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vob['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voc): $mod = ($i % 2 );++$i;?>
                          <dd data-name="<?php echo $voc['title']; ?>"><a lay-href="<?php echo $voc['href']; ?>"><?php echo $voc['title']; ?></a></dd>
                          <?php endforeach; endif; else: echo "" ;endif; ?>
                        </dl>
                        <?php else: ?>
                        <a lay-href="<?php echo $vob['href']; ?>"><?php echo $vob['title']; ?></a>
                        <?php endif; ?>
                      </dd>
                      <?php endforeach; endif; else: echo "" ;endif; ?>
                    </dl>
                  </dd>
                  <?php else: ?>
                  <dd data-name="<?php echo $vob['title']; ?>">
                    <a lay-href="<?php echo $voa['href']; ?>"><?php echo $voa['title']; ?></a>
                  </dd>
                  <?php endif; ?>
                </dl>
                <?php endforeach; endif; else: echo "" ;endif; endif; ?>
          </li>
          <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </div>
    </div>

    <!-- 页面标签 -->
    <div class="layadmin-pagetabs" id="LAY_app_tabs">
      <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
      <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
      <!-- <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div> -->
      <div class="layui-icon layadmin-tabs-control layui-icon-down">
        <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;"></a>
            <dl class="layui-nav-child layui-anim-fadein">
              <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
              <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
              <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
            </dl>
          </li>
        </ul>
      </div>
      <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
        <ul class="layui-tab-title" id="LAY_app_tabsheader">
          <li lay-id="<?php echo url('main'); ?>" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
        </ul>
      </div>
    </div>


    <!-- 主体内容 -->
    <div class="layui-body" id="LAY_app_body">
      <div class="layadmin-tabsbody-item layui-show">
        <iframe src="<?php echo url('main'); ?>" frameborder="0" class="layadmin-iframe"></iframe>
      </div>
    </div>

    <!-- 辅助元素，一般用于移动设备下遮罩 -->
    <div class="layadmin-body-shade" layadmin-event="shade"></div>
  </div>
</div>

<script src="/public/static/admin/layui/layui.js"></script>
<script type="text/javascript">
  // layui.use('rightmenu', function() {
  //     var rightmenu = layui.rightmenu, $ = layui.jquery;
  //     $(document).ready(function(){
  //       var rcm = rightmenu;
  //       rcm.init({
  //         area:'body',
  //         items:{
  //           "edit":{name:"编辑",icon:'edit'},
  //           "del":{name:"删除",icon:'trash-o'},
  //           "add":{name:"添加",icon:'plus',items:{
  //             "new-text":{name:"添加文件",icon:'file-text'},
  //             "new-zip":{name:"添加ZIP",icon:'file-zip-o'}
  //           }},
  //           "refresh":{name:"刷新",icon:'refresh'},
  //           "down":{name:"下载按钮",icon:'cloud-download'},
  //           "new":{name:"新建",icon:'file',items:{
  //             "new-text":{name:"新建文件",icon:'file-text'},
  //             "new-zip":{name:"新建ZIP",icon:'file-zip-o'}
  //           }}
  //         },
  //         callback:function(res){
  //           if(res.data == 'edit'){
  //             console.log('点击了edit');
  //           }else if(res.data == 'del'){
  //             console.log('点击了del');
  //           }else if(res.data == 'add'){
  //             console.log('点击了add');
  //           }else if(res.data == 'refresh'){
  //             window.location.reload();
  //           }else if(res.data == 'down'){
  //             console.log('点击了download');
  //           }
  //         }
  //       })
  //     });
  //
  // })
</script>
<script>
  layui.config({
    base: '/public/static/admin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');

</script>
<style media="screen">
  .RCM-Main{position:absolute}.RCM-container{border:1px solid #ccc;padding:5px 0;display:block;box-shadow:0 0 2px #ccc;font-size:14px;border-radius:3px;z-index:10000;background:#fff;color:#000}.RCM-container ul{list-style:none;padding:0;margin:0}.RCM-container ul li{height:30px;line-height:30px;padding:0 18px 0 15px;cursor:pointer;position:relative}.RCM-container ul li:hover{background-color:#343a40;color:#fff}.textcenter{text-align:center}.fa-align-right{position:absolute;right:0;top:10px}.RCM-child{position:absolute;top:0;width:100%}
</style>


</body>

</html>
