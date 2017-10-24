{* Cache the aboCommerce array *}
{block name="frontend_abo_commerce_detail_data"}
	{include file='frontend/detail/abo_commerce/cache.tpl'}
{/block}

{* abo commerce data *}
{block name="frontend_detail_data_abo_commerce_panel"}
	{block name="frontend_detail_data_abo_commerce_panel_body"}
		{block name='frontend_detail_data_abo_commerce_block_price'}
			{* Show block prices if an abo product is already placed in the basket *}
			{if $aboCommerce.isExclusive && $sArticle.sBlockPrices}
				{include file="frontend/detail/block_price.tpl" sArticle=$sArticle}
			{/if}
		{/block}

		{* Normal single purchase *}
		{block name="frontend_detail_data_abo_commerce_single"}
			{if !$aboCommerce.isExclusive}
				<div class="abo-single-delivery">
					{include file='frontend/detail/abo_commerce/single_selection.tpl'}
				</div>
			{/if}
		{/block}

		{* Abo purchase *}
		{block name="frontend_detail_data_abo_commerce_abo"}
			{if $aboCommerce.selectedDuration}
				{assign var="aboPrice" value=$aboCommerce.prices.{$aboCommerce.selectedDuration}}
			{else}
				{assign var="aboPrice" value=$aboCommerce.prices.0}
			{/if}
			<div class="abo-delivery">

				{* abo delivery label *}
				{block name='abo_commerce_abo_selection_label'}
					<strong class="abo-discount-label sw5-plugin">
						{if $aboCommerce.hasDiscount}
							{s name="AboCommerceDetailSavingSubscription" namespace="frontend/plugins/abo_commerce"}Spar-Abo{/s}
						{else}
							{s name="AboCommerceDetailSubscription" namespace="frontend/plugins/abo_commerce"}Abonnement{/s}
						{/if}
						{* price separation popup *}
						{block name='abo_commerce_price_separation_popup'}
							{include file='frontend/detail/abo_commerce/price_separation_popup.tpl'}
						{/block}
					</strong>

				{/block}

				{* abo selection *}
				{block name='abo_commerce_abo_selection'}
					<div class="row">
						{include file='frontend/detail/abo_commerce/abo_selection.tpl'}
					</div>
				{/block}

				{* abo description *}
				{block name='abo_commerce_abo_selection_description'}
					{if $aboCommerce.description}
						<p class="abo-description">{$aboCommerce.description|strip_tags|truncate:100}</p>
					{/if}
				{/block}

				{* delivery interval *}
				{block name='abo_commerce_abo_selection_delivery_interval'}
					<div class="abo-delivery-interval-container sw5-plugin{if !$aboCommerce.isExclusive} hidden{/if}">
						{block name='abo_commerce_abo_selection_delivery_interval'}
							{include file='frontend/detail/abo_commerce/abo_delivery_interval.tpl'}
						{/block}

						{block name='abo_commerce_abo_selection_delivery_duration'}
							{include file='frontend/detail/abo_commerce/abo_delivery_duration.tpl'}
						{/block}
					</div>
				{/block}
			</div>
		{/block}
	{/block}
{/block}