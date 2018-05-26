<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"J:\web\201805\hrbkcwl.com/app/admin\view\auth\ruleAdd.html";i:1511791797;s:57:"J:\web\201805\hrbkcwl.com/app/admin\view\common\head.html";i:1511791799;s:57:"J:\web\201805\hrbkcwl.com/app/admin\view\common\foot.html";i:1511791799;}*/ ?>
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
<div style="margin: 15px;" class="fadeInUp animated">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>添加权限</legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        1、《控/方》：意思是 控制器/方法; 例如 Sys/sysList<br/>
        2、图标名称为左侧导航栏目的图标样式，具体可查看<a href="http://fontawesome.io/icons/" target="_blank">FontAwesome</a>图标CSS样式
    </blockquote>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">父级</label>
            <div class="layui-input-4">
                <select name="pid" lay-verify="required" lay-filter="pid" >
                    <option value="0">默认顶级</option>
                    <?php if(is_array($admin_rule) || $admin_rule instanceof \think\Collection || $admin_rule instanceof \think\Paginator): $i = 0; $__LIST__ = $admin_rule;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $vo['id']; ?>"><?php echo $vo['lefthtml']; ?><?php echo $vo['title']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限名称</label>
            <div class="layui-input-4">
                <input type="text" name="title" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>权限名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">控制器/方法</label>
            <div class="layui-input-4">
                <input type="text" name="href" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>控制器/方法" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标名称</label>
            <div class="layui-input-4">
                <input type="text" name="icon" placeholder="<?php echo lang('pleaseEnter'); ?>图标名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单状态</label>
            <div class="layui-input-block">
                <input type="radio" name="menustatus" lay-filter="menustatus" checked value="1" title="开启">
                <input type="radio" name="menustatus" lay-filter="menustatus" value="0" title="关闭">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-2">
                <input type="text" name="sort" value="50" placeholder="<?php echo lang('pleaseEnter'); ?>排序编号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="auth">立即提交</button>
                <a href="<?php echo url('adminRule'); ?>" class="layui-btn layui-btn-primary">返回</a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,layer = layui.layer,$= layui.jquery;
        form.on('submit(auth)', function (data) {
            // 提交到方法 默认为本身
            $.post("<?php echo url('ruleAdd'); ?>",data.field,function(res){
                if(res.code > 0){
                    layer.msg(res.msg,{time:1000,icon:1},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
            });
        })
    });
</script>