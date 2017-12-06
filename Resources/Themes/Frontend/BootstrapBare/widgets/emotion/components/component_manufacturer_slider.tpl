{block name="frontend_widgets_manufacturer_slider"}
    <div id="EkwManufacturerWrapper_{$Data.objectId}" class="emotion-manufacturer {if $Data.no_border} is-no-border{/if} {$sliderVisibility}">
        {block name="frontend_widgets_manufacturer_slider_title"}
            {if $Data.manufacturer_slider_title}
                <div class="manufacturer-title">
                    {$Data.manufacturer_slider_title}
                </div>
            {/if}
        {/block}
        {block name="frontend_widgets_manufacturer_slider_content"}
            <div class="manufacturer-content">
                {block name="frontend_widgets_manufacturer_slider_container"}
                    <div class="manufacturer-slider slick"
                         data-infinite="1"
                         data-speed="{$Data.manufacturer_slider_scrollspeed}"
                         data-autoplay="1"
                         data-pauseOnHover="1"
                         data-arrows="1"
                         data-slidesToShow="4"
                         data-slidesToScroll="4"
                         data-md='{ldelim}
                            "slidesToShow": "3",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "3"
                        {rdelim}'
                         data-hd='{ldelim}
                            "slidesToShow": "3",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "3"
                        {rdelim}'
                         data-sm='{ldelim}
                            "slidesToShow": "2",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "2"
                        {rdelim}'
                         data-xs='{ldelim}
                            "slidesToShow": "1",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "1"
                        {rdelim}'>
                        {foreach $Data.values as $supplier}
                            {if !$supplier.link}
                                {$supplier.link = {url module=frontend controller=listing action=manufacturer sSupplier=$supplier.id}}
                            {/if}

                            {block name="frontend_widgets_manufacturer_slider_item"}
                                <div class="manufacturer-item">
                                    {block name="frontend_widgets_manufacturer_slider_item_link"}
                                        <a href="{$supplier.link}" title="{$supplier.name}" class="manufacturer-link">
                                            {if $supplier.image}
                                                {block name="frontend_widgets_manufacturer_slider_item_image"}
                                                    <img src="{$supplier.image}" class="img-fluid img-center manufacturer-image" alt="{$supplier.name}"/> </a>
                                                {/block}
                                            {else}
                                                {block name="frontend_widgets_manufacturer_slider_item_text"}
                                                    <span class="manufacturer-name">{$supplier.name}</span>
                                                {/block}
                                            {/if}
                                        </a>
                                    {/block}
                                </div>
                            {/block}
                        {/foreach}
                    </div>
                {/block}
            </div>    
        {/block}   
    </div>
{/block}