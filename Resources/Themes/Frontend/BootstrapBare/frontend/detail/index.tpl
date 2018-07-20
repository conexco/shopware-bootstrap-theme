{extends file='frontend/index/index.tpl'}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* Custom header *}
{block name='frontend_index_header'}
    {include file="frontend/detail/header.tpl"}
{/block}

{* Modify the breadcrumb *}
{block name='frontend_index_breadcrumb_prefix'}
    {block name="frontend_detail_breadcrumb_overview"}
        {if !{config name=disableArticleNavigation}}
            {$breadCrumbBackLink = $sBreadcrumb[count($sBreadcrumb) - 1]['link']}

            <li class="breadcrumb-item" 
			    itemprop="itemListElement" 
			    itemscope 
			    itemtype="http://schema.org/ListItem">
			    {block name="frontend_detail_breadcrumb_overview"}
		            <a class="breadcrumb-link" 
					   href="{if $breadCrumbBackLink}{$breadCrumbBackLink}{else}{$breadcrumb.link}{/if}" 
					   title="{$breadcrumb.name}" itemprop="item">
					    <span class="breadcrumb-title" itemprop="name">
					    	{s name='DetailNavIndex' namespace="frontend/detail/navigation"}{/s}
					    </span>
					    <meta itemprop="position" content="{$breadcrumb@index}" />
					</a>
			    {/block}
			</li>
        {/if}
    {/block}

    {$smarty.block.parent}
{/block}

{* Article navigation *}
{block name="frontend_detail_index_navigation"}
	{$smarty.block.parent}

	{* TODO: better solution needed *}
	{if !{config name=disableArticleNavigation}}
	    {include file="frontend/detail/navigation.tpl"}
	{/if}
{/block}

{*! Sidebar left *}
{block name='frontend_index_content_left'}{/block}

{*! Main content *}
{block name='frontend_index_content'}
    {include file="frontend/detail/content.tpl"}
{/block}