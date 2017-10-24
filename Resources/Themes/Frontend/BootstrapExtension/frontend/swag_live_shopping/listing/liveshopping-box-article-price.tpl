{* Unit price *}
{block name='frontend_listing_box_article_unit'}
    {include file="frontend/listing/product-box/product-price-unit.tpl"}
{/block}

{* Liveshopping price *}
{block name='frontend_listing_box_article_price'}
    {if $sArticle.liveShopping}
        {include file='frontend/swag_live_shopping/listing/liveshopping-listing-pricing.tpl'}
    {else}
        {include file="frontend/listing/product-box/product-price.tpl"}
    {/if}
{/block}