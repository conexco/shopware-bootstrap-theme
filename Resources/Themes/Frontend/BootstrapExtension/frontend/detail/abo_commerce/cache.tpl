{namespace name="frontend/plugins/abo_commerce"}

{block name='frontend_abo_commerce_detail_data_interval'}
	<span class="abo-commerce-delivery-interval-unit sw5-plugin hidden">
		{block name="frontend_abo_commerce_detail_data_interval_value"}
			{if $aboCommerce.deliveryIntervalUnit == "weeks"}
				<span>
					{s name="AboCommerceIntervalSelectWeeks"}Woche(n){/s}
				</span>
			{else}
				<span>
					{s name="AboCommerceIntervalSelectMonths"}Monat(e){/s}
				</span>
			{/if}
		{/block}
	</span>
{/block}

{block name='frontend_abo_abo_commerce_detail_data_duration'}
	<span class="abo-commerce-duration-unit hidden">
		{if $aboCommerce.durationUnit == "weeks"}
			{s name="AboCommerceDurationSelectWeeks"}Woche(n){/s}
		{else}
			{s name="AboCommerceDurationSelectMonths"}Monat(e){/s}
		{/if}
	</span>
{/block}

{block name='frontend_abo_abo_commerce_detail_data_abo_data'}
	<div class="abo-commerce-data sw5-plugin hidden">{$aboCommerce|json_encode}</div>
{/block}

{block name='frontend_abo_abo_commerce_detail_data_block_price_data'}
	<div class="abo-block-prices-data hidden">{$sArticle.sBlockPrices|json_encode}</div>
{/block}

{block name='frontend_abo_abo_commerce_detail_data_price_data'}
	<div class="abo-price-template-data sw5-plugin hidden">{'0'|currency}&nbsp;{s name="Star" namespace="frontend/listing/box_article"}{/s}</div>
{/block}
