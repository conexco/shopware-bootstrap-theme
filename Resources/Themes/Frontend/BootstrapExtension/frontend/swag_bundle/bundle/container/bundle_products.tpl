{block name='products_detail_wrapper'}
	{foreach $bundle.articles as $article}
		<div class="detail-wrapper mbl sw5-plugin"
			 data-bundleArticleId="{if $article.bundleArticleId}{$article.bundleArticleId}{else}0{/if}"
			 data-bundleId="{$bundle.id}"
			 data-articlePrice="{$article.price.total}"
			 data-configurationRequestUrl="{url controller=bundle action=configureArticle}">

			{* product details *}
			{block name='bundle_wrapper_article'}
				<div class="row bundle-wrapper-article sw5-plugin{if $bundle.type === 2} selective-product{/if}{if $article.noArticleStock} not-buyable{/if} bundle-id-{$bundle.id}">
					{* product image *}
					{block name='bundle_article_image'}
						<div class="col-md-2">
							{* product checkbox  *}
							{block name='wrapper_cross_selling'}
								{if $bundle.type === 2 && !$article@first}
									<div class="bundle-article-checkbox sw5-plugin" data-bundleId="{$bundle.id}">
										<input type="checkbox"
											   name="bundle-article-{$article.bundleArticleId}"
											   autocomplete="off"
											   checked="checked"/>
										<i class="fa fa-lg text-primary"></i>
									</div>
								{/if}
							{/block}
							<img src="{if $article.cover.src.0}{$article.cover.src.0}{else}{link file='frontend/_public/src/img/no-picture.png'}{/if}" alt="{$article.articleName|escape}" class="img-responsive img-center">
						</div>
					{/block}

					{block name='bundle_article_wrapper_info'}
						<div class="col-md-4">
							{block name='bundle_article_info'}
								{* product name *}
								{block name='bundle_article_name'}
									<div class="bundle-article-name mbl">
										<a href="{url controller=detail sArticle=$article.articleId}" title="{if !$article.articleName}{$article.name|escape}{else}{$article.articleName|escape}{/if}">{$article.quantity}x {if !$article.articleName}{$article.name|escape}{else}{$article.articleName|escape}{/if}</a>
									</div>
								{/block}

								{* product supplier and price *}
								{block name='bundle_article_price_supplier'}
									<p class="bundle-article-price-supplier">
										{if $article.supplier}<span class="text-muted"> - {$article.supplier} -</span>{/if} <span class="price price-small">{$article.price.total|currency}<span> {s name="Star" namespace="frontend/listing/box_article"}{/s}
									</p>
								{/block}

								{* product delivery time *}
								{block name='bundle_article_delivery_time'}
									{if  $bundle.displayDelivery == 1 OR $bundle.displayDelivery == 3}
										<div class="bundle-article-delivery">
											{if $article.sReleaseDate && $article.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
												<p class="text-warning">
													<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoShipping"}{/s} {$article.sReleaseDate|date:'date_long'}</small>
												</p>
											{elseif $article.esd}
												<p class="text-success">
													<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoInstantDownload"}{/s}</small>
												</p>
											{elseif $article.instock > 0}
												<p class="text-success">
													<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataInfoInstock"}{/s}</small>
												</p>
											{elseif $article.shippingtime}
												<p class="text-warning">
													<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataShippingtime"}{/s} {$article.shippingtime} {s namespace="frontend/plugins/index/delivery_informations" name="DetailDataShippingDays"}{/s}</small>
												</p>
											{else}
												<p class="text-danger">
													<small>{s namespace="frontend/plugins/index/delivery_informations" name="DetailDataNotAvailable"}{config name=notavailable}{/s}</small>
												</p>
											{/if}
										</div>
									{/if}
								{/block}
							{/block}
						</div>
						<div class="col-md-4">
							{* product configuration for variant articles *}
							{block name='bundle_article_configuration'}
								{if $article.configuration|@count > 0}
									<div class="bundle-article-configuration sw5-plugin">
										{block name='configuration_group'}
											{foreach $article.configuration as $group}
												{block name='group_selector'}
													<div class="configuration-selector mbm sw5-plugin">
														{* configuration label *}
														{block name='selector_label'}
															<label for="group-{$group.id}">{$group.name}:</label>
														{/block}

														{* configuration select *}
														{block name='selector_select'}
															<select class="form-control" id="group-{$group.id}" name="group-{$group.id}" data-defaultValue="{$group.selected}">
																{block name='select_option'}
																	{foreach $group.options as $option}
																		<option value="{$option.id}"{if $option.id == $group.selected} selected="selected"{/if}>
																			{$option.name}
																		</option>
																	{/foreach}
																{/block}
															</select>
														{/block}
													</div>
												{/block}
											{/foreach}
										{/block}
										<button class="bundle-article-configuration-add sw5-plugin btn btn-primary" disabled="disabled">
											{s name="sConfigurationTake" namespace="frontend/detail/bundle"}Konfiguration übernehmen{/s}
										</button>
									</div>
								{/if}
							{/block}
						</div>
					{/block}
				</div>
			{/block}

			{* product error message  *}
			{block name='wrapper_error_message'}
				{if $article.noArticleStock}
					{include file="frontend/_includes/messages.tpl" type="error" content="{$article.name} {s namespace="frontend/detail/bundle" name="CheckoutBundleError"}not available, select other variant or unselect it{/s}"}
				{/if}
			{/block}
		</div>
	{/foreach}
{/block}
