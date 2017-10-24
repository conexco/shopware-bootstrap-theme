{extends file='parent:frontend/listing/product-box/box-basic.tpl'}

{* overwrites only LiveShopping plugin block *}
{block name='frontend_listing_liveshopping_box_article_discount'}{/block}

{* includes only if LiveShopping plugin is active *}
{block name='frontend_listing_box_article_pseudo' prepend}
	{if $sArticle.liveShopping}
		{include file='frontend/swag_live_shopping/listing/liveshopping-listing-badge.tpl' liveShopping=$sArticle.liveShopping}
	{/if}	
{/block}

{block name="frontend_listing_box_article_actions"}
    {if !$minimalView}
        {$smarty.block.parent}
    {/if}
{/block}