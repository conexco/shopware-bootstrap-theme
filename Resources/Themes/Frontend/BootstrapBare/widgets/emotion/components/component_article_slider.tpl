{* Slider panel *}
{block name="widget_emotion_component_product_slider"}
    <div id="EkwArticleWrapper_{$Data.objectId}" class="emotion-product-slider{if $Data.no_border} is-no-border{/if}">
        {* Title *}
        {block name="widget_emotion_component_product_slider_title"}
            {if $Data.article_slider_title}               
                <div class="product-slider-title">
                    {$Data.article_slider_title}
                </div>
            {/if}
        {/block}

        {* Slider content based on the configuration *}
        {block name="widget_emotion_component_product_slider_content"}
            {$sliderMode = 'ajax'}
            {if $Data.article_slider_type == 'selected_article' || $Data.values|@count}
                {$articles = $Data.values}
                {$sliderMode = ''}
            {/if}

            {$sliderAjaxUrl = {url module=widgets controller=emotion action=emotionArticleSlider sort=$Data.article_slider_type}}
            {if $Data.article_slider_type === 'product_stream'}
                {$sliderAjaxUrl = {url module=widgets controller=emotion action=productStreamArticleSlider streamId=$Data.article_slider_stream}}
            {/if}

            {include file="frontend/_includes/product_slider.tpl"
                articles=$articles
                productSliderCls="product-slider-content"
                sliderMode=$sliderMode
                sliderAjaxCtrlUrl="{$sliderAjaxUrl}"
                sliderAjaxCategoryID="{$Data.article_slider_category}"
                sliderAjaxMaxShow="{$Data.article_slider_max_number}"
                
                sliderInfinite="1"
                sliderAnimationSpeed="{$Data.article_slider_scrollspeed}"
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

                productBoxLayout="emotion"
                fixedImageSize="true"}
        {/block}
    </div>
{/block}

