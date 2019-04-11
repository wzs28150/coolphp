<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:47:"F:\cool-php/app/admin\view\auth/adminGroup.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\foot.html";i:1554966007;}*/ ?>
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
    <div class="layui-card-header">用户组列表</div>
    <div class="layui-card-body" pad15>
      <div style="padding-bottom: 10px;">
          <a href="<?php echo url('groupAdd'); ?>" class="layui-btn layui-btn-small"><?php echo lang('add'); ?>用户组</a>
      </div>
      <table class="layui-table" id="list" lay-filter="list"></table>
    </div>
</div>
   </div>
</div>
<!-- <script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script> -->
<script src="/public/static/admin/layui/layui.js"></script>


<script type="text/html" id="action">
    <a href="<?php echo url('groupAccess'); ?>?id={{d.group_id}}" class="layui-btn layui-btn-xs layui-btn-normal">配置规则</a>
    <a href="<?php echo url('groupEdit'); ?>?id={{d.group_id}}" class="layui-btn layui-btn-warm layui-btn-xs"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table,$ = layui.jquery;
        table.render({
            elem: '#list'
            ,url: '<?php echo url("adminGroup"); ?>',
            method:'post',
            cols: [[
                {field:'group_id', title: '<?php echo lang("id"); ?>', width:80,fixed: true,sort: true},
                {field:'title', title: '用户组名'},
                {field:'addtime', title: '添加时间', width:200,sort: true},
                {width:260, align:'center',toolbar:'#action'}
            ]]
        });
        table.on('tool(list)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('你确定要删除该分组吗？', function(index){
                    loading =layer.load(1, {shade: [0.1,'#fff']});
                    $.post("<?php echo url('groupDel'); ?>",{id:data.group_id},function(res){
                        layer.close(loading);
                        layer.close(index);
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            obj.del();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                });
            }
        });
    });
</script>
</body>
</html>
