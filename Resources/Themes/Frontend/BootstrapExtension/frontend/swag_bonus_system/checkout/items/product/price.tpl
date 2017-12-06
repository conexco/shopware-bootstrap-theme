<div class="col-xs-12 col-sm-2 col-sm-pull-2 col-md-pull-1 text-right">
    <div class="mtm-xs">
        {block name='frontend_checkout_cart_item_unit_price_label'}
            <span class="d-sm-none float-left">{s name="CartColumnPrice" namespace="frontend/checkout/cart_header"}{/s}</span>
        {/block}
        {$sBasketItem.points_per_unit}P.
    </div>
</div>