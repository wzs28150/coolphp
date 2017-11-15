<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:64:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/auth/adminRule.html";i:1505957245;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/head.html";i:1505459050;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/foot.html";i:1503623995;}*/ ?>
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
        <legend>权限<?php echo lang('list'); ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('ruleAdd'); ?>" class="layui-btn layui-btn-small"><?php echo lang('add'); ?>权限</a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/html" id="auth">
    {{# if(d.authopen==1){ }}
    <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="authopen">无需验证</a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="authopen">需要验证</a>
    {{# } }}
</script>
<script type="text/html" id="status">
    {{# if(d.menustatus==1){ }}
    <a class="layui-btn layui-btn-mini layui-btn-warm" lay-event="menustatus">显示状态</a>
    {{# }else{  }}
    <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="menustatus">隐藏状态</a>
    {{# } }}
</script>
<script type="text/html" id="order">
    <input name="{{d.id}}" data-id="{{d.id}}" class="list_order layui-input" value=" {{d.sort}}" size="10"/>
</script>
<script type="text/html" id="icon">
    <span class="icon {{d.icon}}"></span>
</script>
<script type="text/html" id="action">
    <a href="<?php echo url('ruleEdit'); ?>?id={{d.id}}" class="layui-btn layui-btn-mini"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        table.render({
            elem: '#list',
            url: '<?php echo url("adminRule"); ?>',
            method: 'post',
            cols: [[
                {field: 'id', title: '<?php echo lang("id"); ?>', width: 70, fixed: true},
                {field: 'icon', align: 'center',title: '<?php echo lang("icon"); ?>', width: 60,templet: '#icon'},
                {field: 'ltitle', title: '权限名称', width: 200},
                {field: 'href', title: '控制器/方法', width: 200},
                {field: 'authopen',align: 'center', title: '是否验证权限', width: 150,toolbar: '#auth'},
                {field: 'menustatus',align: 'center',title: '菜单<?php echo lang("status"); ?>', width: 150,toolbar: '#status'},
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
                                authopen: '<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="authopen">无需验证</a>'
                            });
                        } else {
                            obj.update({
                                authopen: '<a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="authopen">需要验证</a>'
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
                                menustatus: '<a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="menustatus">显示状态</a>'
                            });
                        } else {
                            obj.update({
                                menustatus: '<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="menustatus">隐藏状态</a>'
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