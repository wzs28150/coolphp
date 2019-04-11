<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:46:"F:\cool-php/app/admin\view\auth/adminRule.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\head.html";i:1554966007;s:43:"F:\cool-php\app\admin\view\common\foot.html";i:1554966007;}*/ ?>
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
        <div class="layui-card-header">权限<?php echo lang('list'); ?></div>
        <div class="layui-card-body" pad15>
          <div style="padding-bottom: 10px;">
              <a href="<?php echo url('ruleAdd'); ?>" class="layui-btn layui-btn-small"><?php echo lang('add'); ?>权限</a>
              <a href="javascript:void(0);" id="fixed" class="layui-btn layui-btn-small">修复权限</a>
          </div>
          <table class="layui-table" id="list" lay-filter="list"></table>
        </div>
    </div>
   </div>
</div>
<script type="text/html" id="auth">
    {{# if(d.authopen==1){ }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="authopen">无需验证</a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="authopen">需要验证</a>
    {{# } }}
</script>
<script type="text/html" id="status">
    {{# if(d.menustatus==1){ }}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="menustatus">显示状态</a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="menustatus">隐藏状态</a>
    {{# } }}
</script>
<script type="text/html" id="order">
    <input name="{{d.id}}" data-id="{{d.id}}" class="list_order layui-input" value=" {{d.sort}}" size="10"/>
</script>
<script type="text/html" id="icon">
    <span class="layui-icon layui-icon-{{d.icon}}"></span>
</script>
<script type="text/html" id="action">
    <a href="<?php echo url('ruleEdit'); ?>?id={{d.id}}" class="layui-btn layui-btn-xs"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<!-- <script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script> -->
<script src="/public/static/admin/layui/layui.js"></script>

<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        table.render({
            elem: '#list',
            url: '<?php echo url("adminRule"); ?>',
            method: 'post',
            cols: [[
                {field: 'id', title: '<?php echo lang("id"); ?>', width: 70, fixed: true},
                {field: 'icon', align: 'center',title: '<?php echo lang("icon"); ?>', templet: '#icon'},
                {field: 'ltitle', title: '权限名称', },
                {field: 'href', title: '控制器/方法', width: 200},
                {field: 'authopen',align: 'center', title: '是否验证权限', toolbar: '#auth'},
                {field: 'menustatus',align: 'center',title: '菜单<?php echo lang("status"); ?>', toolbar: '#status'},
                {field: 'sort',align: 'center', title: '<?php echo lang("order"); ?>', width: 80, templet: '#order'},
                {width: 160,align: 'center', toolbar: '#action'}
            ]]
        });
        table.on('tool(list)', function(obj){
            var data = obj.data;
            if(obj.event === 'authopen'){
                loading =layer.load(1, {shade: [0.1,'#fff']});
                $.post('<?php echo url("ruleTz"); ?>',{'id': data.id},function (res) {
                    layer.close(loading);
                    if (res.status==1) {
                        if (res.authopen == 1) {
                            obj.update({
                                authopen: '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="authopen">无需验证</a>'
                            });
                        } else {
                            obj.update({
                                authopen: '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="authopen">需要验证</a>'
                            });
                        }
                    }else{
                        layer.msg('操作失败！',{time:1000,icon:2});
                        return false;
                    }
                })
            }
            else if(obj.event === 'menustatus'){
                loading =layer.load(1, {shade: [0.1,'#fff']});
                $.post('<?php echo url("ruleState"); ?>',{'id': data.id},function (res) {
                    layer.close(loading);
                    if (res.status==1) {
                        if (res.menustatus == 1) {
                            obj.update({
                                menustatus: '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="menustatus">显示状态</a>'
                            });
                        } else {
                            obj.update({
                                menustatus: '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="menustatus">隐藏状态</a>'
                            });
                        }
                    }else{
                        layer.msg('操作失败！',{time:1000,icon:2});
                        return false;
                    }
                })
            }
            else if(obj.event === 'del'){
                layer.confirm('您确定要删除该记录吗？', function(index){
                    var loading = layer.load(1, {shade: [0.1, '#fff']});
                    $.post("<?php echo url('ruleDel'); ?>",{id:data.id},function(res){
                        layer.close(loading);
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            obj.del();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
        $('body').on('click','#fixed',function () {
          layer.confirm('您确定要修复吗？修复权限,用户组内容栏目权限及插件权限需重新分配.', function(index){
              var loading = layer.load(1, {shade: [0.1, '#fff']});
              $.post("<?php echo url('ruleFix'); ?>",function(res){
                  layer.close(loading);
                  if(res.code==1){
                      layer.msg(res.msg,{time:1000,icon:1});
                      tableIn.reload();
                  }else{
                      layer.msg(res.msg,{time:1000,icon:2});
                  }
              });
              layer.close(index);
          });
        })
        $('body').on('blur','.list_order',function() {
           var id = $(this).attr('data-id');
           var sort = $(this).val();
           $.post('<?php echo url("ruleOrder"); ?>',{id:id,sort:sort},function(res){
                if(res.code==1){
                    layer.msg(res.msg,{time:1000,icon:1},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
           })
        })
    })
</script>
