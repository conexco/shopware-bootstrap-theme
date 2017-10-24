{if $sBonusSystem.settings.bonus_system_active==1}
    {* Welcome text *}
    {block name="frontend_bonussystem_welcome"}
        {block name="frontend_bonussystem_welcome_headline"}
            <h2>{s namespace="frontend/plugins/bonus_system/index" name="MyBonusPointAccount"}{/s}</h2>
        {/block}
    {/block}

    {if !$bonusOrders}
        {block name="frontend_bonussystem_orders_info_empty"}
            <div class="alert alert-info">
                {s namespace="frontend/plugins/bonus_system/index" name="BonusInfoEmpty"}{/s}
            </div>
        {/block}
    {else}
        {include file="frontend/bonus_system/points_orders.tpl"}
    {/if}

    {if $changes}
        {include file="frontend/bonus_system/points_changes.tpl"}
    {/if}
{else}
	{block name="frontend_account_orders_info_empty"}
		<fieldset>
            <div class="alert alert-info">
				{s namespace="frontend/plugins/bonus_system/index" name="BonusSystemInactive"}{/s}
			</div>
		</fieldset>
	{/block}
{/if}

