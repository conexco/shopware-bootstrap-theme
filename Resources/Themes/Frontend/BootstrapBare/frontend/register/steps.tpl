{* Step box *}
{block name='frontend_register_steps'}
    <ul class="row nav nav-pills d-none d-md-flex mb-5 py-3 border-bottom">
        {block name='frontend_register_steps_basket'}
            <li class="nav-item">
                {if $sStepActive == 'paymentShipping' || $sStepActive == 'finished'}
                    <span class="nav-link disabled">{s name="CheckoutStepAddressText"}{/s}</span>
                {else}
                    <a class="nav-link {if $sStepActive == 'address'} active{/if}"
                       href="{url controller=checkout action=confirm}" title="{s name='CheckoutStepAddressText'}{/s}">
                        {s name="CheckoutStepAddressText"}{/s}
                    </a>
                {/if}
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer1'}{/block}

        {* Second Step - Payment *}
        {block name='frontend_register_steps_register'}
            <li class="nav-item">
                <a class="nav-link {if $sStepActive=='paymentShipping'}active{/if}"
                   href="{url controller=checkout action=shippingPayment}"
                   title="{s name='CheckoutStepPaymentShippingText'}{/s}">
                    {s name="CheckoutStepPaymentShippingText"}{/s}
                </a>
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer2'}{/block}

        {* Third Step - Confirmation *}
        {block name='frontend_register_steps_confirm'}
            <li class="nav-item">
                <a class="nav-link {if $sStepActive=='finished'}active{/if}"
                   href="{url controller=checkout action=confirm}" title="{s name='CheckoutStepConfirmText'}{/s}">
                    {s name="CheckoutStepConfirmText"}{/s}
                </a>
            </li>
        {/block}
    </ul>
{/block}