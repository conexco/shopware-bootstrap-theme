{block name="widget_emotion_component_digital_publishing_slider"}
    <div class="emotion-digital-publishing-slider-wrapper">
        <div class="emotion-digital-publishing-slider slick"
             data-infinite="1"
             data-speed="{$Data.animation_speed}"
             data-autoplay="{$Data.auto_slide}"
             data-pauseOnHover="1"
             data-dots="{$Data.show_navigation}"
             data-arrows="{$Data.show_arrows}"
             data-md='{ldelim}
                "arrows": "1",
                "dots": "1"
             {rdelim}'
             data-hd='{ldelim}
                "arrows": "1",
                "dots": "1"
            {rdelim}'
             data-sm='{ldelim}
                "arrows": "1",
                "dots": "1"
            {rdelim}'
             data-xs='{ldelim}
                "arrows": "1",
                "dots": "1"
            {rdelim}'>
            {block name="widget_emotion_component_digital_publishing_slider_container"}
                {block name="widget_emotion_component_digital_publishing_slider_slide"}
                    {block name="widget_emotion_component_digital_publishing_slider_items"}
                        {foreach $Data.banners as $banner}
                            <div class="emotion-digital-publishing-slider-item">
                                {include file="widgets/swag_digital_publishing/index.tpl" banner=$banner}
                            </div>
                        {/foreach}
                    {/block}
                {/block}
            {/block}
        </div>
    </div>
{/block}