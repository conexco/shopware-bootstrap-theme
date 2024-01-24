{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$sBreadcrumb = [['name'=>{$sSupport.name}, 'link'=>{url controller=ticket sFid=$sSupport.id}]]}
    {$smarty.block.parent}
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

    {* Form error *}
    {block name='frontend_forms_elements_error'}
        {if $sSupport.sErrors.e || $sSupport.sErrors.v}
            {$errorContent=""}
            <div class="error">
                {if $sSupport.sErrors.v}
                    {foreach from=$sSupport.sErrors.v key=sKey item=sError}
                        {if $sKey !=0&&$sSupport.sElements.$sError.error_msg}{$errorContent="{$errorContent}<br />"}{/if}
                        {$errorContent="{$errorContent}{$sSupport.sElements.$sError.error_msg}"}
                    {/foreach}
                    {if $sSupport.sErrors.e}
                        {$errorContent="{$errorContent}<br />"}
                    {/if}
                {/if}

                {if $sSupport.sErrors.e}
                    {if $sSupport.sErrors.e['sCaptcha'] == true}
                        {$errorContent="{$errorContent}{s name='SupportInfoFillCaptcha' namespace="frontend/forms/elements"}{/s}"}
                    {else}
                        {$errorContent="{$errorContent}{s name='SupportInfoFillRedFields' namespace="frontend/forms/elements"}{/s}"}
                    {/if}
                {/if}

                {block name='frontend_forms_elements_error_messages'}
                    {include file="frontend/_includes/messages.tpl" type='error' content=$errorContent}
                {/block}
            </div>
        {/if}
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