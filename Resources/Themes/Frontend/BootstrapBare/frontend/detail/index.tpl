{extends file='frontend/index/index.tpl'}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* Custom header *}
{block name='frontend_index_header'}
    {include file="frontend/detail/header.tpl"}
{/block}

{* Breadcrumb / Article navigation *}
{block name='frontend_index_breadcrumb_inner'}
    {if !{config name=disableArticleNavigation}}
        {include file='frontend/detail/navigation.tpl'}
    {/if}
{/block}

{*! Sidebar left *}
{block name='frontend_index_content_left'}{/block}

{*! Main content *}
{block name='frontend_index_content'}
    {include file="frontend/detail/content.tpl"}
{/block}
