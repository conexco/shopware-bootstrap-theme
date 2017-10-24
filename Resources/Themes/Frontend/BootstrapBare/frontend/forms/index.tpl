{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' prepend}
    {$sBreadcrumb = [['name'=>{$sSupport.name}, 'link'=>{url controller=ticket sFid=$sSupport.id}]]}
{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}
    {include file='frontend/index/sidebar.tpl'}
{/block}

{block name="frontend_index_header"}
    {include file="frontend/forms/header.tpl"}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Forms headline *}
    {block name='frontend_forms_index_headline'}
        <div class="h1">{$sSupport.name}</div>
    {/block}

    {* Forms Content *}
    {block name='frontend_forms_index_content'}
        {if $sSupport.sElements}
            {$sSupport.text}

            {block name='frontend_forms_index_elements'}
                {include file="frontend/forms/form-elements.tpl"}
            {/block}

        {elseif $sSupport.text2}
            {include file="frontend/_includes/messages.tpl" type="success" content=$sSupport.text2}
        {/if}
    {/block}
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}

