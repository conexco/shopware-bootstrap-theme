{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article_rating"}{/block}

{block name="frontend_listing_box_article_description"}{/block}

{block name="frontend_listing_box_article_actions"}{/block}

{block name='frontend_listing_box_article_badges'}{/block}

{block name="frontend_listing_box_article_buy"}{/block}

{block name="frontend_listing_box_article_item_start"}
    {* TODO: equal height slider items *}
    <div class="product-box box-{$productBoxLayout} px-1">
        <div class="card card-body">
{/block}

{block name='frontend_listing_box_article_price_info'}
    <div class="product-price-info">
        {block name='frontend_listing_box_article_price'}
            {include file="frontend/listing/product-box/product-price.tpl"}
        {/block}

        {block name='frontend_listing_box_article_unit'}
            {include file="frontend/listing/product-box/product-price-unit.tpl"}
        {/block}
    </div>
{/block}

{block name="frontend_listing_box_article_item_end"}
        </div>
    </div>
{/block}
