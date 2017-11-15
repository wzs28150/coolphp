<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:62:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/wechat/index.html";i:1504236454;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/head.html";i:1505459050;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/foot.html";i:1503623995;}*/ ?>
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
        <legend>公众号管理</legend>
    </fieldset>

    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">服务器地址</label>
            <div class="layui-input-4">
                <input type="text" value="<?php echo $apiurl; ?>" readonly class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公众号名称</label>
            <div class="layui-input-4">
                <input type="text" lay-verify="required" name="wxname" value="<?php echo $info['wxname']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?>公众号名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">原始ID</label>
            <div class="layui-input-4">
                <input type="text" name="wxid" value="<?php echo $info['wxid']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>公众号原始ID" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">微信号</label>
            <div class="layui-input-4">
                <input type="text" name="weixin" value="<?php echo $info['weixin']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>微信号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">AppID</label>
            <div class="layui-input-3">
                <input type="text" name="appid" value="<?php echo $info['appid']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>AppID" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">AppSecret</label>
            <div class="layui-input-3">
                <input type="text" name="appsecret" value="<?php echo $info['appsecret']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>AppSecret" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Token</label>
            <div class="layui-input-3">
                <input type="text" name="w_token" value="<?php echo $info['w_token']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>Token" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">微信号类型</label>
            <div class="layui-input-3">
                <select name="type">
                    <option <?php if($info['type'] == 1): ?>selected<?php endif; ?> value="1">订阅号</option>
                    <option <?php if($info['type'] == 2): ?>selected<?php endif; ?> value="2">认证订阅号</option>
                    <option <?php if($info['type'] == 3): ?>selected<?php endif; ?> value="3">服务号</option>
                    <option <?php if($info['type'] == 4): ?>selected<?php endif; ?> value="4">认证服务号</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">接入状态</label>
            <div class="layui-input-block">
                <input type="radio" name="wait_access" lay-filter="open" <?php if($info['wait_access'] == 0): ?>checked="checked"<?php endif; ?> value="0" title="等待接入">
                <input type="radio" name="wait_access" lay-filter="open" <?php if($info['wait_access'] == 1): ?>checked="checked"<?php endif; ?> value="1" title="已接入">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">关注回复</label>
            <div class="layui-input-block">
                <textarea name="concern" placeholder="<?php echo lang('pleaseEnter'); ?>关注回复" class="layui-textarea"><?php echo $info['concern']; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">默认回复</label>
            <div class="layui-input-block">
                <textarea name="default" placeholder="<?php echo lang('pleaseEnter'); ?>默认回复" class="layui-textarea"><?php echo $info['default']; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script>
    layui.use('form', function () {
        var form = layui.form,$ = layui.jquery;
        form.on('submit(submit)', function (data) {
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post("<?php echo url('weixin'); ?>",data.field,function(res){
                layer.close(loading);
                if(res.code > 0){
                    layer.msg(res.msg,{time:1000,icon:1},function(){
                        location.href = "<?php echo url('index'); ?>";
                    });
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
            });
        })
    })
</script>