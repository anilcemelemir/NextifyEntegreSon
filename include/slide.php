 <section class="particles-js" data-color="#fe4c1c,#00c3ff,#0160e7" data-id="i1-top">
     <div id="rev_slider_one_wrapper" class="rev_slider_wrapper fullscreen-container" data-alias="mask-showcase" data-source="gallery" style="background:#ffffff;padding:0px;">
         <div id="rev_slider_one" class="rev_slider fullscreenbanner" style="display:none;" data-version="5.4.1">
             <ul>
                 <?php 
     $slider=$db->prepare("SELECT * from slayt order by slayt_sira ASC");
     $slider->execute(array(0));
     while($sliderprint=$slider->fetch(PDO::FETCH_ASSOC)) {  
         ?>
                 <li data-index="rs-<?php echo $sliderprint[ 'slayt_id' ]; ?>" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-thumb="images/bg-sabout-home2.png" data-rotate="0" data-saveperformance="off" data-title="" data-param1="1" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                     <div class="tp-caption tp-shape tp-shapewrapper  rs-parallaxlevel-tobggroup" id="slide-<?php echo $sliderprint[ 'slayt_id' ]; ?>-layer-1" data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']" data-voffset="['90','76','57','35']" data-width="['203','173','0','0']" data-height="['402','343','260','160']" data-whitespace="nowrap" data-type="shape" data-basealign="slide" data-responsive_offset="off" data-responsive="off" data-frames='[{"from":"opacity:0;","speed":1500,"to":"o:1;","delay":150,"ease":"Power2.easeInOut"},{"delay":"wait","speed":1500,"to":"opacity:0;","ease":"Power2.easeInOut"}]' data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 6;">
                         <img src="images/shape-process2-1.png" alt="">
                     </div>
                     <div class="tp-caption" id="slide-<?php echo $sliderprint[ 'slayt_id' ]; ?>-layer-2" data-x="['right','right','right','right']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']" data-voffset="['-47','-40','0','0']" data-width="['861','500','0','0']" data-height="['1000','581','418','257']" data-whitespace="nowrap" data-type="shape" data-basealign="slide" data-responsive_offset="off" data-responsive="off" data-frames='[{"from":"opacity:0;","speed":500,"to":"o:1;","delay":1000,"ease":"Power2.easeInOut"},{"delay":"wait","speed":1500,"to":"opacity:0;","ease":"Power2.easeInOut"}]' data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 6;display: flex;align-content: center;flex-wrap: wrap;align-items: baseline;justify-content: space-evenly;">
                         <img src="admin/<?php echo $sliderprint['slayt_resim']; ?>" alt="">
                     </div>
                     <div class="tp-caption   tp-resizeme" id="slide-<?php echo $sliderprint[ 'slayt_id' ]; ?>-layer-6" data-x="['left','left','left','left']" data-hoffset="['15','15','15','15']" data-y="['top','top','top','top']" data-voffset="['280','128','110','67']" data-fontsize="['56','47','48','32']" data-lineheight="['72','58','56','38']" data-whitespace="nowrap" data-type="text" data-responsive_offset="on" data-frames='[{"from":"y:100px(R);opacity:0;","speed":1000,"to":"o:1;","delay":1500,"ease":"Power4.easeOut"},
                                    {"delay":"wait","speed":1000,"to":"y:-50px;opacity:0;","ease":"Power2.easeInOut"}]' data-textAlign="['left','left','left','left']" style="z-index: 10;  font-weight: 900; color: #1a1b1e; font-family: 'Red Hat Display', sans-serif;"><?php echo $sliderprint['slayt_baslik']; ?> </div>
                     <div class="tp-caption   tp-resizeme" id="slide-<?php echo $sliderprint[ 'slayt_id' ]; ?>-layer-7" data-x="['left','left','left','left']" data-hoffset="['15','15','15','15']" data-y="['top','top','top','top']" data-voffset="['450','265','240','180']" data-fontsize="['22','18','22','16']" data-lineheight="['36','30','32','24']" data-whitespace="nowrap" data-type="text" data-responsive_offset="on" data-frames='[{"from":"y:100px(R);opacity:0;","speed":1000,"to":"o:1;","delay":1800,"ease":"Power4.easeOut"},
                                    {"delay":"wait","speed":1000,"to":"y:-50px;opacity:0;","ease":"Power2.easeInOut"}]' data-textAlign="['left','left','left','left']" style="z-index: 10; white-space: normal; color: #1a1b1e;font-family: 'Red Hat Display', sans-serif;"><?php echo $sliderprint['slayt_aciklama']; ?></div>
                     <?php
                            $kontrol = strlen( $sliderprint[ 'slayt_butonad' ] );
                            if ( $kontrol > 0 ) { ?>
                     <div class="tp-caption rev-btn  tp-resizeme" id="slide-<?php echo $sliderprint[ 'slayt_id' ]; ?>-layer-8" data-x="['left','left','left','left']" data-hoffset="['15','15','15','15']" data-y="['top','top','top','top']" data-voffset="['570','365','330','220']" data-width="none" data-height="none" data-whitespace="nowrap" data-type="button" data-responsive_offset="on" data-frames='[{"from":"y:100px(R);opacity:0;","speed":1000,"to":"o:1;","delay":2100,"ease":"Power4.easeOut"},
                                    {"delay":"wait","speed":1000,"to":"y:-50px;opacity:0;","ease":"Power2.easeInOut"}]' data-textAlign="['center','center','center','center']" data-paddingtop="[0,0,0,30]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index:10;"><a href="<?php echo $sliderprint[ 'slayt_butonlink' ]; ?>" class="octf-btn octf-btn-primary octf-btn-icon"><?php echo $sliderprint[ 'slayt_butonad' ]; ?> <i class="flaticon-right-arrow-1"></i></a></div>
                     <?php } ?>
                 </li>
                 <?php } ?>
             </ul>
             <div class="tp-bannertimer" style="height: 10px; background: rgba(0, 0, 0, 0);"></div>
         </div>
     </div>
 </section>