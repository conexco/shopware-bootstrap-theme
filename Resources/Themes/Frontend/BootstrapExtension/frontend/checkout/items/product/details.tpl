{if $sBasketItem.abo_attributes.swagAboCommerceDuration > 0}
	{if $sTargetAction == 'cart'}
		{block name="frontend_abocommerce_cart_details"}
			<strong>{s namespace='frontend/checkout/abo_commerce_cart_item' name='AboCommerceCartItemMessageHeadline'}Abo-Lieferung{/s}</strong>
			<p class="content-abo-details">{s namespace='frontend/checkout/abo_commerce_cart_item' name='AboCommerceCartItemMessage'}Die Kosten pro Lieferung werden im nächsten Schritt berechnet!{/s}</p>
		{/block}

	{elseif $sTargetAction == 'confirm'}
		{block name="frontend_abocommerce_confirm_details"}
			{block name="frontend_abocommerce_confirm_headline"}
				<strong>{s namespace='frontend/checkout/abo_commerce_cart_item' name='AboCommerceCartItemMessageHeadline'}Abo-Lieferung{/s}</strong>
			{/block}
			{block name="frontend_abocommerce_confirm_details_container"}
				<dl class="dl-horizontal">
					{block name="frontend_abocommerce_confirm_details_runtime"}
						<div>
							{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemRunTime'}Laufzeit:{/s}
							<strong>{$sBasketItem.abo_attributes.swagAboCommerceDuration} {if $sBasketItem.aboCommerce.durationUnit eq 'months'}{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemMonths'}Monat(e){/s}{else}{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemWeeks'}Woche(n){/s}{/if}</strong>
						</div>
					{/block}
					{block name="frontend_abocommerce_confirm_details_delivery_interval"}
						<div>
							{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemDeliveryInterval'}Lieferintervall:{/s}
							<strong>{$sBasketItem.abo_attributes.swagAboCommerceDeliveryInterval} {if $sBasketItem.aboCommerce.deliveryIntervalUnit eq 'months'}{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemMonths'}Monat(e){/s}{else}{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemWeeks'}Woche(n){/s}{/if}</strong>
						</div>
					{/block}
					{block name="frontend_abocommerce_confirm_details_delivery_count"}
						<div>
							{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemDeliveryCount'}Anzahl der Lieferungen:{/s}
							<strong>{$sBasketItem.abo_attributes.deliveryCount}</strong>
						</div>
					{/block}
					{block name="frontend_abocommerce_confirm_details_amount_delivery"}
						<div>
							{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemAmountPerDelivery'}Preis pro Lieferung:{/s}
							<strong>{$sBasketItem.abo_attributes.amountPerDelivery|currency}</strong>
						</div>
					{/block}
					{block name="frontend_abocommerce_confirm_details_total_amount"}
						<div>
							{s namespace='frontend/checkout/abo_commerce_confirm_item' name='AboCommerceConfirmItemAmount'}Gesamtpreis über Laufzeit:{/s}
							<strong>{$sBasketItem.abo_attributes.amount|currency}</strong>
						</div>
					{/block}
				</dl>
			{/block}
		{/block}
	{/if}
{/if}