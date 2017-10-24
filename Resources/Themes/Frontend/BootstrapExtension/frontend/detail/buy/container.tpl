{* delivery quantity and total deliveries *}
{block name='frontend_abo_commerce_delivery_total_text'}
	<div class="abo-info-wrapper sw5-plugin mtl{if !$aboCommerce.isExclusive} hidden{/if}">
		{block name="frontend_abo_commerce_delivery_total_text_amount"}
			<strong>{s namespace="frontend/detail/abo_commerce_detail" name="aboCommerceAmountInfoEntireAmount"}Gesamte Liefermenge:{/s}</strong>
		{/block}

		{block name="frontend_abo_commerce_delivery_total_text_info"}
			<strong class="abo-info sw5-plugin">
				{$deliveryAmount = ($aboCommerce.minDuration / $aboCommerce.minDeliveryInterval) + 1}
					{block name="frontend_abo_commerce_delivery_total_text_info_delivery"}
						<span class="abo-info-delivery sw5-plugin">{$deliveryAmount * $sArticle.minpurchase}&nbsp;</span>
						{s namespace="frontend/detail/abo_commerce_detail" name="aboCommerceAmountInfoIn"}in{/s}
					{/block}
					{block name="frontend_abo_commerce_delivery_total_text_info_duration"}
						<span class="abo-info-duration sw5-plugin">&nbsp;{$deliveryAmount}&nbsp;</span>
						{s namespace="frontend/detail/abo_commerce_detail" name="aboCommerceAmountInfoDeliveries"}Lieferungen{/s}
					{/block}
			</strong>
		{/block}
	</div>
{/block}