{namespace name='frontend/abo_commerce/orders'}

{block name="frontend_account_abonnements_overview_message"}
    {if $showMessage}
        {if $status eq "1"}
            {include file="frontend/_includes/messages.tpl" type="success" content="{s name="ShippingAddressChanged" namespace="frontend/abo_commerce/index"}The shipping address has been changed successfully.{/s}"}
        {else}
            {include file="frontend/_includes/messages.tpl" type="error" content="{s name="ShippingAddressChangedFailed" namespace="frontend/abo_commerce/index"}No address was changed.{/s}"}
        {/if}
    {/if}
{/block}

{* Welcome text *}
{block name="frontend_account_orders_welcome"}
	{block name="frontend_account_orders_welcome_headline"}
		<h1>{s name='AboCommerceOrdersHeadline'}Meine Abonnements{/s}</h1>
	{/block}
{/block}

{if !$orders}
	{block name="frontend_account_orders_info_empty"}
		<div class="alert alert-info">{s name="AboCommerceOrdersNoSubscrption"}Sie haben noch kein Abonnement abgeschlossen.{/s}</div>
	{/block}
{else}
	{* Orders overview *}
	{block name="frontend_account_abonnements_overview"}
		<table class="table table-responsive">

			{block name="frontend_account_abonnements_table"}
				<thead>
					{block name="frontend_account_abonnements_table_head"}
						<tr>
							{block name="frontend_account_abonnements_table_head_date"}
								<th>{s name="AboCommerceOrdersCreated"}Erstellt am{/s}</th>
							{/block}

							{block name="frontend_account_abonnements_table_head_id"}
								<th>{s name="AboCommerceOrdersOrdernumber"}Bestellnummer{/s}</th>
							{/block}

							{block name="frontend_account_abonnements_table_head_delivery_interval"}
								<th>{s name="AboCommerceOrdersDeliveryInterval"}Lieferintervall{/s}</th>
							{/block}

							{block name="frontend_account_abonnements_table_head_expiry"}
								<th>{s name="AboCommerceOrdersExpiry"}Ablaufdatum{/s}</th>
							{/block}

							{block name="frontend_account_abonnements_table_head_actions"}
								<th>{s name="AboCommerceOrdersActions"}Aktion{/s}</th>
							{/block}
						</tr>
					{/block}
				</thead>
				<tbody>
					{block name="frontend_account_abonnement_item_overview"}
						{foreach $orders as $order}
							<tr class="info">
								{include file="frontend/abo_commerce/abonnement.tpl"}
							</tr>

							{* Abonnement details *}
							{block name="frontend_account_abonnement_item_detail"}
								{* Hidden order detail *}
								<tr>
									<td colspan="5">
										{include file="frontend/abo_commerce/abonnement_details.tpl"}
									</td>
								</tr>
							{/block}
						{/foreach}
					{/block}
				</tbody>
			{/block}
		</table>
	{/block}
{/if}