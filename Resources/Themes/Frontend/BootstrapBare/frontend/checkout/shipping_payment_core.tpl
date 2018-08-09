{* Error messages *}
{block name='frontend_account_payment_error_messages'}
    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
{/block}

<form id="shippingPaymentForm" name="shippingPaymentForm" method="post" action="{url controller='checkout' action='saveShippingPayment' sTarget='checkout' sTargetAction='index'}" class="payment">
    {* Action top *}
    {block name='frontend_checkout_shipping_payment_core_buttons_top'}
        {block name='frontend_checkout_shipping_payment_core_buttons'}
            <div class="text-right mb-4">
                <button type="submit" class="btn btn-primary">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}</button>
            </div>
        {/block}
    {/block}

    {* Payment and shipping information *}
    {block name='frontend_checkout_shipping_payment_core_fields'}
        <div class="row">
            {* Payment method *}
            <div class="col-12 mb-4">
                <div class="card">
                    {block name='frontend_checkout_shipping_payment_core_payment_fields'}
                        {include file='frontend/checkout/change_payment.tpl' form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPaymentMeans}
                    {/block}
                </div>
            </div>

            {* Shipping method *}
            {if $sDispatches}
                <div class="col-12 mb-4">
                    <div class="card">
                        {block name='frontend_checkout_shipping_payment_core_shipping_fields'}
                            {include file="frontend/checkout/change_shipping.tpl"}
                        {/block}
                    </div>
                </div>
            {/if}
        </div>
    {/block}
</form>

{* Cart values *}
{block name='frontend_checkout_shipping_payment_core_footer'}
    <div class="card mb-4">
        <div class="card-footer border-top-0">
                {include file="frontend/checkout/cart_footer.tpl"}
        </div>
    </div>
{/block}

{* Action bottom *}
{block name='frontend_checkout_shipping_payment_core_buttons_bottom'}
    {block name='frontend_checkout_shipping_payment_core_buttons'}
        <div class="text-right mb-4">
            <button type="submit" id="shippingPaymentFormButton" form="shippingPaymentForm" class="btn btn-primary">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}</button>
        </div>
    {/block}
{/block}
