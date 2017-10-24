{namespace name="frontend/plugins/bonus_system/index"}

<tr>
	{* Change date *}
	{block name="frontend_bonussystem_changes_item_date"}
		<td>

			{block name="frontend_bonussystem_changes_item_date_label"}
			{/block}

			{block name="frontend_bonussystem_changes_item_date_value"}
                {$change.time|date:"DATE_MEDIUM"}
			{/block}
		</td>
	{/block}

	{* Change time *}
	{block name="frontend_bonussystem_changes_item_time"}
		<td>

			{block name="frontend_bonussystem_changes_item_time_label"}
			{/block}

			{block name="frontend_bonussystem_changes_item_time_value"}
                {$change.time|date:"TIME_SHORT"}
			{/block}
		</td>
	{/block}

	{* Change type *}
	{block name="frontend_bonussystem_changes_item_type"}
		<td>

			{block name="frontend_bonussystem_changes_item_type_label"}
			{/block}

			{block name="frontend_bonussystem_changes_item_type_value"}
                {if $change.type == "spend"}
                    {s name="reason_spend"}{/s}
                {elseif $change.type == "earn"}
                    {s name="reason_earn"}{/s}
                {else}
                    {s name="reason_admin"}{/s}
                {/if}
			{/block}
		</td>
	{/block}

	{* Change reason *}
	{block name="frontend_bonussystem_changes_item_reason"}
		<td>

			{block name="frontend_bonussystem_changes_item_reason_label"}
			{/block}

			{block name="frontend_bonussystem_changes_item_reason_value"}
                {if $change.type == "spend" || $change.type == "earn"}
                    {assign var="anchor" value="order{$change.context}"}
                    {s name=order}{/s} <a href="{url controller="account" action="orders" forceSecure}#{$anchor}" class="bold">#{$change.context}</a>
                {else}
                    {$change.context}
                {/if}
			{/block}
		</td>
	{/block}

	{* Change amount *}
	{block name="frontend_bonussystem_changes_item_amount"}
		<td>

			{block name="frontend_bonussystem_changes_item_amount_label"}
			{/block}

			{block name="frontend_bonussystem_changes_item_amount_value"}
                {if $change.difference < 0}
                    {$change.difference}
                {else}
                    <span>+</span>
                    {$change.difference}
                {/if}
			{/block}
		</td>
	{/block}
</tr>