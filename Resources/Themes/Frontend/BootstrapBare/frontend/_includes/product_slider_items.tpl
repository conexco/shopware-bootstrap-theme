{block name="frontend_common_product_slider_items"}
    {foreach $articles as $article}
        {if $sArticle@index <= 8}
            {include file="frontend/_includes/product_slider_item.tpl"}
        {else}
            {break}
        {/if}
    {/foreach}
{/block}