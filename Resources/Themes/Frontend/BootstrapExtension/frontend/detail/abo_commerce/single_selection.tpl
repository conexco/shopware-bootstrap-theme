{* single price and radio button *}
{block name='abo_commerce_single_selection'}
	{* single label text *}
	{block name='abo_commerce_single_label'}
		<strong>{s name="AboCommerceDetailSingleDelivery" namespace="frontend/plugins/abo_commerce"}Einmalige Lieferung{/s}</strong>
	{/block}
	{block name='abo_commerce_single_selection_price'}
		<div class="radio mts">
			<label for="abo-single-delivery-input">
				{block name='abo_commerce_single_selection_price_input'}
					<input class="abo-single-delivery-input sw5-plugin radio" id="abo-single-delivery-input" name="aboSelection" class="selection" value="single" type="radio" checked="checked" />
				{/block}

				{block name='abo_commerce_single_selection_price_meta'}
					<meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
					{if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}
					<span>{$sArticle.price|currency}{s name="Star" namespace="frontend/listing/box_article"}*{/s}</span>
				{/block}
			</label>
		</div>
	{/block}
{/block}