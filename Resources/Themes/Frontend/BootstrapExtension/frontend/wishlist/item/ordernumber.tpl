{$maxQuantity=$item.article.maxpurchase+1}
{if $item.article.laststock && $item.article.instock < $item.article.maxpurchase}
	{$maxQuantity=$item.article.instock+1}
{/if}

{if $item.article.isAvailable}
	<div class="cart-quantity mtm">
		<p>{s namespace="frontend/plugins/swag_advanced_cart/plugin" name='Quantity'}Stückzahl{/s}:</p>
		{if !$hideDelete}
			<select class="advancedCartQuantity sw5-plugin form-control" name="sQuantity" data-item-id="{$item.id}" data-quantity-url="{url controller='wishlist' action='changeQuantity'}">
				{section name="i" start=$item.article.minpurchase loop=$maxQuantity step=$item.article.purchasesteps}
					<option value="{$smarty.section.i.index}" {if $smarty.section.i.index == $item.quantity}selected="selected"{/if}>{$smarty.section.i.index}{if $item.article.packunit} {$item.article.packunit}{/if}</option>
				{/section}
			</select>
		{else}
			{$item.quantity}
		{/if}
	</div>
{/if}