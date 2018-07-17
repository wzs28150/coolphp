<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:39:"G:\coolphp/app/home\view\page_show.html";i:1531754296;s:41:"G:\coolphp\app\home\view\common_head.html";i:1527394493;s:48:"G:\coolphp\app\home\view\common_photography.html";i:1527394493;s:43:"G:\coolphp\app\home\view\common_footer.html";i:1531754296;}*/ ?>
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
    <link rel="stylesheet" type="text/css" href="/public/static/home/rs-plugin/rs-plugin/css/settings.css" media="screen" />

    <!-- Bootstrap Core CSS -->
    <link href="/public/static/home/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/public/static/home/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/public/static/home/css/ionicons.min.css" rel="stylesheet">
    <link href="/public/static/home/css/main.css" rel="stylesheet">
    <link href="/public/static/home/css/style.css" rel="stylesheet">
    <link href="/public/static/home/css/responsive.css" rel="stylesheet">

    <!-- COLORS -->
    <link rel="stylesheet" id="color" href="/public/static/home/css/default.css">

    <!-- JavaScripts -->
    <script src="/public/static/home/js/jquery-1.11.3.min.js"></script>
    <script src="/public/static/home/js/modernizr.js"></script>

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
                    <div class="logo"><a href="/index.html"><img class="img-responsive" src="/public/static/home/images/logo.png" alt=""></a></div>

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
                    <div class="social_icons"><a href="#." target="_blank"><i class="fa fa-weibo"></i></a> <a href="tencent://message/?uin=2503072299&Site=&Menu-=yes" target="_blank"><i
                        class="fa fa-qq"></i></a> <a href="/contact_16.html#content" target="_blank"><i class="fa fa-weixin"></i></a> <a href="#."
                            target="_blank"><i class="fa fa-youtube-play"></i></a>
                    </div>
                </div>
            </div>
        </header>
<!--======= SUB BANNER =========-->
<section class="sub-bnr parallax-bg" data-stellar-background-ratio="0.5" style="background:url(/public/static/home/images/slide-4.jpg) no-repeat;">
    <div class="container">
        <div class="position-center-center">
            <h3> Hello! 我们是酷创网络</h3>
            <p class="font-lora">“全力以赴，互促共生”</p>
        </div>
    </div>

    <!-- GO DOWN -->
    <div class="scroll"><a href="#content" class="go-down"><img src="/public/static/home/images/go-down.png" alt=""></a></div>
</section>

<!-- Content -->
<div id="content">


    <!-- Our Story -->
    <section class="story padding-top-100 padding-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <!-- Heading -->
                    <div class="heading text-left margin-bottom-40 margin-top-20">
                        <h4>关于我们</h4>
                        <hr> <?php echo $info['content']; ?>
                    </div>
                    <div>

                        <!-- Tab -->
                        <ul class="tabs margin-top-20 margin-bottom-30" role="tablist">
                            <?php $result = db("debris")->where("type_id = 6")->limit(3)->order("")->select();foreach ($result as $i=>$list):if($i == 0): ?>
                            <li role="presentation" class="active">
                                <?php else: ?>
                                <li role="presentation">
                                    <?php endif; ?>
                                    <a href="#retina<?php echo $i; ?>" aria-controls="home" role="tab" data-toggle="tab">
                                     <?php if($i == 0): ?>
                                    <i class="icon-phone"></i>
                                    <?php elseif($i == 1): ?>
                                    <i class="icon-tools-2"></i>
                                    <?php else: ?>
                                    <i class="icon-tools"></i>
                                     <?php endif; ?>
                                    0<?php echo $i+1; ?>. <?php echo $list['title']; ?>
                                </a>
                                </li>
                                <?php endforeach ?>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <?php $result = db("debris")->where("type_id = 6")->limit(3)->order("")->select();foreach ($result as $i=>$list):if($i == 0): ?>
                            <div role="tabpanel" class="tab-pane fade in active" id="retina<?php echo $i; ?>">
                                <?php echo $list['content']; ?>
                            </div>
                            <?php else: ?>
                            <div role="tabpanel" class="tab-pane fade" id="retina<?php echo $i; ?>">
                                <?php echo $list['content']; ?>
                            </div>
                            <?php endif; endforeach ?>
                        </div>
                    </div>
                </div>

                <!-- Story Img -->
                <div class="col-md-4">
                    <div class="single-slide">
                        <?php $result = db("debris")->where("type_id = 7")->limit(3)->order("")->select();foreach ($result as $i=>$list):?>
                        <div><?php echo $list['content']; ?></div>
                        <?php endforeach ?>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- SERVICES -->
    <section class="light-gray-bg  padding-top-100 padding-bottom-100">
        <div class="container">

            <!-- Heading -->
            <div class="heading text-center"><span>OUR SERVICES</span>
                <h4>我们能做的最好</h4>
                <hr>
                <p>
                    我们的价值不是完成数量的积累，而是品质的展现，长久的合作
                </p>
            </div>

            <!-- SERVICES WHAT WE OFFERS -->
            <div class="we-offer">
                <ul class="row">

                    <!-- Branding -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="icon-tools"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>一对一定制</h6>
                            <hr>
                            <p>
                                根据客户行业需求，制定专属网页风格，突出企业竞争优势，效果图修改致客户满意。
                            </p>
                        </div>
                    </li>

                    <!-- Web Designing -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="icon-laptop"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>专业编程</h6>
                            <hr>
                            <p>
                                根据不同页面需求，人工进行代码编写，确保网站运行流畅，后台操作简单易管理
                            </p>
                        </div>
                    </li>

                    <!-- Development -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="lnr lnr-rocket"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>功能开发</h6>
                            <hr>
                            <p>
                                根据客户需求，定制开发周边功能，专业开发团队将设计开发一站式服务。
                            </p>
                        </div>
                    </li>

                    <!-- Digital Marketing -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="icon-streetsign"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>技术多样 展现丰富</h6>
                            <hr>
                            <p>
                                通过多种技术展现形式。让网页展现的丰富多彩又不失高端大气时尚。
                            </p>
                        </div>
                    </li>

                    <!-- Web Analtics -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="icon-linegraph"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>实体化公司</h6>
                            <hr>
                            <p>
                                实体化公司，专业团队，多年行业经验。签单、制作、售后，全程服务让您放心满意。
                            </p>
                        </div>
                    </li>

                    <!-- Visual Graphic -->
                    <li class="col-md-4">
                        <div class="media-left">
                            <div class="icon"><i class="lnr lnr-screen"></i></div>
                        </div>
                        <div class="media-body">
                            <h6>合约明细</h6>
                            <hr>
                            <p>
                                明细化合约。我们保证，只要是我们承诺的，100%实现，说到必做。
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- FACTS -->
    <section class="facts parallax-bg padding-top-100 padding-bottom-70" data-stellar-background-ratio="0.8">
        <div class="container">
            <div class="row">
                <!-- Team Member -->
                <div class="col-md-3 margin-bottom-30">
                    <div class="fats-conter"><span class="number"> <span class="timer" data-speed="2000"
                                                                             data-refresh-interval="100" data-to="35"
                                                                             data-from="0">2980 <i
                                class="icon-anchor"></i></span> </span>
                        <h5>小时的工作时间</h5>
                        <hr>
                    </div>
                </div>

                <!-- Line Of Codes -->
                <div class="col-md-3 margin-bottom-30">
                    <div class="fats-conter"><span class="number"> <span class="timer" data-speed="2000"
                                                                             data-refresh-interval="100" data-to="5225"
                                                                             data-from="0">1280 <i
                                class="icon-pencil"></i></span> </span>
                        <h5>行代码构成网站</h5>
                        <hr>
                    </div>
                </div>

                <!-- Satisfied Client -->
                <div class="col-md-3  margin-bottom-30">
                    <div class="fats-conter"><span class="number"> <span class="timer" data-speed="2000"
                                                                             data-refresh-interval="100" data-to="4977"
                                                                             data-from="0">750<i class="icon-heart"></i></span>                        </span>
                        <h5>项目给我们认可</h5>
                        <hr>
                    </div>
                </div>

                <!-- PSD file included -->
                <div class="col-md-3 margin-bottom-30">
                    <div class="fats-conter"><span class="number"> <span class="timer" data-speed="2000"
                                                                             data-refresh-interval="100" data-to="178"
                                                                             data-from="0">520<i class="icon-bike"></i></span>                        </span>
                        <h5>杯咖啡陪我们熬夜</h5>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CLIENTS -->
    <section class="light-gray-bg padding-bottom-100 padding-top-100">
        <div class="container">

            <!-- Heading -->
            <div class="heading text-center "><span>OUR CLIENTS</span>
                <h4>我们合作的客户</h4>
                <hr>
                <p class="margin-top-30">“客户满意就是我们的一切!曈新科技期待与您携手共创辉煌未来!”</p>
            </div>

            <!-- CLIENTS -->
            <div class="clients-img">
                <ul class="row">
                    <?php $result = db("ad")->where("type_id = 10")->limit(999)->order("")->select();foreach ($result as $i=>$list):if($i > 5): if($list['url'] == '#.'): ?>
                        <li style="margin-top:30px;"><a href="javascript:void(0);"> <img src="/public/<?php echo $list['pic']; ?>" class="img-responsive" alt=""> </a></li>
                        <?php else: ?>
                        <li style="margin-top:30px;"><a href="<?php echo $list['url']; ?>" target="_blank"> <img src="/public/<?php echo $list['pic']; ?>" class="img-responsive" alt=""> </a></li>
                        <?php endif; else: if($list['url'] == '#.'): ?>
                        <li><a href="javascript:void(0);"> <img src="/public/<?php echo $list['pic']; ?>" class="img-responsive" alt=""> </a></li>
                        <?php else: ?>
                        <li><a href="<?php echo $list['url']; ?>" target="_blank"> <img src="/public/<?php echo $list['pic']; ?>" class="img-responsive" alt=""> </a></li>
                        <?php endif; endif; endforeach ?>
                </ul>
            </div>
        </div>
    </section>
    <!-- PHOTOGRAPHY -->
<!-- <section class="photography">
        <div class="container-fluid">
            <ul class="row">
                <li><img src="/public/static/home/images/photo-1.jpg" alt=""> <a href="/public/static/home/images/photo-1.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-2.jpg" alt=""> <a href="/public/static/home/images/photo-2.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-3.jpg" alt=""> <a href="/public/static/home/images/photo-3.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-4.jpg" alt=""> <a href="/public/static/home/images/photo-4.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-5.jpg" alt=""> <a href="/public/static/home/images/photo-5.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-6.jpg" alt=""> <a href="/public/static/home/images/photo-6.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-7.jpg" alt=""> <a href="/public/static/home/images/photo-7.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
                <li><img src="/public/static/home/images/photo-8.jpg" alt=""> <a href="/public/static/home/images/photo-8.jpg" data-lighter> <i
                            class="lnr lnr-frame-expand"></i> </a></li>
            </ul>
        </div>
    </section>-->
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
              <li><i class="lnr lnr-phone-handset"></i>13359982928</li>
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
              <div><a href="#."><img class="img-responsive" src="/public/static/home/images/img-1.jpg" alt=""></a></div>
              <div><a href="#."><img class="img-responsive" src="/public/static/home/images/img-2.jpg" alt=""></a></div>
              <div><a href="#."><img class="img-responsive" src="/public/static/home/images/img-3.jpg" alt=""></a></div>
              <div><a href="#."><img class="img-responsive" src="/public/static/home/images/img-4.jpg" alt=""></a></div>
              <div><a href="#."><img class="img-responsive" src="/public/static/home/images/img-5.jpg" alt=""></a></div>
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
            <div class="social_icons"><a href="#." target="_blank"><i class="fa fa-weibo"></i></a> <a href="tencent://message/?uin=2503072299&Site=&Menu-=yes" target="_blank"><i class="fa fa-qq"></i></a> <a href="/contact_16.html#content" target="_blank"><i
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

<script src="/public/static/home/js/bootstrap.min.js"></script>
<script src="/public/static/home/js/own-menu.js"></script>
<script src="/public/static/home/js/jquery.lighter.js"></script>
<script src="/public/static/home/js/jquery.colio.min.js"></script>
<script src="/public/static/home/js/jquery.cubeportfolio.min.js"></script>
<script src="/public/static/home/js/owl.carousel.min.js"></script>
<script src="/public/static/home/js/color-switcher.js"></script>
<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="/public/static/home/rs-plugin/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="/public/static/home/rs-plugin/rs-plugin/js/jquery.tp.min.js"></script>
<script src="/public/static/home/js/main.js"></script>
<?php $list ="<script type=\"text/javascript\">
        var _hmt = _hmt || [];
       (function() {
        var hm = document.createElement(\"script\");
          hm.src = \"/public/static/home/../common/js/tongji.min.js\";
          var s = document.getElementsByTagName(\"script\")[0];
          s.parentNode.insertBefore(hm, s);
        })();
       </script>
       ";echo $list;?>

</body>

</html>
