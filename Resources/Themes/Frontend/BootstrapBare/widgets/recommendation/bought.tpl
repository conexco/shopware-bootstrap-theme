{if $boughtArticles}
    {block name="frontend_detail_index_also_bought_slider"}
        <div id="BoughtArticlesWrapper" class="product-streams-slider-wrapper">
            {block name="frontend_detail_index_also_bought_slider_title"}
                <div class="page-header">
                    <h3>{s name="DetailBoughtArticlesSlider" namespace="frontend/plugins/recommendation/blocks_detail"}Kunden kauften auch:{/s}</h3>
                </div>
            {/block}
            {block name="frontend_detail_index_also_bought_slider_container"}
            
                {include file="frontend/_includes/product_slider.tpl" 
                        articles=$boughtArticles 
                        equalHeight="true"

                        sliderInfinite="1"
                        sliderAnimationSpeed="300"
                        sliderAutoplay="1"
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

                        productSliderCls="bought-articles-slider"}
            {/block}
        </div>
    {/block}
{/if}
