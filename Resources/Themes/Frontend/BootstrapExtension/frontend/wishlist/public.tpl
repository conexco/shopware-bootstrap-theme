{namespace name="frontend/plugins/swag_advanced_cart/public_list"}

{extends file='frontend/index/index.tpl'}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* Breadcrumb *}
{block name='frontend_index_start'}
	{block name='frontend_index_advanced_cart_start'}
		{include file="frontend/wishlist/public/start.tpl"}
	{/block}
	{$smarty.block.parent}
{/block}

{* Empty sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Facebook connect, if one setting is enabled *}
{block name='frontend_index_before_page'}
	{$smarty.block.parent}
	{block name='frontend_index_advanced_cart_before_page'}
		{include file="frontend/wishlist/public/page.tpl"}
	{/block}
{/block}

{block name="frontend_index_content"}
	{block name="frontend_index_advanced_cart_content"}
		{include file="frontend/wishlist/public/content.tpl"}
	{/block}
{/block}