<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:62:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/template/add.html";i:1504236388;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/head.html";i:1505459050;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/foot.html";i:1503623995;}*/ ?>
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
        <legend><?php echo $title; ?></legend>
    </fieldset>
    <form class="layui-form layui-form-pane">
        <input TYPE="hidden" name="file" value="<?php echo $filename; ?>">
        <input TYPE="hidden" name="type" value="<?php echo input('param.type'); ?>">
        <div class="layui-form-item">
            <label class="layui-form-label">文件名称</label>
            <div class="layui-input-4">
                <input type="text" name="file" value="" placeholder="<?php echo lang('pleaseEnter'); ?>文件名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文件类型</label>
            <div class="layui-input-block">
                <input type="radio" name="type" checked lay-filter="is_open" value="<?php echo $viewSuffix; ?>" title="模版文件">
                <input type="radio" name="type" lay-filter="is_open" value="css" title="CSS文件">
                <input type="radio" name="type" lay-filter="is_open" value="js" title="JS文件">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea placeholder="<?php echo lang('pleaseEnter'); ?>内容" name="content" rows="15" class="layui-textarea"><?php echo $content; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
                <a href="<?php echo url('index',array('type'=>input('param.type'))); ?>" class="layui-btn layui-btn-primary"><?php echo lang('back'); ?></a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script>
    layui.use('form', function () {
        var form = layui.form, $ = layui.jquery;
        form.on('submit(submit)', function (data) {
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post("<?php echo url('insert'); ?>", data.field, function (res) {
                layer.close(loading);
                if (res.code > 0) {
                    layer.msg(res.msg, {time: 1000, icon: 1}, function () {
                        location.href = res.url;
                    });
                } else {
                    layer.msg(res.msg, {time: 1000, icon: 2});
                }
            });
        })
    });
</script>