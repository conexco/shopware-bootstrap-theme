<div class="price-container">
	{block name='container_price_description'}
		{* discount description *}
		{block name='container_price_text'}
			<p><strong>{s namespace="frontend/detail/bundle" name="DetailBundle"}Preis für alle zusammen{/s}</strong></p>
		{/block}
		{* bundle price *}
		{block name='container_price_value'}
			<div class="container-price-value">
				{* bundle price *}
				{block name='price_value_bundle_price'}
					<span class="price price-large price-discount price-value-bundle-price sw5-plugin" data-bundleId="{$bundle.id}">{$bundle.price.display|currency}</span>
					<span class="price price-large price-discount">{s name="Star" namespace="frontend/listing/box_article"}{/s}</span>
				{/block}

				{* regular price *}
				{block name='price_value_regular_price'}
					<span class="price price-small price-pseudo price-value-regular-price sw5-plugin" data-bundleId="{$bundle.id}">
                        {if $bundle.discount.display != '0'}
							{s namespace="frontend/detail/bundle" name="DetailBundleInstead"}Statt{/s}
							<span class="regular-price-total sw5-plugin">{$bundle.totalPrice|currency}</span>
							{s name="Star" namespace="frontend/listing/box_article"}{/s}
						{/if}
                    </span>
				{/block}
			</div>
		{/block}
	{/block}

	{* delivery time *}
	{block name='container_delivery_time'}
		{if $bundle.displayDelivery == 2 OR $bundle.displayDelivery == 3}
			<div class="delivery-time-container mtm">
				{if $longestShippingTimeArticle.sReleaseDate && $longestShippingTimeArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
					<p class="text-warning">
						<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoShipping"}{/s} {$longestShippingTimeArticle.sReleaseDate|date:'date_long'}</small>
					</p>
				{elseif $longestShippingTimeArticle.esd}
					<p class="text-success">
						<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoInstantDownload"}{/s}</small>
					</p>
				{elseif $longestShippingTimeArticle.instock > 0}
					<p class="text-success">
						<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoInstock"}{/s}</small>
					</p>
				{elseif $longestShippingTimeArticle.shippingtime}
					<p class="text-warning">
						<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataShippingtime"}{/s} {$longestShippingTimeArticle.shippingtime} {s namespace="frontend/plugins/index/delivery_informations" name="DetailDataShippingDays"}{/s}</small>
					</p>
				{else}
					<p class="text-danger">
						<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataNotAvailable"}{config name=notavailable}{/s}</small>
					</p>
				{/if}
			</div>
		{/if}
	{/block}
</div>
