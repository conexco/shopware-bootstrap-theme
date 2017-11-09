{block name='frontend_listing_box_article_image'}
    <a href="{$sArticle.linkDetails}"
       title="{$sArticle.articleName|escape}"
       class="product-image">
        {block name='frontend_listing_box_article_image_element'}
            <div class="image-wrapper" data-equal="image">
                {block name='frontend_listing_box_article_image_media'}

                    {$desc = $sArticle.articleName|escape}

                    {if isset($sArticle.image.thumbnails)}
                        {if $sArticle.image.description}
                            {$desc = $sArticle.image.description|escape}
                        {/if}
                        {block name='frontend_listing_box_article_image_picture_element'}
                            <img alt="{$desc}"
                                 title="{$desc|truncate:160:''}"
                                 {if $boxIndex >= 6}
                                 data-srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                                 src="{link file='frontend/_public/src/img/lazy-img-loading.gif'}"
                                 {else}
                                 srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                                 {/if}
                                 class="{if $boxIndex >= 6}js-lazy-image {/if}img-responsive img-center" />                        
                        {/block}
                    {else}
                        <img alt="{$desc}"
                             title="{$desc|truncate:160:""}"
                             {if $boxIndex >= 6}
                             data-src="{link file='frontend/_public/src/img/no-picture.png'}"
                             src="{link file='frontend/_public/src/img/lazy-img-loading.gif'}"
                             {else}
                             src="{link file='frontend/_public/src/img/no-picture.png'}"
                             {/if}
                             class="{if $boxIndex >= 6}js-lazy-image {/if}img-responsive img-center" />
                    {/if}
                {/block}
            </div>
        {/block}
    </a>
{/block}
