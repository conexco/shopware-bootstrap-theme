{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article_item_start"}
<div class="phm product-box box-{$productBoxLayout}" data-ordernumber="{$sArticle.ordernumber}">
    <div class="card card-body">
{/block}

{block name='frontend_listing_box_article_content'}
    {block name="frontend_listing_box_article_product_name"}
        {$productName = $sArticle.articleName}
        {if $sArticle.additionaltext}
            {$productName = $productName|cat:' '|cat:$sArticle.additionaltext}
        {/if}
    {/block}
    
    {*Product image + badge *}
    {block name='frontend_listing_box_article_picture'}
        {block name='frontend_listing_box_article_image'}
            <a href="{$sArticle.linkDetails}"
               title="{$productName|escape}"
               class="product-image">
                {block name='frontend_listing_box_article_image_element'}
                    <div class="image-wrapper">
                        {if !$imageOnly}
                            {* Product box badges - highlight, newcomer, ESD product and discount *}
                            {block name='frontend_listing_box_article_badges'}
                                {include file="frontend/listing/product-box/product-badges.tpl"}
                            {/block}
                        {/if}
                        {block name='frontend_listing_box_article_image_media'}
                            {block name='frontend_listing_box_article_image_picture'}

                                {$desc = $productName|escape}

                                {if $sArticle.image.description}
                                    {$desc = $sArticle.image.description|escape}
                                {/if}

                                {if $sArticle.image.thumbnails}

                                    {if $element.viewports && !$fixedImageSize}
                                        {foreach $element.viewports as $viewport}
                                            {$cols = ($viewport.endCol - $viewport.startCol) + 1}
                                            {$elementSize = $cols * $cellWidth}
                                            {$size = "{$elementSize}vw"}

                                            {if $breakpoints[$viewport.alias]}

                                                {if $viewport.alias === 'xl' && !$emotionFullscreen}
                                                    {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                                                    {$size = "(min-width: {$baseWidth}px) {$size}"}
                                                {else}
                                                    {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
                                                {/if}
                                            {/if}

                                            {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
                                        {/foreach}
                                    {else}
                                        {$itemSize = "200px"}
                                    {/if}

                                    {$srcSet = ''}
                                    {$srcSetRetina = ''}

                                    {foreach $sArticle.image.thumbnails as $image}
                                        {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

                                        {if $image.retinaSource}
                                            {$srcSetRetina = "{if $srcSetRetina}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth * 2}w"}
                                        {/if}
                                    {/foreach}

                                    <picture>
                                        <source sizes="{$itemSize}" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)" />
                                        <source sizes="{$itemSize}" srcset="{$srcSet}" />

                                        <img src="{$sArticle.image.thumbnails[0].source}" alt="{$desc|strip_tags|truncate:160}" />
                                    </picture>

                                {elseif $sArticle.image.source}
                                    <img src="{$sArticle.image.source}" alt="{$desc|strip_tags|truncate:160}" />
                                {else}
                                    <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc|strip_tags|truncate:160}" />
                                {/if}
                            {/block}
                        {/block}
                    </div>
                {/block}
            </a>
        {/block}
    {/block}

    {if !$imageOnly}
        <div class="product-details">
            {* Article name *}
            {block name='frontend_listing_box_article_name'}
                <div class="title-wrapper">
                    {block name='frontend_listing_box_article_name_inner'}
                        <a href="{$sArticle.linkDetails}" title="{$productName|escapeHtml}">{$productName|escapeHtml}</a>
                    {/block}
                </div>
            {/block}

            {* Description *}
            {block name='frontend_listing_box_article_description'}{/block}

            {block name='frontend_listing_box_article_price_info'}
                {* Product price - Default and discount price *}
                {block name='frontend_listing_box_article_price'}
                    {include file="frontend/listing/product-box/product-price.tpl"}
                {/block}

                {* Product price - Unit price *}
                {block name='frontend_listing_box_article_unit'}
                    {include file="frontend/listing/product-box/product-price-unit.tpl"}
                {/block}
            {/block}

            {* Product actions - Compare product, more information, buy now *}
            {block name='frontend_listing_box_article_actions'}{/block}
        </div>    
    {/if}
{/block}

{block name="frontend_listing_box_article_item_end"}
    </div>
</div>
{/block}