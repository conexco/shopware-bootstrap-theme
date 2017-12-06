{if $sBasketItem.aboCommerce.deliveryIntervalUnit eq 'months'}
    {$deliveryIntervalWeeks = $sBasketItem.abo_attributes.swagAboCommerceDeliveryInterval * 4}
{else}
    {$deliveryIntervalWeeks = $sBasketItem.abo_attributes.swagAboCommerceDeliveryInterval}
{/if}

{assign var="maxUnits" value=$deliveryIntervalWeeks * $sBasketItem.aboCommerce.maxQuantityPerWeek}

{block name="frontend_checkout_abocommerce_quantity"}
	{if $sBasketItem.modus == 0}
		<div class="col-6 col-sm-2">
			<form name="basket_change_quantity{$sBasketItem.id}" method="post" action="{url action='changeQuantity' sTargetAction=$sTargetAction}">
				<input type="hidden" name="sArticle" value="{$sBasketItem.id}"/>
                <select name="sQuantity" class="form-control" data-auto-submit="true">
                    {section name="i" start=$sBasketItem.minpurchase loop=$maxUnits+1 step=$sBasketItem.purchasesteps}
                        <option value="{$smarty.section.i.index}" {if $smarty.section.i.index==$sBasketItem.quantity}selected="selected"{/if}>
                            {$smarty.section.i.index}
                        </option>
                    {/section}
                </select>
			</form>
		</div>
	{else}
		&nbsp;
	{/if}
{/block}
