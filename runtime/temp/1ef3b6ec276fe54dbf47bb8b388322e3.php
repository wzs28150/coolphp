<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:56:"D:\web\3study\CLTP/app/admin\view\database\database.html";i:1504236166;s:50:"D:\web\3study\CLTP/app/admin\view\common\head.html";i:1505459050;s:50:"D:\web\3study\CLTP/app/admin\view\common\foot.html";i:1503623996;}*/ ?>
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
        <legend>数据<?php echo lang('list'); ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
       数据库中共有<i class="count"></i>张表，共计<i class="size"></i>
        <a href="javascript:void(0)" id="backUp" class="layui-btn layui-btn-small pull-right">备份</a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script type="text/html" id="size">
    {{d.size}}
</script>
<script type="text/html" id="action">
    <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="optimize">优化</a>
    <a class="layui-btn layui-btn-mini" lay-event="repair">修复</a>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        table.render({
            id: 'database',
            elem: '#list',
            url: '<?php echo url("database"); ?>',
            method: 'post',
            cols: [[
                {checkbox:true,fixed: true},
                {field: 'Name', title: '数据库表', width: 150, fixed: true,sort: true},
                {field: 'Rows', title: '记录条数', width: 150,sort: true},
                {field: 'Data_length', title: '占用空间', width: 150,templet:'#size',sort: true},
                {field: 'Engine', title: '类型', width: 110,sort: true},
                {field: 'Collation', title: '编码', width: 150,sort: true},
                {field: 'Create_time', title: '创建时间', width: 180,sort: true},
                {field: 'Comment', title: '说明', width: 180},
                {width: 160, align: 'center', toolbar: '#action'}
            ]],
            done: function(res, curr, count){
                $('.count').html(res.tableNum);
                $('.size').html(res.total);
            }
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            loading = layer.load(1, {shade: [0.1, '#fff']});
            if (obj.event === 'optimize') {
                $.post("<?php echo url('database/optimize'); ?>",{tableName:data.Name},function(res){
                    layer.close(loading);
                    if(res.code > 0){
                        layer.msg(res.msg,{time:1000,icon:1},function(){
                            window.location.href = res.url;
                        });
                    }else{
                        layer.msg(res.msg,{time:1000,icon:2});
                    }
                });
            }else if(obj.event === 'repair'){
                $.post("<?php echo url('database/repair'); ?>",{tableName:data.Name},function(res){
                    layer.close(loading);
                    if(res.code > 0){
                        layer.msg(res.msg,{time:1000,icon:1},function(){
                            window.location.href = res.url;
                        });
                    }else{
                        layer.msg(res.msg,{time:1000,icon:2});
                    }
                });
            }
        });

        $('#backUp').click(function(){
            var obj = $(this);
            var checkStatus = table.checkStatus('database'); //test即为参数id设定的值
            var a = [];
            $(checkStatus.data).each(function(i,o){
                a.push(o.Name);
            });
            obj.addClass('layui-btn-disabled');
            obj.html('备份进行中...');
            $.post("<?php echo url('database/backup'); ?>",{tables:a},function(data){
                data = eval('('+data+')');
                if(data.code==1){
                    obj.removeClass('layui-btn-disabled');
                    obj.html('备份');
                    layer.msg(data.msg,{time:1000,icon:1});
                }else{
                    layer.msg(data.msg,{time:1000,icon:2});
                }
            });
        })


    });
</script>