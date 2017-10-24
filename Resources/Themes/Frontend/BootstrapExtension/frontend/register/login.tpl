{extends file="parent:frontend/register/login.tpl"}

{block name="frontend_register_login_customer"}
    {if $loginUrl}
        {block name="frontend_register_swag_business_essentials_login_customer"}
            {include file="frontend/b2bessentials/register/login.tpl"}
        {/block}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}