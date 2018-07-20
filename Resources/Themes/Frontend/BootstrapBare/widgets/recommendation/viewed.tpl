{if $viewedArticles}
    {block name="frontend_detail_index_similar_viewed_slider"}
        <div id="ViewedArticlesWrapper" class="articles-reco-slider-wrapper">
            {block name="frontend_detail_index_similar_viewed_slider_title"}
                <h3 class="h4">
                    {s name="DetailViewedArticlesSlider" namespace="frontend/plugins/recommendation/blocks_detail"}Kunden haben sich ebenfalls angesehen:{/s}
                </h3>
            {/block}
            
            {block name="frontend_detail_index_similar_viewed_slider_container"}
                {include file="frontend/_includes/product_slider.tpl" 
                        articles=$viewedArticles 
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

                        productSliderCls="viewed-articles-slider"}
            {/block}
        </div>
    {/block}
{/if}