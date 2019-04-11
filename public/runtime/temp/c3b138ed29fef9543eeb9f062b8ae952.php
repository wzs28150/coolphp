<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:48:"F:\cool-php/app/admin\view\auth/groupAccess.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\foot.html";i:1554966007;}*/ ?>
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

<link rel="stylesheet" href="/public/static/plugins/zTree/css/zTreeStyle.css" type="text/css">
<div class="layui-fluid">
   <div class="layui-card">
    <div class="admin-main layui-anim layui-anim-upbit">
        <div class="layui-card-header">配置权限</div>
        <div class="layui-card-body" pad15>
          <div class="layui-field-box">
          <form class="layui-form layui-form-pane">
            <ul id="treeDemo" class="ztree"></ul>
            <div class="layui-form-item text-center">
              <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
              <button class="layui-btn layui-btn-danger" type="button" onclick="window.history.back()"><?php echo lang('back'); ?></button>
            </div>
          </form>
        </div>
        </div>
    </div>
   </div>
</div>
<!-- <script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script> -->
<script src="/public/static/admin/layui/layui.js"></script>

<script type="text/javascript" src="/public/static/common/js/jquery.2.1.1.min.js"></script>
<script type="text/javascript" src="/public/static/plugins/zTree/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="/public/static/plugins/zTree/js/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript">
  var setting = {
    check: {
      enable: true
    },
    view: {
      showLine: true,
      showIcon: false,
      dblClickExpand: false
    },
    data: {
      simpleData: {
        enable: true,
        pIdKey: 'pid',
        idKey: 'id'
      },
      key: {
        name: 'title'
      }
    }
  };
  var zNodes = <?php echo $data; ?>;

  function setCheck() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    zTree.setting.check.chkboxType = {
      "Y": "ps",
      "N": "ps"
    };
    var nodes = zTree.getCheckedNodes(true);
    // zTree.expandAll(false);
  }
  $.fn.zTree.init($("#treeDemo"), setting, zNodes);
  setCheck();
  var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
  var nodes = treeObj.getNodes();
  // console.log(nodes[0]);
  // treeObj.expandNode(nodes[0], true, false, false);


  layui.use(['form', 'layer'], function() {
    var form = layui.form,
      layer = layui.layer;
    form.on('submit(submit)', function() {
      loading = layer.load(1, {
        shade: [0.1, '#fff']
      });
      // 提交到方法 默认为本身
      var treeObj = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = treeObj.getCheckedNodes(true),
        v = "";
      for (var i = 0; i < nodes.length; i++) {
        v += nodes[i].id + ",";
      }
      var id = "<?php echo input('id'); ?>";
      $.post("<?php echo url('groupSetaccess'); ?>", {
        'rules': v,
        'group_id': id
      }, function(res) {
        layer.close(loading);
        if (res.code > 0) {
          layer.msg(res.msg, {
            time: 1800,
            icon: 1
          }, function() {
            location.href = res.url;
          });
        } else {
          layer.msg(res.msg, {
            time: 1800,
            icon: 2
          });
        }
      });
    })
  });
</script>
