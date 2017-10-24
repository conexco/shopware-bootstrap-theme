{block name="widget_emotion_component_sideview"}
    <div class="emotion--side-view sw5-plugin"
         data-coverImage="true"
         data-containerSelector=".side-view-banner"
         data-width="{$Data.banner_data.fileInfo.width}"
         data-height="{$Data.banner_data.fileInfo.height}"
         data-autoScroll="{if $Data.sideview_auto_start == 1}true{else}false{/if}">

        {block name="widget_emotion_component_sideview_banner"}
            <div class="side-view-banner sw5-plugin {$Data.sideview_bannerposition}">
                {if $Data.banner_data.thumbnails}
                    {$baseSource = $Data.banner_data.thumbnails[0].source}
                    {$colSize = 100 / $emotion.grid.cols}
                    {$itemSize = $itemCols * $colSize}

                    {foreach $Data.banner_data.thumbnails as $image}
                        {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

                        {if $image.retinaSource}
                            {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth}w"}
                        {/if}
                    {/foreach}
                {else}
                    {$baseSource = $Data.banner_data.source}
                {/if}

                <picture>
                    {if $srcSetRetina}
                        <source sizes="{$itemSize}vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)"/>
                    {/if}
                    {if $srcSet}
                        <source sizes="{$itemSize}vw" srcset="{$srcSet}"/>
                    {/if}
                    <img src="{$baseSource}" sizes="{$itemSize}vw" class="banner-image"/>
                </picture>
            </div>
        {/block}

        {block name="widget_emotion_component_sideview_view"}
            <div class="side-view-element sw5-plugin view-{$Data.sideview_position} view-{$Data.sideview_size}">
                {block name="widget_emotion_component_sideview_trigger"}
                    <div class="side-view-trigger sw5-plugin">
                        <i class="trigger-icon fa {if $Data.sideview_position == 'right'}fa-angle-left{else}fa-angle-up{/if}"></i>
                        <span class="trigger-label">{s name="sideViewTriggerLabel"}{/s}</span>
                    </div>
                {/block}

                {block name="widget_emotion_component_sideview_close_button"}
                    {if $Data.sideview_size == 'fullsize'}
                        <div class="side-view-closer sw5-plugin">
                            <i class="closer-icon fa fa-times"></i>
                            <span class="closer-label">{s name="sideViewCloseLabel"}Schließen{/s}</span>
                        </div>
                    {/if}
                {/block}

                {block name="widget_emotion_component_sideview_slider"}
                    {$orientation = 'horizontal'}
                    {if $Data.sideview_position == 'right'}
                        {$orientation = 'vertical'}
                    {/if}

                    <div class="sideview-slider slick sw5-plugin"
                         data-orientation="{$orientation}"
                         data-arrows="{$Data.sideview_show_arrows}"
                         data-autoplay="{$Data.sideview_auto_start}"
                         {if $orientation == 'horizontal'}
                         data-slidesToShow="6"
                         data-md='{ldelim}
                            "slidesToShow": "5"
                        {rdelim}'
                         {/if}
                         {if $orientation == 'vertical'}
                         data-slidesToShow="4"
                         data-md='{ldelim}
                            "slidesToShow": "4"
                        {rdelim}'
                         data-vertical="1"
                         {/if}
                         data-hd='{ldelim}
                            "slidesToShow": "4"
                        {rdelim}'
                         data-sm='{ldelim}
                            "slidesToShow": "2"
                        {rdelim}'
                         data-xs='{ldelim}
                            "slidesToShow": "2"
                        {rdelim}'>

                        {block name="widget_emotion_component_sideview_slider_container"}
                            {foreach $Data.product_data as $item}
                                {block name="widget_emotion_component_sideview_slider_item"}
                                    <div class="sideview-slider-item">
                                        {include file="frontend/listing/box_article.tpl" sArticle=$item productBoxLayout="emotion"}
                                    </div>
                                {/block}
                            {/foreach}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}
