<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"/data/wwwroot/www.hrbkcwl.com/app/home/view/case_show.html";i:1506582403;}*/ ?>
<div class="detail-img">
    <!-- Portfolio Slider -->
    <div class="cbp-slider">
        <ul class="cbp-slider-wrap">
            <?php $_result=getzutu($info['bannerzutu']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <li class="cbp-slider-item"> <img class="img-responsive" src="<?php echo imgUrl($vo); ?>" alt=""> </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
</div>

<div class="container">
    <!-- Portfolio Details -->
    <section class="portfolio-details">

        <!-- Project Detail -->
        <div class="padding-top-100 padding-bottom-100">
            <div class="container">

                <!-- Heading -->
                <div class="heading text-center margin-bottom-30">
                    <h4><?php echo $info['title']; ?></h4>
                    <hr class="margin-bottom-40"> <?php echo $info['content']; ?>
                </div>

                <!-- Project Info -->
                <div class="text-center">
                    <ul class="projext-info">
                        <li><span>客户 - </span><?php echo $info['kehu']; ?></li>
                        <li><span>技术 - </span> <?php echo $info['jishu']; ?></li>
                        <li><span>日期   - </span><?php echo toDate($info['createtime'],'Y-m-d'); ?></li>
                    </ul>
                    <a href="#." class="btn-1 btn-2 margin-top-50">查看项目<i class="fa fa-plus"></i></a> </div>
                <div class="project-img">
                    <ul class="row">
                        <?php $_result=getzutu($info['zutu']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <li class="col-md-6"> <img class="img-responsive" src="<?php echo imgUrl($vo); ?>" alt=""> </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>