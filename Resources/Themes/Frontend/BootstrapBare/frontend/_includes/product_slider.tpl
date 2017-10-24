{* Config *}
{block name="frontend_common_product_slider_config"}
    {$productBoxLayout = ($productBoxLayout) ? $productBoxLayout : "slider"}
    {$fixedImageSize = ($fixedImageSize) ? $fixedImageSize : ""}
    
    {* set default values for all mobile configurations *}
    {$sliderMDArrows            = (isset($sliderMDArrows))          ? ($sliderMDArrows|sliderDefault)           : "1"}
    {$sliderMDDots              = (isset($sliderMDDots))            ? ($sliderMDDots|sliderDefault)             : "0"}
    {$sliderMDSlidesToShow      = (isset($sliderMDSlidesToShow))    ? $sliderMDSlidesToShow                     : "3"}
    {$sliderMDSlidesToScroll    = (isset($sliderMDSlidesToScroll))  ? $sliderMDSlidesToScroll                   : "3"}
    {$sliderMDVertical          = (isset($sliderMDVertical))        ? ($sliderMDVertical|sliderDefault)         : "0"}
    {$sliderMDAdaptiveHeight    = (isset($sliderMDAdaptiveHeight))  ? ($sliderMDAdaptiveHeight|sliderDefault)   : "0"}
    {$sliderMDCenterMode        = (isset($sliderMDCenterMode))      ? ($sliderMDCenterMode|sliderDefault)       : "0"}
    {$sliderMDCenterPadding     = (isset($sliderMDCenterPadding))   ? $sliderMDCenterPadding                    : "50px"}
    {$sliderMDAnimationSpeed    = (isset($sliderMDAnimationSpeed))  ? $sliderMDAnimationSpeed                   : "500"}
    {$sliderMDAutoplay          = (isset($sliderMDAutoplay))        ? ($sliderMDAutoplay|sliderDefault)         : "0"}
    {$sliderMDInfinite          = (isset($sliderMDInfinite))        ? ($sliderMDInfinite|sliderDefault)         : "1"}
    {$sliderMDSwipeToSlide      = (isset($sliderMDSwipeToSlide))    ? ($sliderMDSwipeToSlide|sliderDefault)     : "0"}
    {$sliderMDVariableWidth     = (isset($sliderMDVariableWidth))   ? ($sliderMDVariableWidth|sliderDefault)    : "0"}

    {$sliderHDArrows            = (isset($sliderHDArrows))          ? ($sliderHDArrows|sliderDefault)           : "1"}
    {$sliderHDDots              = (isset($sliderHDDots))            ? ($sliderHDDots|sliderDefault)             : "0"}
    {$sliderHDSlidesToShow      = (isset($sliderHDSlidesToShow))    ? $sliderHDSlidesToShow                     : "3"}
    {$sliderHDSlidesToScroll    = (isset($sliderHDSlidesToScroll))  ? $sliderHDSlidesToScroll                   : "3"}
    {$sliderHDVertical          = (isset($sliderHDVertical))        ? ($sliderHDVertical|sliderDefault)         : "0"}
    {$sliderHDAdaptiveHeight    = (isset($sliderHDAdaptiveHeight))  ? ($sliderHDAdaptiveHeight|sliderDefault)   : "0"}
    {$sliderHDCenterMode        = (isset($sliderHDCenterMode))      ? ($sliderHDCenterMode|sliderDefault)       : "0"}
    {$sliderHDCenterPadding     = (isset($sliderHDCenterPadding))   ? $sliderHDCenterPadding                    : "50px"}
    {$sliderHDAnimationSpeed    = (isset($sliderHDAnimationSpeed))  ? $sliderHDAnimationSpeed                   : "500"}
    {$sliderHDAutoplay          = (isset($sliderHDAutoplay))        ? ($sliderHDAutoplay|sliderDefault)         : "0"}
    {$sliderHDInfinite          = (isset($sliderHDInfinite))        ? ($sliderHDInfinite|sliderDefault)         : "1"}
    {$sliderHDSwipeToSlide      = (isset($sliderHDSwipeToSlide))    ? ($sliderHDSwipeToSlide|sliderDefault)     : "0"}
    {$sliderHDVariableWidth     = (isset($sliderHDVariableWidth))   ? ($sliderHDVariableWidth|sliderDefault)    : "0"}

    {$sliderSMArrows            = (isset($sliderSMArrows))          ? ($sliderSMArrows|sliderDefault)           : "1"}
    {$sliderSMDots              = (isset($sliderSMDots))            ? ($sliderSMDots|sliderDefault)             : "0"}
    {$sliderSMSlidesToShow      = (isset($sliderSMSlidesToShow))    ? $sliderSMSlidesToShow                     : "2"}
    {$sliderSMSlidesToScroll    = (isset($sliderSMSlidesToScroll))  ? $sliderSMSlidesToScroll                   : "2"}
    {$sliderSMVertical          = (isset($sliderSMVertical))        ? ($sliderSMVertical|sliderDefault)         : "0"}
    {$sliderSMAdaptiveHeight    = (isset($sliderSMAdaptiveHeight))  ? ($sliderSMAdaptiveHeight|sliderDefault)   : "0"}
    {$sliderSMCenterMode        = (isset($sliderSMCenterMode))      ? ($sliderSMCenterMode|sliderDefault)       : "0"}
    {$sliderSMCenterPadding     = (isset($sliderSMCenterPadding))   ? $sliderSMCenterPadding                    : "50px"}
    {$sliderSMAnimationSpeed    = (isset($sliderSMAnimationSpeed))  ? $sliderSMAnimationSpeed                   : "500"}
    {$sliderSMAutoplay          = (isset($sliderSMAutoplay))        ? ($sliderSMAutoplay|sliderDefault)         : "0"}
    {$sliderSMInfinite          = (isset($sliderSMInfinite))        ? ($sliderSMInfinite|sliderDefault)         : "1"}
    {$sliderSMSwipeToSlide      = (isset($sliderSMSwipeToSlide))    ? ($sliderSMSwipeToSlide|sliderDefault)     : "0"}
    {$sliderSMVariableWidth     = (isset($sliderSMVariableWidth))   ? ($sliderSMVariableWidth|sliderDefault)    : "0"}

    {$sliderXSArrows            = (isset($sliderXSArrows))          ? ($sliderXSArrows|sliderDefault)           : "1"}
    {$sliderXSDots              = (isset($sliderXSDots))            ? ($sliderXSDots|sliderDefault)             : "0"}
    {$sliderXSSlidesToShow      = (isset($sliderXSSlidesToShow))    ? $sliderXSSlidesToShow                     : "1"}
    {$sliderXSSlidesToScroll    = (isset($sliderXSSlidesToScroll))  ? $sliderXSSlidesToScroll                   : "1"}
    {$sliderXSVertical          = (isset($sliderXSVertical))        ? ($sliderXSVertical|sliderDefault)         : "0"}
    {$sliderXSAdaptiveHeight    = (isset($sliderXSAdaptiveHeight))  ? ($sliderXSAdaptiveHeight|sliderDefault)   : "0"}
    {$sliderXSCenterMode        = (isset($sliderXSCenterMode))      ? ($sliderXSCenterMode|sliderDefault)       : "0"}
    {$sliderXSCenterPadding     = (isset($sliderXSCenterPadding))   ? $sliderXSCenterPadding                    : "50px"}
    {$sliderXSAnimationSpeed    = (isset($sliderXSAnimationSpeed))  ? $sliderXSAnimationSpeed                   : "500"}
    {$sliderXSAutoplay          = (isset($sliderXSAutoplay))        ? ($sliderXSAutoplay|sliderDefault)         : "0"}
    {$sliderXSInfinite          = (isset($sliderXSInfinite))        ? ($sliderXSInfinite|sliderDefault)         : "1"}
    {$sliderXSSwipeToSlide      = (isset($sliderXSSwipeToSlide))    ? ($sliderXSSwipeToSlide|sliderDefault)     : "0"}
    {$sliderXSVariableWidth     = (isset($sliderXSVariableWidth))   ? ($sliderXSVariableWidth|sliderDefault)    : "0"}
{/block}

{* Template *}
{block name="frontend_common_product_slider_component"}
    {block name="frontend_common_product_slider_container"}
        <div class="slick{if $productSliderCls} {$productSliderCls}{/if}"
             {if $equalHeight|sliderDefault:false}data-equalheight="{$equalHeight}"{/if}
             {if $sliderMode}data-mode="{$sliderMode}"{/if}
             {if $sliderAjaxCtrlUrl}data-ajaxCtrlUrl="{$sliderAjaxCtrlUrl}"{/if}
             {if $sliderAjaxCategoryID}data-ajaxCategoryID="{$sliderAjaxCategoryID}"{/if}
             {if $sliderAjaxMaxShow}data-ajaxMaxShow="{$sliderAjaxMaxShow}"{/if}

             {* boolean slider configurations, uses sliderDefault smarty modifier with 'mobile = false' option *}
             {if !$sliderArrows|sliderDefault:false}data-arrows="false"{/if}   
             {if !$sliderInfinite|sliderDefault:false}data-infinite="false"{/if}
             {if !$sliderPauseOnHover|sliderDefault:false}data-pauseOnHover="false"{/if}
             {if !$sliderFade|sliderDefault:false}data-fade="false"{/if}
             {if $sliderDots|sliderDefault:false}data-dots="true"{/if}   
             {if $sliderAutoplay|sliderDefault:false}data-autoplay="true"{/if}
             {if $sliderVertical|sliderDefault:false}data-vertical="true"{/if}
             {if $sliderAdaptiveHeight|sliderDefault:false}data-adaptiveHeight="true"{/if}
             {if $sliderCenterMode|sliderDefault:false}data-centerMode="true"{/if}
             {if $sliderSwipeToSlide|sliderDefault:false}data-swipeToSlide="true"{/if}
             {if $sliderVariableWidth|sliderDefault:false}data-variableWidth="true"{/if}

             {* other slider configurations *}
             {if $sliderAnimationSpeed}data-speed="{$sliderAnimationSpeed}"{/if}
             {if $sliderAutoplaySpeed}data-autoplayspeed="{$sliderAutoplaySpeed}"{/if}
             {if $sliderCenterPadding}data-centerPadding="{$sliderCenterPadding}"{/if}

             data-slidesToShow="{if $sliderSlidesToShow}{$sliderSlidesToShow}{else}4{/if}"
             data-slidesToScroll="{if $sliderSlidesToScroll}{$sliderSlidesToScroll}{else}4{/if}"
             
             data-md='{ldelim}
                "arrows": "{$sliderMDArrows}",
                "dots": "{$sliderMDDots}",
                "slidesToShow": "{$sliderMDSlidesToShow}",
                "slidesToScroll": "{$sliderMDSlidesToScroll}",
                "vertical": "{$sliderMDVertical}",
                "adaptiveHeight": "{$sliderMDAdaptiveHeight}",
                "centerMode": "{$sliderMDCenterMode}",
                "centerPadding": "{$sliderMDCenterPadding}",
                "speed": "{$sliderMDAnimationSpeed}",
                "autoplay": "{$sliderMDAutoplay}",
                "infinite": "{$sliderMDInfinite}",
                "swipeToSlide": "{$sliderMDSwipeToSlide}",
                "variableWidth": "{$sliderMDVariableWidth}"
             {rdelim}'
             data-hd='{ldelim}
                "arrows": "{$sliderHDArrows}",
                "dots": "{$sliderHDDots}",
                "slidesToShow": "{$sliderHDSlidesToShow}",
                "slidesToScroll": "{$sliderHDSlidesToScroll}",
                "vertical": "{$sliderHDVertical}",
                "adaptiveHeight": "{$sliderHDAdaptiveHeight}",
                "centerMode": "{$sliderHDCenterMode}",
                "centerPadding": "{$sliderHDCenterPadding}",
                "speed": "{$sliderHDAnimationSpeed}",
                "autoplay": "{$sliderHDAutoplay}",
                "infinite": "{$sliderHDInfinite}",
                "swipeToSlide": "{$sliderHDSwipeToSlide}",
                "variableWidth": "{$sliderHDVariableWidth}"
             {rdelim}'
             data-sm='{ldelim}
                "arrows": "{$sliderSMArrows}",
                "dots": "{$sliderSMDots}",
                "slidesToShow": "{$sliderSMSlidesToShow}",
                "slidesToScroll": "{$sliderSMSlidesToScroll}",
                "vertical": "{$sliderSMVertical}",
                "adaptiveHeight": "{$sliderSMAdaptiveHeight}",
                "centerMode": "{$sliderSMCenterMode}",
                "centerPadding": "{$sliderSMCenterPadding}",
                "speed": "{$sliderSMAnimationSpeed}",
                "autoplay": "{$sliderSMAutoplay}",
                "infinite": "{$sliderSMInfinite}",
                "swipeToSlide": "{$sliderSMSwipeToSlide}",
                "variableWidth": "{$sliderSMVariableWidth}"
             {rdelim}'
             data-xs='{ldelim}
                "arrows": "{$sliderXSArrows}",
                "dots": "{$sliderXSDots}",
                "slidesToShow": "{$sliderXSSlidesToShow}",
                "slidesToScroll": "{$sliderXSSlidesToScroll}",
                "vertical": "{$sliderXSVertical}",
                "adaptiveHeight": "{$sliderXSAdaptiveHeight}",
                "centerMode": "{$sliderXSCenterMode}",
                "centerPadding": "{$sliderXSCenterPadding}",
                "speed": "{$sliderXSAnimationSpeed}",
                "autoplay": "{$sliderXSAutoplay}",
                "infinite": "{$sliderXSInfinite}",
                "swipeToSlide": "{$sliderXSSwipeToSlide}",
                "variableWidth": "{$sliderXSVariableWidth}"
             {rdelim}'>
            {include file="frontend/_includes/product_slider_items.tpl" articles=$articles}
        </div>
    {/block}
{/block}