{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
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

{* Sidebar left *}
{block name='frontend_index_content_left'}
    {include file='frontend/index/sidebar.tpl'}
{/block}

{block name='frontend_index_left_categories_content'}{/block}

{* Main content *}
{block name='frontend_index_content'}
    {block name="frontend_custom_article_tabs"}
        {if $sCustomPage.subPages}
            {$pages = $sCustomPage.subPages}
        {elseif $sCustomPage.siblingPages}
            {$pages = $sCustomPage.siblingPages}
        {/if}

        {if $pages}
            <ul class="nav nav-tabs mb-3">
                {foreach $pages as $subPage}
                    <li class="nav-item">
                        <a href="{url controller=custom sCustom=$subPage.id}" 
                           class="nav-link{if $subPage.active} active{/if}" 
                           title="{$subPage.description}">
                            {$subPage.description}
                        </a>
                    </li>
                {/foreach}
            </ul>
        {/if}
    {/block}

    {* Custom page tab headline *}
    {block name="frontend_custom_article_headline"}
        <h1>{$sCustomPage.description}</h1>
    {/block}

    {* Article content *}
    {block name='frontend_custom_article_content'}
        <div class="content-custom">
            {$sContent}
        </div>
    {/block}
{/block}
