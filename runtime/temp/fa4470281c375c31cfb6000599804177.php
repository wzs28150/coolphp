<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"/data/wwwroot/www.hrbkcwl.com/app/home/view/case_load.html";i:1506589013;}*/ ?>
<?php if($list): if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<div class="cbp-item item portfolio-item w<?php echo $vo['catid']; ?>">
    <div class="port-item"><img src="__PUBLIC__<?php echo $vo['thumb']; ?>" alt="">
        <div class="hover-info">
            <div class="hover-in">
                <div class="position-center-center"><span><?php echo getcatname($vo['catid']); ?></span>
                    <hr>
                    <h6><?php echo $vo['title']; ?></h6>
                    <a class="cbp-singlePage" href="<?php echo url('home/'.$vo['catdir'].'/info',array('id'=>$vo['id'],'catId'=>$vo['catid'])); ?>">
                        <i class="lnr lnr-link"></i>
                    </a>                                     
                    <a href="__PUBLIC__<?php echo $vo['thumb']; ?>" class="cbp-lightbox"><i class="lnr lnr-frame-expand"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endforeach; endif; else: echo "" ;endif; else: ?>null<?php endif; ?>
