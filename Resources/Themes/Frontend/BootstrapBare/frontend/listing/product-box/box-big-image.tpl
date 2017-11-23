{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name='frontend_listing_box_article_description'}{/block}

{block name='frontend_listing_box_article_picture'}
    <a href="{$sArticle.linkDetails}"
       title="{$sArticle.articleName|escape}"
       class="product-image">
        {block name='frontend_listing_box_article_image_element'}
            <div class="image-wrapper" data-equal="image">
                {block name='frontend_listing_box_article_image_media'}
                    
                    {$desc = $sArticle.articleName|escape}

                    {if $theme['listing-lazy-images'] && 
                            ($boxIndex >= $theme['listing-lazy-images-preload'] || 
                                ($theme['infinite-scrolling'] && !isset($boxIndex)))}
                        {$lazy = true}
                    {/if}
                    
                    {if isset($sArticle.image.thumbnails)}
                        {if $sArticle.image.description}
                            {$desc = $sArticle.image.description|escape}
                        {/if}
                        {block name='frontend_listing_box_article_image_picture_element'}
                            <img alt="{$desc}"
                                 title="{$desc|truncate:160:''}"
                                 {if $lazy}
                                 data-srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                                 src="{link file='frontend/_public/src/img/lazy-img.gif'}"
                                 {else}
                                 srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                                 {/if}
                                 class="{if $lazy}js-lazy-image {/if}img-responsive img-center" />      
                        {/block}
                    {else}
                        <img alt="{$desc}"
                             title="{$desc|truncate:160:""}"
                             {if $lazy}
                             data-src="{link file='frontend/_public/src/img/no-picture.png'}"
                             src="{link file='frontend/_public/src/img/lazy-img.gif'}"
                             {else}
                             src="{link file='frontend/_public/src/img/no-picture.png'}"
                             {/if}
                             class="{if $lazy}js-lazy-image {/if}img-responsive img-center" />
                    {/if}
                {/block}
            </div>
        {/block}
    </a>
{/block}