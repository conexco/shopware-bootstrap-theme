{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb = []}
    {if $sCustomPage.parent}
        {$sBreadcrumb[] = [
        'name' => {$sCustomPage.parent.page_title|default:$sCustomPage.parent.description},
        'link'=>{url sCustom=$sCustomPage.parent.id}
        ]}
    {/if}
    {$sBreadcrumb[] = [
    'name' => {$sCustomPage.page_title|default:$sCustomPage.description},
    'link'=>{url sCustom=$sCustomPage.id}
    ]}
{/block}

{block name='frontend_index_header'}
    {include file='frontend/custom/header.tpl'}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {if $sCustomPage.subPages}
        {$pages = $sCustomPage.subPages}
    {elseif $sCustomPage.siblingPages}
        {$pages = $sCustomPage.siblingPages}
    {/if}
    {if $pages}
        <ul class="nav nav-tabs">
            {foreach $pages as $subPage}
                <li{if $subPage.active} class="active"{/if}>
                    <a href="{if $subPage.link}{$subPage.link}{else}{url controller='custom' sCustom=$subPage.id title=$subPage.description}{/if}"
                    title="{$subPage.description}"
                    data-categoryId="{$subPage.id}"
                    data-fetchUrl="{url module=widgets controller=listing action=getCustomPage pageId={$subPage.id}}"
                    {if $subPage.target}target="{$subPage.target}"{/if}>{$subPage.description}</a>
                </li>
            {/foreach}
        </ul>
    {/if}
    {* Custom page tab headline *}
    {block name="frontend_custom_article_headline"}
        <h1>{$sCustomPage.description}</h1>
    {/block}
    {* Article content *}
    {block name='frontend_custom_article_content'}
        {$sContent}
    {/block}
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}
    {include file='frontend/index/sidebar.tpl'}
{/block}
