<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:53:"D:\web\3study\CLTP/app/admin\view\auth\adminList.html";i:1504765474;s:50:"D:\web\3study\CLTP/app/admin\view\common\head.html";i:1505459050;s:50:"D:\web\3study\CLTP/app/admin\view\common\foot.html";i:1503623996;}*/ ?>
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
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo lang('admin'); ?><?php echo lang('list'); ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('adminAdd'); ?>" class="layui-btn layui-btn-small"><?php echo lang('add'); ?><?php echo lang('admin'); ?></a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>

<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script type="text/html" id="barDemo">
    <a href="<?php echo url('adminEdit'); ?>?admin_id={{d.admin_id}}" class="layui-btn layui-btn-mini"><?php echo lang('edit'); ?></a>
    {{# if(d.admin_id==1){ }}
    <a href="#" class="layui-btn layui-btn-mini layui-btn-disabled"><?php echo lang('del'); ?></a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"><?php echo lang('del'); ?></a>
    {{# } }}
</script>
<script type="text/html" id="open">
    {{# if(d.admin_id==1){ }}
    <a class="layui-btn layui-btn-mini layui-btn-disabled"><?php echo lang('enabled'); ?></a>
    {{# }else{  }}
    {{# if(d.is_open==1){ }}
    <a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="open"><?php echo lang('enabled'); ?></a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="open"><?php echo lang('disabled'); ?></a>
    {{# } }}
    {{# } }}
</script>
<script>
    layui.use('table', function() {
        var table = layui.table,$ = layui.jquery;
        table.render({
            elem: '#list',
            url: '<?php echo url("adminList"); ?>',
            method:'post',
            cols: [[
                {field:'username', title: '用户名', width:80,fixed: true}
                ,{field:'email', title: '邮箱', width:200}
                ,{field:'title', title: '<?php echo lang("userGroup"); ?>', width:200}
                ,{field:'tel', title: '<?php echo lang("tel"); ?>', width:150}
                ,{field:'ip', title: '<?php echo lang("ip"); ?>',width:150}
                ,{field:'is_open', title: '<?php echo lang("status"); ?>',width:150,toolbar: '#open'}
                ,{width:160, align:'center', toolbar: '#barDemo'}
            ]]
        });
        table.on('tool(list)', function(obj){
            var data = obj.data;
            if(obj.event === 'open'){
                loading =layer.load(1, {shade: [0.1,'#fff']});
                $.post('<?php echo url("adminState"); ?>',{'id': data.admin_id},function (res) {
                    layer.close(loading);
                    if (res.status==1) {
                        if (res.open == 1) {
                            obj.update({
                                is_open: '<a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="open"><?php echo lang("enabled"); ?></a>'
                            });
                        } else {
                            obj.update({
                                is_open: '<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="open"><?php echo lang("disabled"); ?></a>'
                            });
                        }
                    }else{
                        layer.msg(res.msg,{time:1000,icon:2});
                        return false;
                    }
                })
            } else if(obj.event === 'del'){
                layer.confirm('<?php echo lang("Are you sure you want to delete it"); ?>', function(index){
                    $.post("<?php echo url('adminDel'); ?>",{admin_id:data.admin_id},function(res){
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

    });
</script>
</body>
</html>