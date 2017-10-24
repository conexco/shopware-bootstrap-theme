{namespace name="frontend/detail/abo_commerce_detail"}

{block name='abo_commerce_abo_selection_delivery_interval'}
	{block name='abo_commerce_abo_selection_delivery_interval_label'}
		<label for="delivery-interval">{s name="AboCommerceIntervalSelectDeliveryInterval"}Lieferintervall:{/s}</label>
	{/block}
{/block}

{block name='abo_commerce_abo_selection_delivery_interval_select'}
	<div class="abo-delivery-interval-select mbm">
		<select name="delivery-interval" class="abo-delivery-interval sw5-plugin">
			{for $deliveryInterval=$aboCommerce.minDeliveryInterval to $aboCommerce.maxDeliveryInterval}
				{block name="abo_commerce_abo_selection_delivery_interval_select_option"}
					<option value="{$deliveryInterval}">
						{$deliveryInterval}&nbsp;
						{if $aboCommerce.deliveryIntervalUnit == "weeks"}
							{s name="AboCommerceIntervalSelectWeeks"}Woche(n){/s}
						{else}
							{s name="AboCommerceIntervalSelectMonths"}Monat(e){/s}
						{/if}
					</option>
				{/block}
			{/for}
		</select>
	</div>
{/block}


