{block name='frontend_detail_index_bundle_container'}

	{block name='bundle_panel'}
		<div class="panel panel-primary bundle-panel"
			 data-swagBundle="true"
			 data-requestUrl="{url controller=Bundle action=getArticleConfiguration}"
			 data-discountType="{$bundle.discountType}"
			 data-discountPercentage="{$bundle.discount.percentage}"
			 data-currencyHelper="{0|currency}"
			 data-bundleId="{$bundle.id}">

			{* bundle headline *}
			{block name='panel_header'}
				<div class="panel-heading">
					<h3 class="panel-title bundle-panel-header sw5-plugin">
						{if $bundle.showName}
							{$bundle.name}
						{else}
							{s namespace="frontend/detail/bundle" name="DetailBundleHeaeder"}Bundleangebote{/s}
						{/if}
					</h3>
				</div>
			{/block}

			{block name='panel_content'}
				<div class="panel-body">
					{block name="panel_content_description"}
						{if $bundle.description}
							<div class="bundle-description mbl sw5-plugin">
								{* Long description *}
								{block name="panel_content_description_long"}
									<div class="teaser-text-long d-none d-sm-block">
										{$bundle.description}
									</div>
								{/block}

								{* Short description *}
								{block name="panel_content_description_short"}
									<div class="teaser-text-short d-sm-none">
										{$bundle.description|strip_tags|truncate:200}
										<a href="#" id="bundle-offcanvas-btn" data-offcanvas="true" data-offCanvasSelector="#bundle-teaser" data-fullscreen="true" title="{"{s namespace="frontend/listing/listing" name="ListingActionsOpenOffCanvas"}{/s}"|escape}">
											{s namespace="frontend/listing/listing" name="ListingActionsOpenOffCanvas"}{/s} &raquo;
										</a>
									</div>
								{/block}

								{* Off Canvas Container *}
								{block name="panel_content_description_off_canvas"}
									<div id="bundle-teaser" class="d-sm-none">
										{* Close Button *}
										<div class="buttons-off-canvas offcanvas-bundle">
											<a href="#" title="{"{s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}"|escape}" class="close-off-canvas sw5-plugin">
												<i class="fa fa-angle-left"></i>
												{s namespace="frontend/listing/listing" name="ListingActionsCloseOffCanvas"}{/s}
											</a>
										</div>

										{* Off Canvas Content *}
										{block name="panel_content_description_off_canvas_text"}
											<div class="offcanvas-content bundle-teaser-text">
												{if $bundle.showName}
													{$bundle.name}
												{else}
													{s namespace="frontend/detail/bundle" name="DetailBundleHeaeder"}Bundleangebote{/s}
												{/if}
												{$bundle.description}
											</div>
										{/block}
									</div>
								{/block}
							</div>
						{/if}
					{/block}

					{block name="panel_content_header"}
						<div class="row content-bundle-header">
							{block name="panel_content_header_slider"}
								<div class="col-12 col-md-8">
									{* image slider *}
									{block name='content_image_slider'}
										{include file='frontend/swag_bundle/bundle/container/bundle_image_slider.tpl'}
									{/block}
								</div>
							{/block}

							{block name="panel_content_header_price"}
								<div class="col-12 col-md-4">
									{* bundle price *}
									{block name='content_price'}
										{include file='frontend/swag_bundle/bundle/container/bundle_price.tpl'}
									{/block}

									{* cart button *}
									{block name='content_cart_button'}
										<div class="text-right">
											<button class="btn btn-primary content-cart-button sw5-plugin" name="{s name="DetailBuyActionAdd"}{/s}">
												{s namespace="frontend/detail/bundle/box_related" name="BundleActionAdd"}In den Warenkorb{/s}
											</button>
										</div>
									{/block}
								</div>
							{/block}
						</div>
					{/block}

					{* bundle products *}
					{block name='content_products'}
						<div class="content-products-container mtm">
							{block name='products_header'}
								<div class="products-header btn btn-outline-secondary hidden sw5-plugin" data-bundleId="{$bundle.id}">{if $bundle.type == 2}{s namespace='frontend/detail/bundle/box_related' name='bundleHeaderActionShowBundleConfigurable'}Bundle anzeigen / konfigurieren{/s}{else}{s namespace='frontend/detail/bundle/box_related' name='bundleHeaderActionShow'}Bundle anzeigen{/s}{/if}</div>
							{/block}

							{block name='products_content'}
								<div class="products-content hidden sw5-plugin">
									{include file='frontend/swag_bundle/bundle/container/bundle_products.tpl'}
								</div>
							{/block}

							{block name='products_footer'}
								<div class="products-footer btn btn-outline-secondary hidden sw5-plugin" data-bundleId="{$bundle.id}">{s namespace='frontend/detail/bundle/box_related' name='bundleFooterActionShow'}Bundle schlie&szlig;en{/s}</div>
							{/block}
						</div>
					{/block}
				</div>
			{/block}
		</div>
	{/block}
{/block}
