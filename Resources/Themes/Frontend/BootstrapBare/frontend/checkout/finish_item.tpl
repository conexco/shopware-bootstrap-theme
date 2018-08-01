{extends file='frontend/checkout/cart_item.tpl'}

{block name='frontend_checkout_cart_item_delivery_informations'}{/block}
{block name='frontend_checkout_cart_item_quantity'}
    <div class="col-12 col-md-4 col-lg-3 text-right">
        <strong class="d-md-none float-left">{s name="CartColumnQuantity" namespace="frontend/checkout/cart_header"}{/s}</strong>
        <strong>{$sBasketItem.quantity}</strong>
    </div>
{/block}
{block name='frontend_checkout_cart_item_price'}{/block}

{* Remove all the delete buttons for products *}
{block name='frontend_checkout_cart_item_delete_article'}{/block}
{block name='frontend_checkout_cart_item_voucher_delete'}{/block}
{block name='frontend_checkout_cart_item_premium_delete'}{/block}
{block name='frontend_checkout_cart_item_premium_delete_article'}{/block}
{block name='frontend_checkout_cart_item_voucher_delete_article'}{/block}

{block name='frontend_checkout_cart_item_total_sum'}
    <div class="col-12 col-md-4 col-lg-4 text-right">
        <strong class="d-md-none float-left">{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}</strong>
        <strong>{$sBasketItem.amount|currency}*</strong>
    </div>
{/block}

{block name='frontend_checkout_cart_item_premium_total_sum'}
    <div class="col-4 text-right">
        {block name='frontend_checkout_cart_item_premium_total_sum_display'}
            <p>{s name="CartItemInfoFree" namespace='frontend/checkout/cart_item'}{/s}</p>
        {/block}
    </div>
{/block}

{block name='frontend_checkout_cart_item_voucher_price'}
    <div class="col-4 text-right">
        {block name='frontend_checkout_cart_item_voucher_price_display'}
            {if $sBasketItem.itemInfo}
                <strong>{$sBasketItem.itemInfo}</strong>
            {else}
                <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}</strong>
            {/if}
        {/block}
    </div>
{/block}

{block name='frontend_checkout_cart_item_rebate_price'}
    <div class="col-4 text-right">
        {block name='frontend_checkout_cart_item_rebate_price_display'}
            {if $sBasketItem.itemInfo}
                <strong>{$sBasketItem.itemInfo}</strong>
            {else}
                <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}*{/block}</strong>
            {/if}
        {/block}
    </div>
{/block}