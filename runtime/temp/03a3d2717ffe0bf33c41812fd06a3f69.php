<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:66:"/data/wwwroot/www.hrbkcwl.com/app/home/view/page_show_contace.html";i:1507623663;s:60:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_head.html";i:1507885289;s:67:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_photography.html";i:1506478985;s:62:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_footer.html";i:1507819405;}*/ ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="M_Adnan">
    <title><?php if($info['title']): ?><?php echo $info['title']; ?>-<?php echo $sys['title']; elseif($title): ?><?php echo $title; ?>-<?php echo $sys['title']; else: ?><?php echo $sys['title']; ?>_服务最好的网站建设公司<?php endif; ?></title>
    <meta name="keywords" content="<?php if($info[ 'keywords']): ?><?php echo $info['keywords']; elseif($keywords): ?><?php echo $keywords; else: ?><?php echo $sys['key']; endif; ?>" />
    <meta name="description" content="<?php if($info[ 'description']): ?><?php echo $info['description']; elseif($description): ?><?php echo $description; else: ?><?php echo $sys['des']; endif; ?>" />
    <meta name="author" content="wzs">
    <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="__HOME__/rs-plugin/rs-plugin/css/settings.css" media="screen" />

    <!-- Bootstrap Core CSS -->
    <link href="__HOME__/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="__HOME__/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="__HOME__/css/ionicons.min.css" rel="stylesheet">
    <link href="__HOME__/css/main.css" rel="stylesheet">
    <link href="__HOME__/css/style.css" rel="stylesheet">
    <link href="__HOME__/css/responsive.css" rel="stylesheet">

    <!-- COLORS -->
    <link rel="stylesheet" id="color" href="__HOME__/css/default.css">

    <!-- JavaScripts -->
    <script src="__HOME__/js/jquery-1.11.3.min.js"></script>
    <script src="__HOME__/js/modernizr.js"></script>

    <!-- Online Fonts -->
    <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,200,300,500,600,700,800,900,100' rel='stylesheet' type='text/css'> -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="animated infinite">

    <!-- Wrap -->
    <div id="wrap">

        <!-- header -->
        <header class="header-normal">
            <div class="sticky">
                <div class="container">
                    <!-- Logo -->
                    <div class="logo"><a href="#."><img class="img-responsive" src="__HOME__/images/logo.png" alt=""></a></div>

                    <!-- Navigation -->
                    <nav class="navbar webimenu">
                        <!-- MENU BUTTON RESPONSIVE -->
                        <div class="menu-toggle"><i class="fa fa-bars"> </i></div>
                        <!-- NAV -->
                        <ul class="nav ownmenu">
                            <li <?php if($controller == 'index'): ?>class="active meganav" <?php endif; ?>>
                                <a href="<?php echo url('home/index/index'); ?>" title="网站首页">网站首页</a>
                            </li>
                            <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li>
                                <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>" title="<?php echo $vo['catname']; ?>"><?php echo $vo['catname']; ?></a>
                            </li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </nav>

                    <!-- Social Icons -->
                    <div class="social_icons"><a href="#." target="_blank"><i class="fa fa-weibo"></i></a> <a href="#." target="_blank"><i
                        class="fa fa-qq"></i></a> <a href="#." target="_blank"><i class="fa fa-weixin"></i></a> <a href="#."
                            target="_blank"><i class="fa fa-youtube-play"></i></a>
                    </div>
                </div>
            </div>
        </header>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<section class="sub-bnr parallax-bg" data-stellar-background-ratio="0.5" style="background:url(__HOME__/images/sub-bnr-bg.jpg) no-repeat;">
    <div class="container">
        <div class="position-center-center">
            <h3>联系我们</h3>

            <!--======= Breadcrumb =========-->
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li class="active">联系我们</li>
            </ol>
        </div>
    </div>

    <!-- GO DOWN -->
    <div class="scroll"><a href="#content" class="go-down"><img src="__HOME__/images/go-down.png" alt=""></a></div>
</section>

<!-- Content -->
<div id="content">

    <!-- Contact Info -->
    <section class="light-gray-bg contact-info  padding-top-0 padding-bottom-0">
        <div class="row">

            <!-- MAP -->
            <div class="col-lg-6">
                <div id="map"></div>
            </div>

            <!-- Number -->
            <div class="col-lg-6">
                <div class="number"><i class="lnr  lnr-phone-handset"></i>
                    <h1>0451-51035164</h1>
                    <p>13359982928&nbsp;靳欣</p>
                </div>

                <!-- Address -->
                <div class="row">
                    <div class="col-sm-6">
                        <div class="info-office">
                            <?php echo $info['content']; ?>
                        </div>
                    </div>

                    <!-- img -->
                    <div class="col-sm-6"><img class="img-responsive" src="__HOME__/images/conatct-img.jpg" alt=""></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Info -->
    <section class="contact-info  padding-top-150 padding-bottom-150">
        <div class="container">

            <!-- Heading -->
            <div class="heading text-center"><span>say hello</span>
                <h4>在线留言</h4>
                <hr>
                <p>请详细描述您的疑问，并留下您的联系方式，我们会在第一时间与您沟通。</p>
            </div>

            <!-- Contact  -->
            <section class="contact-us">
                <div class="contact-form">

                    <!-- FORM -->
                    <form role="form" id="contact_form" class="contact-form" method="post" onSubmit="return false">
                        <ul class="row">
                            <li class="col-sm-4">
                                <label>*姓名
                                        <input type="text" class="form-control" name="name" id="name" placeholder="">
                                    </label>
                            </li>
                            <li class="col-sm-4">
                                <label>*邮箱
                                        <input type="text" class="form-control" name="email" id="email" placeholder="">
                                    </label>
                            </li>
                            <li class="col-sm-4">
                                <label>*电话
                                        <input type="text" class="form-control" name="tel" id="tel"
                                               placeholder="">
                                    </label>
                            </li>
                            <li class="col-sm-12">
                                <label>*留言
                                        <textarea class="form-control" name="content" id="msg" rows="5"
                                                  placeholder=""></textarea>
                                    </label>
                            </li>
                            <li class="col-sm-12 text-center no-margin">
                                <button type="submit" value="submit" class="btn" id="btn_submit">现在发送</button>
                            </li>
                        </ul>
                    </form>
                </div>
            </section>
        </div>
    </section>
    <!-- PHOTOGRAPHY -->
<section class="photography">
        <div class="container-fluid">
            <ul class="row">
                <li><img src="__HOME__/images/photo-1.jpg" alt=""> <a href="__HOME__/images/photo-1.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-2.jpg" alt=""> <a href="__HOME__/images/photo-2.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-3.jpg" alt=""> <a href="__HOME__/images/photo-3.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-4.jpg" alt=""> <a href="__HOME__/images/photo-4.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-5.jpg" alt=""> <a href="__HOME__/images/photo-5.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-6.jpg" alt=""> <a href="__HOME__/images/photo-6.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-7.jpg" alt=""> <a href="__HOME__/images/photo-7.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="__HOME__/images/photo-8.jpg" alt=""> <a href="__HOME__/images/photo-8.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
            </ul>
        </div>
    </section>
</div>
<script>
    $('#btn_submit').click(function () {
        var name = $('#name').val();
        var email = $('#email').val();
        var tel = $('#tel').val();
        var content = $('#msg').val();
        if ($.trim(name) == '') {
            alert('称呼不能为空');
            return false;
        }
        if ($.trim(email) == '') {
            alert('邮箱不能为空');
            return false;
        }
        if ($.trim(tel) == '') {
            alert('电话不能为空');
            return false;
        }
        if ($.trim(content) == '') {
            alert('内容不能为空');
            return false;
        }
        $.post("/home_contact_senMsg.html", {
            tel: tel,
            name: name,
            email: email,
            content: content
        }, function (data) {
            if (data.status == 1) {
                alert('留言成功！感谢您对我们的支持！');
                window.location.href = "/contact_16.html"
            } else {
                alert('留言失败！重新提交试试！');
            }
        })
    })
</script>

<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap() {
        createMap(); //创建地图
        setMapEvent(); //设置地图事件
        //addMapControl();//向地图添加控件
        addMarker(); //向地图中添加marker
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("map"); //在百度地图容器中创建一个地图
        var point = new BMap.Point(126.656163, 45.74219); //定义一个中心点坐标
        map.centerAndZoom(point, 18); //设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map; //将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
        // map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard(); //启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT,
            type: BMAP_NAVIGATION_CONTROL_LARGE
        });
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({
            anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
            isOpen: 1
        });
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({
            anchor: BMAP_ANCHOR_BOTTOM_LEFT
        });
        map.addControl(ctrl_sca);
    }

    //标注点数组
    var markerArr = [{
        title: "哈尔滨酷创网络科技有限公司",
        content: "哈尔滨市南岗区文景街86号",
        point: "126.65623|45.742693",
        isOpen: 1,
        icon: {
            w: 23,
            h: 25,
            l: 0,
            t: 275,
            x: 9,
            lb: 12
        }
    }];
    //创建marker
    function addMarker() {
        for (var i = 0; i < markerArr.length; i++) {
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0, p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point, {
                icon: iconImg
            });
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title, {
                "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20)
            });
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor: "#808080",
                color: "#333",
                cursor: "pointer"
            });

            (function () {
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click", function () {
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open", function () {
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close", function () {
                    _marker.getLabel().show();
                })
                label.addEventListener("click", function () {
                    _marker.openInfoWindow(_iw);
                })
                if (!!json.isOpen) {
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i) {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title +
            "</b><div class='iw_poi_content'>" + json.content + "</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json) {
        var icon = new BMap.Icon("http://api.map.baidu.com/img/markers.png", new BMap.Size(json.w, json.h), {
            imageOffset: new BMap.Size(-json.l, -json.t),
            infoWindowOffset: new BMap.Size(json.lb + 5, 1),
            offset: new BMap.Size(json.x, json.h)
        })
        return icon;
    }

    initMap(); //创建和初始化地图
</script>
<!--======= FOOTER =========-->
    <footer>
        <div class="container">

            <!-- FOOTER -->
            <div class="footer-info">
                <div class="row">

                    <!-- keep in touch -->
                    <div class="col-md-4">
                        <div class="padding-right-50">
                            <h6>关于我们</h6>
                            <p>是一家专业从事网站建设，在线推广宣传，微营销，大项目定制的电子商务公司。</p>
                            <ul class="personal-info">
                                <li><i class=" icon-map"></i>哈尔滨市南岗区文景街86号</li>
                                <li><i class="icon-envelope"></i>hrbkcwl@163.com</li>
                                <li><i class="lnr lnr-phone-handset"></i>15004522010</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Links -->
                    <div class="col-md-2">
                        <h6>网站导航</h6>
                        <ul class="links">
                            <li><a href="index.html">网站首页</a></li>
                             <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li>
                                <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>" title="<?php echo $vo['catname']; ?>"><?php echo $vo['catname']; ?></a>
                            </li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </div>

                    <!-- INSTAGRAM  -->
                    <div class="col-md-3">
                        <h6>最新活动</h6>
                        <div class="flicker">
                            <div class="single-slide">
                                <div><a href="#."><img class="img-responsive" src="__HOME__/images/img-1.jpg" alt=""></a></div>
                                <div><a href="#."><img class="img-responsive" src="__HOME__/images/img-2.jpg" alt=""></a></div>
                                <div><a href="#."><img class="img-responsive" src="__HOME__/images/img-3.jpg" alt=""></a></div>
                                <div><a href="#."><img class="img-responsive" src="__HOME__/images/img-4.jpg" alt=""></a></div>
                                <div><a href="#."><img class="img-responsive" src="__HOME__/images/img-5.jpg" alt=""></a></div>
                            </div>
                        </div>
                    </div>

                    <!-- keep in touch -->
                    <div class="col-md-3">
                        <h6>资讯通讯</h6>
                        <div class="news-letter">
                            <p>把我们的最新资讯、产品、活动，第一时间与您分享:</p>
                            <form class="subscribe">
                                <input type="tel" placeholder="邮箱">
                                <button type="submit"><i class="fa fa-envelope"></i></button>
                            </form>

                            <!-- Social Icons -->
                            <div class="social_icons"><a href="#." target="_blank"><i class="fa fa-weibo"></i></a> <a href="#." target="_blank"><i class="fa fa-qq"></i></a>                                <a href="#." target="_blank"><i
                                    class="fa fa-weixin"></i></a> <a href="#." target="_blank"><i
                                    class="fa fa-youtube-play"></i></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!--======= RIGHTS =========-->
    <div class="rights">
        <div class="container">
            <p>版权所有 2017 哈尔滨酷创网络科技有限公司 黑ICP备17007278号</p>
            <div class="scroll"><a href="#wrap" class="go-up"><i class="lnr lnr-arrow-up"></i></a></div>
        </div>
    </div>
    </div>


<!-- JavaScripts -->

<script src="__HOME__/js/bootstrap.min.js"></script>
<script src="__HOME__/js/own-menu.js"></script>
<script src="__HOME__/js/jquery.lighter.js"></script>
<script src="__HOME__/js/jquery.colio.min.js"></script>
<script src="__HOME__/js/jquery.cubeportfolio.min.js"></script>
<script src="__HOME__/js/owl.carousel.min.js"></script>
<script src="__HOME__/js/color-switcher.js"></script>
<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="__HOME__/rs-plugin/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="__HOME__/rs-plugin/rs-plugin/js/jquery.tp.min.js"></script>
<script src="__HOME__/js/main.js"></script>
</body>

</html>