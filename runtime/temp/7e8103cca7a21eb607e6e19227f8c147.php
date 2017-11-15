<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/auth/groupAccess.html";i:1504236102;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/head.html";i:1505459050;s:61:"/data/wwwroot/www.hrbkcwl.com/app/admin/view/common/foot.html";i:1503623995;}*/ ?>
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
<link rel="stylesheet" href="__STATIC__/plugins/zTree/css/zTreeStyle.css" type="text/css">
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field">
        <legend>配置权限</legend>
        <div class="layui-field-box">
            <form class="layui-form layui-form-pane">
                <ul id="treeDemo" class="ztree"></ul>
                <div class="layui-form-item text-center">
                    <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
                    <button class="layui-btn layui-btn-danger" type="button" onclick="window.history.back()"><?php echo lang('back'); ?></button>
                </div>
            </form>
        </div>
    </fieldset>
</div>
<script type="text/javascript" src="__STATIC__/plugins/layui/layui.js"></script>


<script type="text/javascript" src="__STATIC__/common/js/jquery.2.1.1.min.js"></script>
<script type="text/javascript" src="__STATIC__/plugins/zTree/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="__STATIC__/plugins/zTree/js/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript">
    var setting = {
        check:{enable: true},
        view: {showLine: false, showIcon: false, dblClickExpand: false},
        data: {
            simpleData: {enable: true, pIdKey:'pid', idKey:'id'},
            key:{name:'title'}
        }
    };
    var zNodes =<?php echo $data; ?>;
    function setCheck() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.check.chkboxType = { "Y":"ps", "N":"ps"};

    }
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    setCheck();
    layui.use(['form', 'layer'], function () {
        var form = layui.form, layer = layui.layer;
        form.on('submit(submit)', function () {
            loading =layer.load(1, {shade: [0.1,'#fff']});
            // 提交到方法 默认为本身
            var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
                nodes=treeObj.getCheckedNodes(true),
                v="";
            for(var i=0;i<nodes.length;i++){
                v+=nodes[i].id + ",";
            }
            var id = "<?php echo input('id'); ?>";
            $.post("<?php echo url('groupSetaccess'); ?>", {'rules':v,'group_id':id}, function (res) {
                layer.close(loading);
                if (res.code > 0) {
                    layer.msg(res.msg, {time: 1800, icon: 1}, function () {
                        location.href = res.url;
                    });
                } else {
                    layer.msg(res.msg, {time: 1800, icon: 2});
                }
            });
        })
    });
</script>