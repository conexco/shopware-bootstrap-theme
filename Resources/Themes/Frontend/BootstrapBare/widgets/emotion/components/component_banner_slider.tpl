{block name="frontend_widgets_banner_slider"}
    <div class="emotion-banner-slider">
        {block name="frontend_widgets_banner_slider_title"}
            {if $Data.banner_slider_title}
                <div class="banner-slider-title">{$Data.banner_slider_title}</div>
            {/if}
        {/block}
        {block name="frontend_widgets_banner_slider_container"}
            <div id="banner_slider_{$Data.objectId}" class="slick"
                data-infinite="1"
                data-speed="{$Data.banner_slider_scrollspeed}"
                data-autoplay="1"
                data-pauseOnHover="1"
                data-dots="1"
                data-arrows="1"
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
                {block name="frontend_widgets_banner_slider_slide"}    
                    {foreach $Data.values as $banner}
                        {block name="frontend_widgets_banner_slider_item"}
                            <div class="banner-slider-item"
                                 data-coverImage="true"
                                 data-containerselector=".banner-slider-banner"
                                 data-width="{$banner.fileInfo.width}"
                                 data-height="{$banner.fileInfo.height}">

                                 {block name="frontend_widgets_banner_slider_banner"}
                                    <div class="banner-slider-banner">

                                        {block name="frontend_widgets_banner_slider_banner_picture"}
                                            {if $banner.thumbnails}
                                                {$baseSource = $banner.thumbnails[0].source}
                                                {$srcSet = ''}
                                                {$itemSize = ''}

                                                {foreach $element.viewports as $viewport}
                                                    {$cols = ($viewport.endCol - $viewport.startCol) + 1}
                                                    {$elementSize = $cols * $cellWidth}
                                                    {$size = "{$elementSize}vw"}

                                                    {if $breakpoints[$viewport.alias]}

                                                        {if $viewport.alias === 'xl' && !$emotionFullscreen}
                                                            {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                                                        {/if}

                                                        {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
                                                    {/if}

                                                    {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
                                                {/foreach}

                                                {foreach $banner.thumbnails as $image}
                                                    {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

                                                    {if $image.retinaSource}
                                                        {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.retinaSource} {$image.maxWidth * 2}w"}
                                                    {/if}
                                                {/foreach}
                                            {else}
                                                {$baseSource = $banner.source}
                                            {/if}

                                            <img src="{$baseSource}"
                                                 class="banner-slider-image"
                                                 {if $srcSet}sizes="{$itemSize}" srcset="{$srcSet}"{/if}
                                                 {if $banner.altText}alt="{$banner.altText|escape}" {/if}/>
                                        {/block}
                                    </div>
                                {/block}

                                {if $banner.link}
                                    {block name="frontend_widgets_banner_slider_link"}
                                        <a class="banner-slider-link" href="{$banner.link}" title="{$banner.title|escape}">
                                            {$banner.altText}
                                        </a>
                                    {/block}
                                {/if}
                            </div>
                        {/block}
                    {/foreach}
                {/block}    
            </div>
        {/block}
    </div>
{/block}
