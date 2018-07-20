{* Product-Streams slider *}
{block name='frontend_detail_index_streams_slider'}
    <div id="productStreamWrapper{$index}" class="product-streams-slider-wrapper">
        {block name='frontend_detail_index_streams_slider_container'}
            {include file="frontend/_includes/product_slider.tpl"
                    equalHeight="true"
                    sliderMode="ajax"
                    sliderAjaxCtrlUrl="{url module=widgets controller=emotion action=productStreamArticleSlider streamId=$relatedProductStream.id productBoxLayout="slider"}"
                    sliderAjaxMaxShow="40"

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

                    productSliderCls="product-stream-slider"}
        {/block}
    </div>
{/block}