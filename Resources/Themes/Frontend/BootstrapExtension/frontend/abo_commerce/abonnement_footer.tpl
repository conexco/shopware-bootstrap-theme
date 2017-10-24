{namespace name="frontend/abo_commerce/orders"}

{block name="frontend_account_abonnement_item_detail_info_row"}
	<tr>
		{block name="frontend_account_abonnement_item_detail_info_labels"}
			<td colspan="1">
				{* Duration label *}
				{block name="frontend_account_abonnement_item_detail_duration_label"}
					<p>{s name="AboCommerceOrdersDuration"}Laufzeit:{/s}</p>
				{/block}

				{* Delivery intervall label *}
				{block name="frontend_account_abonnement_item_detail_delivery_intervall_label"}
					<p>{s name="AboCommerceOrdersDeliveryInterval"}Lieferintervall{/s}</p>
				{/block}

				{* Abonnement next delivery label *}
				{block name="frontend_account_abonnement_item_label_delivery"}
					<p>{s name="AboCommerceOrdersNextDelivery"}Nächste Lieferung:{/s}</p>
				{/block}
			</td>
		{/block}

		{block name="frontend_account_abonnement_item_detail_info_data"}
			<td colspan="5">
				{* Duration data *}
				{block name="frontend_account_abonnement_item_detail_duration"}
					<p>{$order.duration} {if $order.durationUnit eq 'months'}{s name="AboCommerceOrdersMonths"}Monat(e){/s}{else}{s name="AboCommerceOrdersWeeks"}Woche(n){/s}{/if}</p>
				{/block}

				{* Delivery intervall data *}
				{block name="frontend_account_abonnement_item_detail_delivery_intervall"}
					<p>{s name="AboCommerceOrdersEach"}jede{/s} {$order.deliveryInterval} {if $order.deliveryIntervalUnit eq 'months'}{s name="AboCommerceOrdersMonths"}Monat(e){/s}{else}{s name="AboCommerceOrdersWeeks"}Woche(n){/s}{/if}</p>
				{/block}

				{* Abonnement total *}
				{block name='frontend_account_abonnement_item_delivery'}
					<p>{$order.dueDate|date:DATE_MEDIUM}</p>
				{/block}
			</td>
		{/block}
	</tr>
{/block}

{block name="frontend_account_abonnement_item_detail_summary_row"}
	<tr>
		{block name="frontend_account_abonnement_item_detail_summary_labels"}
			<td colspan="1">
				{* Abonnement dispatch-costs label *}
				{block name="frontend_account_abonnement_item_label_dispatch"}
					<p>{s name="AboCommerceOrdersShippingCosts"}Versandkosten:{/s}</p>
				{/block}

				{* Abonnement total label *}
				{block name="frontend_account_abonnement_item_label_total"}
					<p>{s name="AboCommerceOrdersTotalAmount"}Gesamtsumme:{/s}</p>
				{/block}
			</td>
		{/block}

		{block name="frontend_account_abonnement_item_detail_summary_data"}
			<td colspan="5">
				{* Abonnement dispatch *}
				{block name='frontend_account_abonnement_item_dispatch'}
					<p>{$order.order.invoiceShipping|currency}</p>
				{/block}

				{* Abonnement total *}
				{block name='frontend_account_abonnement_item_total'}
					<p>{$order.order.invoiceAmount|currency}</p>
				{/block}
			</td>
		{/block}
	</tr>
{/block}