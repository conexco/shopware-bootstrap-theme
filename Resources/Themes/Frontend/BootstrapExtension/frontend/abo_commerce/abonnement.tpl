{namespace name="frontend/abo_commerce/orders"}

{* Order date *}
{block name="frontend_account_abonnement_item_date"}
	<td>
		{block name="frontend_account_abonnement_item_date_label"}{/block}
		{block name="frontend_account_abonnement_item_date_value"}
			{$order.order.orderTime|date:DATETIME_SHORT}
		{/block}
	</td>
{/block}

{* Order number *}
{block name="frontend_account_abonnement_item_number"}
	<td>
		{block name="frontend_account_abonnement_item_number_label"}{/block}
		{block name="frontend_account_abonnement_item_number_value"}
				{$order.lastOrder.number}
		{/block}
	</td>
{/block}

{* Delivery interval *}
{block name="frontend_account_abonnement_item_delivery_interval"}
	<td>
		{block name="frontend_account_abonnement_delivery_interval_label"}{/block}
		{block name="frontend_account_abonnement_delivery_interval_value"}
			{s name="AboCommerceOrdersEach"}jede{/s} {$order.deliveryInterval} {if $order.deliveryIntervalUnit eq 'months'}{s name="AboCommerceOrdersMonths"}Monat(e){/s}{else}{s name="AboCommerceOrdersWeeks"}Woche(n){/s}{/if}
		{/block}
	</td>
{/block}

{* Expiry date *}
{block name="frontend_account_abonnement_expiry"}
	<td>
		{block name="frontend_account_abonnement_expiry_label"}{/block}
		{block name="frontend_account_abonnement_expiry_value"}
			<strong>{$order.lastRun|date:DATE_MEDIUM}</strong>
		{/block}
	</td>
{/block}

{* Abonnement actions *}
{block name="frontend_account_abonnement_item_actions"}
	<td>
		<a class="btn btn-xs btn-secondary btn-block mbs"
		   title="{"{s name="AboCommerceOrdersShowDetailsOnly"}Details{/s}"|escape}"
		   data-toggle="collapse"
		   data-target="#order{$order.lastOrder.number}{$order.id}">
			{s name="AboCommerceOrdersShowDetailsOnly"}Details{/s}
		</a>
	</td>
{/block}
