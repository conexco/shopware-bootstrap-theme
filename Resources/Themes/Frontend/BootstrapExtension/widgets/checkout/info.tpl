{extends file="parent:widgets/checkout/info.tpl"}

{block name="frontend_index_top_bar_nav"}
	{$smarty.block.parent}
	{* includes only if BonusSystem plugin is active *}
    {if $sBonusSystem}
        {block name="frontend_index_swag_bonus_system_actions_active_shop"}
            {include file="widgets/swag_bonus_system/header_points.tpl"}
        {/block}
    {/if}
{/block}
