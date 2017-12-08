{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article_item_start"}
    <div class="col-lg-12 col-md-6 col-sm-6 col-12 product-box box-{$productBoxLayout}">
{/block}

{block name='frontend_listing_box_article_content'}
    <div class="row">
        {* Product image + badge *}
        <div class="col-lg-4">
            {block name='frontend_listing_box_article_picture'}
                {include file="frontend/listing/product-box/product-image.tpl"}
            {/block}
        </div>
        {* Article name *}
        <div class="col-lg-8">
            {block name='frontend_listing_box_similar_title'}
                <div class="title-wrapper mts" data-equal="title">
                    <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName}">
                        {block name='frontend_listing_box_similar_name'}
                            {$sArticle.articleName|truncate:47}
                        {/block}
                    </a>
                </div>
            {/block}
            {* Price *}
            {block name='frontend_listing_box_similar_price'}
                <div class="pseudo-wrapper" data-equal="pseudo">
                    {if $sArticle.pseudoprice}
                        <span class="price price-small price-pseudo">{s name="reducedPrice" namespace="frontend/listing/box_article"}{/s} {$sArticle.pseudoprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</span>
                    {/if}
                </div>
                <div class="price-wrapper text-right" data-equal="price">
                <span class="price{if !$sArticle.pseudoprice} price-default{else} price-discount{/if}">
                    {if $article.priceStartingFrom && !$article.liveshoppingData}
                        {s name='ListingBoxArticleStartsAt'}ab{/s}
                    {/if}
                    {$sArticle.price|currency}{s name="Star" namespace="frontend/listing/box_article"}{/s}
                </span>
                </div>
            {/block}
            {* Unit price *}
            {block name='frontend_listing_box_similar_unit'}
                {include file="frontend/listing/product-box/product-price-unit.tpl"}
            {/block}
        </div>
    </div>
{/block}

{block name="frontend_listing_box_article_item_end"}
    </div>
{/block}






