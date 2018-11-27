{block name="widgets_listing_top_seller"}
    {if $sCharts|@count}
        {block name="frontend_widgets_topseller_slider"}
            <div id="TopsellerWrapper" class="topseller-slider-wrapper">
                {block name="frontend_widgets_topseller_slider_title"}
                    <div class="page-header">
                        <h3>{s name="TopsellerHeading" namespace='frontend/plugins/index/topseller'}{/s}</h3>
                    </div>
                {/block}
                {block name="frontend_widgets_topseller_slider_container"}

                    {$lazyLoadingUrl = {url controller="epoq" action="template" type="widget" layout="slides" id="724016-00,732310-00,732311-00,723002-00"}}

                    {include file="frontend/_includes/product_slider.tpl"
                            articles=$sCharts
                            lazyLoadingUrl=$lazyLoadingUrl
                            equalHeight="true"

                            sliderInfinite="1"
                            sliderAnimationSpeed="300"
                            sliderAutoplay="0"
                            sliderPauseOnHover="1"

                            sliderArrows="1"
                            sliderDots="0"
                            sliderSlidesToShow="4"
                            sliderSlidesToScroll="4"

                            sliderMDArrows="1"
                            sliderMDDots="0"
                            sliderMDSlidesToShow="3"
                            sliderMDSlidesToScroll="3"

                            sliderHDArrows="1"
                            sliderHDDots="0"
                            sliderHDSlidesToShow="3"
                            sliderHDSlidesToScroll="3"

                            sliderSMArrows="1"
                            sliderSMDots="0"
                            sliderSMSlidesToShow="2"
                            sliderSMSlidesToScroll="2"

                            sliderXSArrows="1"
                            sliderXSDots="0"
                            sliderXSSlidesToShow="1"
                            sliderXSSlidesToScroll="1"

                            productSliderCls="topseller-slider"}
                {/block}
            </div>
        {/block}
    {/if}
{/block}