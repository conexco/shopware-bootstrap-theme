{extends file="parent:frontend/register/index.tpl"}

{block name="frontend_register_index_form"}
    {if $registerRedirectUrl}
        {block name="frontend_register_swag_business_essentials_index_form"}
            {include file="frontend/b2bessentials/register/index.tpl"}
        {/block}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}