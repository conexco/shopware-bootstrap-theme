<div class="col-xs-12 col-sm-2 col-sm-pull-2 col-md-pull-1 text-right">
    <div class="mtm-xs">
        {block name='frontend_checkout_cart_item_total_price_label'}
            <strong class="d-sm-none pull-left">{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}</strong>
        {/block}
        <strong>{$sBasketItem.required_points}P.</strong>
    </div>
</div>