{extends file='parent:frontend/payment_paypal/gateway.tpl'}

{* Main content *}
{block name="frontend_index_content"}
    <h1 class="paypal-gateway-title">{s name="PaypalGatewayHeader"}{/s}</h1>

    <div class="paypal-gateway-loader">
        <p class="paypal-gateway-loader-text">
            <i class="fa fa-spinner fa-pulse fa-lg text-primary mrs"></i>{s name="PaypalGatewayInfoWait"}{/s}
        </p>

        <p class="paypal-gateway-fallback">
            {s name="PaypalGatewayInfoFallback"}{/s}
        </p>
    </div>
{/block}