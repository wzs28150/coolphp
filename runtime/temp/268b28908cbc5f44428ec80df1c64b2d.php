<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:61:"/data/wwwroot/www.hrbkcwl.com/app/home/view/service_list.html";i:1506479045;s:60:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_head.html";i:1507885289;s:67:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_photography.html";i:1506478985;s:62:"/data/wwwroot/www.hrbkcwl.com/app/home/view/common_footer.html";i:1507819405;}*/ ?>
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

<section class="sub-bnr parallax-bg" data-stellar-background-ratio="0.5" style="background:url(__HOME__/images/sub-bnr-bg.jpg) no-repeat;">
    <div class="container">
        <div class="position-center-center">
            <h3>服务中心</h3>

            <!--======= Breadcrumb =========-->
            <ol class="breadcrumb">
                <li><a href="index.html">首页</a></li>
                <li class="active">服务中心</li>
            </ol>
        </div>
    </div>

    <!-- GO DOWN -->
    <div class="scroll"><a href="#content" class="go-down"><img src="__HOME__/images/go-down.png" alt=""></a></div>
</section>

<!-- Content -->
<div id="content">

    <!-- Welcome -->
    <section class="padding-top-150 padding-bottom-150">
        <div class="container">

            <!-- Heading -->
            <div class="heading text-center"><span>WHAT WE DO</span>
                <h4>我们提供最好的服务</h4>
                <hr>
                <p>
                    完善实用的售后服务标准，行业服务标准的倡导者。<br>全心全意做服务，一点一滴为客户。
                </p>
            </div>

            <!-- SERVICES -->
            <div class="services">
                <ul class="row">
                    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <!-- SERVICES -->
                    <li class="col-md-3">
                        <article>
                            <h6><?php echo $vo['title']; ?></h6>
                            <hr> <?php echo $vo['content']; ?>
                            <i class="lnr <?php echo $vo['tubiao']; ?>"></i></article>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </section>

    <!-- Testimonial -->
    <section class="testimonial padding-top-150 padding-bottom-150" style="background:url(__HOME__/images/testi-bg.jpg) repeat-y;"
        data-stellar-background-ratio="0.1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <!-- Test Slider -->
                    <div class="testi">
                        <div class="two-slider">
                            <?php $result = db("fuwukehu")->alias("a")->join("cool_category c","a.catid = c.id","left")
            ->where("catid=22
                            ")
            ->field("a.*,c.catdir")
            ->limit(10)
            ->order("listorder asc,createtime desc")
            ->select();foreach ($result as $k=>$vo):?>
                            <!-- Slider 1 -->
                            <div class="in-testi">

                                <!-- Avatars -->
                                <div class="avatars"><img src="__PUBLIC__<?php echo $vo['thumb']; ?>" alt=""></div>
                                <div class="testi-name"><i class="fa fa-quote-left"></i>
                                    <h5><?php echo $vo['title']; ?>&nbsp;&nbsp;&nbsp;<?php echo $vo['zhiwei']; ?></h5>
                                    <?php echo $vo['content']; ?>
                                </div>
                                <span><?php echo $vo['xingming']; ?></span>
                            </div>

                            <!-- Slider 1 -->

                            <?php endforeach ?>
                        </div>
                    </div>
                </div>
            </div>
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