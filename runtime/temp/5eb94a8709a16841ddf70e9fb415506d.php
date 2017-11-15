<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/template/images.html";i:1504236401;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/head.html";i:1505459050;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/foot.html";i:1503623995;}*/ ?>
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
<style>
    a{text-decoration: none;}
    .table-list ul.pic { list-style: none;}
    .table-list ul.pic li {float:left;position:relative;margin:5px 10px;_margin:5px 8px;text-align: center;}
    .table-list ul.pic li span { width:82px;height:82px;display: block;border: 1px solid #dedede;}
    .table-list ul.pic li span a {border:1px solid #eee;width:80px;height:80px;*font-size: 75px;display: table-cell; vertical-align: middle; overflow: hidden;}
    .table-list ul.pic li img  {max-height:80px;max-width:80px ;_width:80px;_height:80px;}
    .table-list ul.pic li  b {display:block;line-height:20px;height:20px;font-weight:normal;width:82px;overflow:hidden;}
    .table-list ul.pic li  em {position:absolute;right:25px;bottom:20px;font-style: normal;}
    .table-list ul.pic li  em a{color: #f00;}
</style>
<div class="admin-main fadeInUp animated">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo $title; ?></legend>
    </fieldset>
    <div class="layui-field-box">
        <blockquote class="layui-elem-quote">
            <a href="<?php echo url('index'); ?>" class="layui-btn layui-btn-small">
            <i class="fa fa-file-code-o "></i> <?php echo strtoupper($viewSuffix); ?>
            </a>
            <a href="<?php echo url('index',array('type'=>'css')); ?>" class="layui-btn layui-btn-small">
            <i class="fa fa-css3"></i> CSS
            </a>
            <a href="<?php echo url('index',array('type'=>'js')); ?>" class="layui-btn layui-btn-small">
            <i class="fa fa-file-text-o"></i> JS
            </a>
            <a href="<?php echo url('images'); ?>" class="layui-btn layui-btn-small layui-btn-danger">
                <i class="fa fa-file-image-o"></i> 媒体文件
            </a>
            <a href="<?php echo url('add'); ?>" style="float: right;" class="layui-btn layui-btn-small layui-btn-normal">
                <i class="fa fa-plus"></i> <?php echo lang('add'); ?>模版
            </a>
        </blockquote>
        <div class="table-list">
            <ul class="pic">
                <?php if($leve): ?>
                <li>
                    <span><a href="<?php echo url('images'); ?>?folder=<?php echo $uppath; ?>"><img src="__ADMIN__/images/upback.gif"></a></span>
                    <b><font color="#665aff">返回上一级</font></b></li>
                <?php endif; if(is_array($folders) || $folders instanceof \think\Collection || $folders instanceof \think\Paginator): $i = 0; $__LIST__ = $folders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li>
                    <span><a href="<?php echo url('images'); ?>?folder=<?php echo input('folder'); ?><?php echo $vo['filename']; ?>/"><img src="__ADMIN__/images/folder.gif"></a></span>
                    <b><?php echo $vo['filename']; ?></b>
                    <em>
                        <a href="javascript:confirm_delete('<?php echo input('folder'); ?>','<?php echo $vo['filename']; ?>')">删除</a>
                    </em>
                </li>
                <?php endforeach; endif; else: echo "" ;endif; if(is_array($files) || $files instanceof \think\Collection || $files instanceof \think\Paginator): $i = 0; $__LIST__ = $files;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li>
                    <span>
                        <a href="__STATIC__/home/images/<?php echo input('folder'); ?><?php echo $vo['filename']; ?>" target="_blank">
                            <?php if(!empty($vo['ico'])): ?>
                            <img src="__STATIC__/home/images/ext/<?php echo $vo['ext']; ?>.png">
                            <?php else: ?>
                            <img src="__STATIC__/home/images/<?php echo input('folder'); ?><?php echo $vo['filename']; ?>" >
                            <?php endif; ?>
                        </a>
                    </span>
                    <b><?php echo $vo['filename']; ?></b>
                    <em><a href="javascript:confirm_delete('<?php echo input("folder"); ?>','<?php echo $vo['filename']; ?>')">删除</a></em>
                </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script src="__STATIC__/common/js/jquery.2.1.1.min.js"></script>
<script>
    function confirm_delete(folder,filename) {
        layer.confirm('你确定要删除吗？', {icon: 3}, function (index) {
            layer.close(index);
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post("<?php echo url('imgDel'); ?>",{folder:folder,filename:filename},function(data){
                layer.close(loading);
                if(data.code==1){
                    layer.alert(data.msg, {icon: 6}, function(index){
                        layer.close(index);
                        location.replace(location.href);
                    });
                }else{
                    layer.alert(data.msg, {icon: 5}, function(index){
                        layer.close(index);
                    });
                }
            })
        });
    }

</script>