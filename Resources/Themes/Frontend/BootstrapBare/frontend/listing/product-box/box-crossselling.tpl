{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_blog"}

{block name="frontend_listing_box_article_item_start"}
    <div class="card card-body mam product-box box-{$productBoxLayout}">
{/block}

{block name='frontend_listing_box_article_badges'}{/block}

{block name='frontend_listing_box_article_name_inner'}
    <a title="{$article.articleName|escape}" href="{$article.linkDetails}">{$article.articleName|escape}</a>
{/block}

{block name="frontend_listing_box_article_description"}{/block}

{block name='frontend_listing_box_article_price_info'}
    <div class="price-wrapper text-right" data-equal="price">
        <p>{$article.price|currency}{s name="Star"}*{/s}</p>
    </div>
{/block}

{block name="frontend_listing_box_article_actions"}{/block}

{block name="frontend_listing_box_article_item_end"}
    </div>
{/block}