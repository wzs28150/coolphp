<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:44:"F:\cool-php/app/admin\view\module/index.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\foot.html";i:1554966007;}*/ ?>
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
   <div class="layui-card">
    <div class="admin-main layui-anim layui-anim-upbit">
      <div class="layui-card-header"><?php echo lang('module'); ?><?php echo lang('list'); ?></div>
      <div class="layui-card-body" pad15>
        <div style="padding-bottom: 5px;">
            <a href="<?php echo url('add'); ?>" class="layui-btn layui-btn-small"><?php echo lang('add'); ?><?php echo lang('module'); ?></a>
        </div>
        <table class="layui-table" id="list" lay-filter="list"></table>
      </div>
    </div>
   </div>
</div>
<!-- <script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script> -->
<script src="/public/static/admin/layui/layui.js"></script>

<script type="text/html" id="action">
    <a href="<?php echo url('field'); ?>?id={{d.id}}" class="layui-btn layui-btn-normal layui-btn-xs">模型字段</a>
    <a href="<?php echo url('edit'); ?>?id={{d.id}}" class="layui-btn layui-btn-xs"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<script type="text/html" id="status">
    {{# if(d.status==1){ }}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="status">开启</a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="status">禁用</a>
    {{# } }}
</script>
<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        var tableIn = table.render({
            elem: '#list',
            url: '<?php echo url("index"); ?>',
            method: 'post',
            page:true,
            cellMinWidth: 80,
            cols: [[
                {field: 'id', title: '<?php echo lang("id"); ?>', width:60, fixed: true},
                {field: 'title', title: '<?php echo lang("module"); ?><?php echo lang("name"); ?>'},
                {field: 'name', title: '<?php echo lang("table"); ?>'},
                {field: 'description', title: '<?php echo lang("detail"); ?>'},
                {field: 'status', align: 'center',title: '<?php echo lang("status"); ?>', width: 80,toolbar: '#status'},
                {width: 200, align: 'center', toolbar: '#action'}
            ]]
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            if (obj.event === 'status') {
                var loading = layer.load(1, {shade: [0.1, '#fff']});
                $.post('<?php echo url("moduleState"); ?>', {'id': data.id}, function (res) {
                    layer.close(loading);
                    if (res.status == 1) {
                        if (res.moduleState == 1) {
                            obj.update({
                                status: '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="status">开启</a>'
                            });
                        } else {
                            obj.update({
                                status: '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="status">禁用</a>'
                            });
                        }
                    } else {
                        layer.msg('操作失败！', {time: 1000, icon: 2});
                        return false;
                    }
                })
            }else if(obj.event === 'del'){
                layer.confirm('你确定要删除该模型吗？', {icon: 3}, function (index) {
                    $.post("<?php echo url('del'); ?>",{id:data.id},function(res){
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            tableIn.reload();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
    })
</script>
