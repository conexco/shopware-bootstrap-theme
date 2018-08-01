{extends file='frontend/checkout/cart_header.tpl'}

{block name='frontend_checkout_cart_header_quantity'}
    <div class="col-12 col-md-4 col-lg-3 text-right">
        {s name="CartColumnQuantity" namespace="frontend/checkout/cart_header"}{/s}
    </div>
{/block}

{block name='frontend_checkout_cart_header_price'}{/block}

{block name='frontend_checkout_cart_header_total'}
    <div class="col-12 col-md-4 text-right">
        {s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
    </div>
{/block}

{block name='frontend_checkout_cart_header_actions'}{/block}
