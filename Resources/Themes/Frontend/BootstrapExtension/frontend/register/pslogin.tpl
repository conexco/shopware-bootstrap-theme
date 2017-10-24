{extends file='parent:frontend/register/index.tpl'}

{* Title *}
{block name='frontend_index_header_title'}
    {s name='PrivateLoginWelcomeHeader' namespace='frontend/account/login'}{/s} | {config name=shopName}
{/block}

{* Hide mobile registration link *}
{block name='frontend_register_login_newcustomer'}
    {if $showRegister}
        {$smarty.block.parent}
    {/if}
{/block}

{* Hide shop navigation *}
{block name='frontend_index_shop_navigation'}{/block}

{* Hide top bar *}
{block name='frontend_index_top_bar_container'}{/block}

{* Hide advantages *}
{block name='frontend_register_index_advantages'}{/block}

{* Hide steps *}
{block name='frontend_index_navigation_categories_top'}{/block}

{* Hide back button in header *}
{block name='frontend_index_logo_trusted_shops'}{/block}

{* Hide left content *}
{block name='frontend_index_content_left'}{/block}

{block name="frontend_index_content"}
    <h1 class="mbl">{s name='PrivateLoginWelcomeHeader' namespace='frontend/account/login'}{/s}</h1>
    {*Link for registration*}
    {block name="frontend_business_essentials_login_info"}
        <div class="business-warning-message">
            {if $showConfirmation}
                {include file="frontend/_includes/messages.tpl" type='success' content="{s name="PrivateShoppingRegisterConfirmation" namespace="frontend/account/login"}{/s}"}
            {elseif !$showRegister}
                {include file='frontend/_includes/messages.tpl' type='info' content="{s name='PrivateLoginWelcomeMessage' namespace='frontend/account/login'}{/s}"}
            {/if}
        </div>
    {/block}

    <div class="business-shopping-login{if !$showRegister} business-full-login{/if}">
        {$smarty.block.parent}
    </div>
{/block}
