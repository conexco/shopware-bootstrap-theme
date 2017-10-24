{extends file='frontend/checkout/cart_header.tpl'}

{block name='frontend_checkout_cart_header_quantity'}
    <div class="col-sm-2"></div>
{/block}

{block name='frontend_checkout_cart_header_price'}
    <div class="col-sm-2"></div>
{/block}

{block name='frontend_checkout_cart_header_total'}
    <div class="col-sm-2 text-right">
        {s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
    </div>
{/block}

{block name='frontend_checkout_cart_header_actions'}
    <div class="col-sm-2 col-md-1"></div>
{/block}
