{extends file='frontend/checkout/cart_item.tpl'}

{* Product SKU number *}
{block name='frontend_checkout_cart_item_details_sku'}
    <dl class="dl-horizontal dl-article">
        <dt>{s name="CartItemInfoId" namespace="frontend/checkout/cart_item"}Artikelnummer{/s}</dt>
        <dd>{$sBasketItem.ordernumber}</dd>
        <dt>{s name='CheckoutItemPrice'}{/s}</dt>
        <dd>{$sBasketItem.price|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</dd>
    </dl>
{/block}

{* Additional product information *}
{block name='frontend_checkout_cart_item_details_inline'}
    {$smarty.block.parent}
    {block name='frontend_checkout_cart_item_details_essential_features'}
        {* Main article features *}
        <p><small>{include file="string:{config name=mainfeatures}"}</small></p>
    {/block}
{/block}

{block name='frontend_checkout_cart_item_delivery_informations'}
    {if $sLaststock.articles[$sBasketItem.ordernumber].OutOfStock == true}
        <p class="text-error">
            <small>{s name="CheckoutItemLaststock"}Nicht lieferbar!{/s}</small>
        </p>
    {else}
        {*! Delivery informations *}
        {if {config name=BasketShippingInfo}}
            {if $sBasketItem.shippinginfo}
                {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem}
            {/if}
        {/if}
    {/if}
{/block}

{block name='frontend_checkout_cart_item_quantity'}
    {if $sLaststock.articles[$sBasketItem.ordernumber].OutOfStock == true}
        <div class="col-xs-6 col-sm-2">
	        -
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}

{* Product *}
{block name='frontend_checkout_cart_item_price'}{/block}
{block name='frontend_checkout_cart_item_tax_price'}
    <div class="col-xs-12 col-sm-2 col-sm-pull-4 col-md-pull-3 text-right">
	    {if $sUserData.additional.charge_vat}
	    	<div class="mtm-xs">
		    	<span class="d-sm-none float-left">{s name='CheckoutColumnTaxFix' namespace="frontend/checkout/confirm_header"}MwSt.{/s}</span>
	    		{$sBasketItem.tax|currency}
	    	</div>	
	    {/if}
	</div>
{/block}
{block name='frontend_checkout_cart_item_total_sum'}
    <div class="col-xs-12 col-sm-2 col-md-push-1 text-right">
        <div class="mtm-xs">
            <strong class="d-sm-none float-left">{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}</strong>
            <strong>{$sBasketItem.amount|currency}*</strong>
        </div>
    </div>
{/block}
		        
{* Voucher *}
{block name='frontend_checkout_cart_item_voucher_tax_price'}
    <div class="col-xs-12 col-sm-2 col-sm-pull-2 text-right">
        {if $sUserData.additional.charge_vat}{$sBasketItem.tax|currency}{/if}
    </div>
{/block}
{block name='frontend_checkout_cart_item_voucher_price'}
    <div class="col-xs-4 col-sm-2 col-sm-push-2 text-right">
        {if $sBasketItem.itemInfo}
            <strong>{$sBasketItem.itemInfo}</strong>
        {else}
            <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}*{/block}</strong>
        {/if}
    </div>
{/block}

{* Premium Product *}
{block name='frontend_checkout_cart_item_premium_tax_price'}
    <div class="col-xs-12 col-sm-2 col-sm-pull-2 text-right">
        {if $sUserData.additional.charge_vat}{$sBasketItem.tax|currency}{/if}
    </div>
{/block}
{block name='frontend_checkout_cart_item_premium_total_sum'}
    <div class="col-xs-4 col-sm-2 col-sm-push-2 text-right">
        <p>{s name="CartItemInfoFree" namespace='frontend/checkout/cart_item'}{/s}</p>
    </div>
{/block}

{* Rebate *}
{block name='frontend_checkout_cart_item_rebate_tax_price'}
    <div class="col-xs-12 col-sm-2 col-sm-pull-2 text-right">
        {if $sUserData.additional.charge_vat}{$sBasketItem.tax|currency}{/if}
    </div>
{/block}
{block name='frontend_checkout_cart_item_rebate_price'}
    <div class="col-xs-4 col-sm-2 col-sm-push-2 text-right">
        {if $sBasketItem.itemInfo}
            <strong>{$sBasketItem.itemInfo}</strong>
        {else}
            <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}*{/block}</strong>
        {/if}
    </div>
{/block}

{* Hide tax symbol *}
{block name='frontend_checkout_cart_tax_symbol'}{/block}
