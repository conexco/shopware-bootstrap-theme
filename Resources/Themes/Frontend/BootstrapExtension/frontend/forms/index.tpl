{extends file="parent:frontend/forms/index.tpl"}

{* includes only if TicketSystem plugin is active *}
{block name='frontend_index_content_left'}
    {if {ControllerName} == 'ticket' && {ControllerAction} != 'index'}
        {include file="frontend/account/sidebar.tpl"}
    {else}
    	{$smarty.block.parent}
    {/if}
{/block}