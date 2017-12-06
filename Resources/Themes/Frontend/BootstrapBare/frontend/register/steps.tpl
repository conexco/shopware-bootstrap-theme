{* Step box *}
{block name='frontend_register_steps'}
    <ul class="nav nav-tabs nav-justified mbl d-none d-md-block">
        {block name='frontend_register_steps_basket'}
            <li class="step-basket{if $sStepActive == 'address'} active{elseif $sStepActive == 'paymentShipping' || $sStepActive == 'finished'} disabled{/if}">              
                <a href="{url controller=checkout action=confirm}" title="{s name='CheckoutStepAddressText'}{/s}">
                    {s name="CheckoutStepAddressText"}{/s}
                </a>
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer1'}{/block}

        {* Second Step - Payment *}
        {block name='frontend_register_steps_register'}
            <li class="step-register {if $sStepActive=='paymentShipping'}active{/if}">
                <a href="{url controller=checkout action=shippingPayment}" title="{s name='CheckoutStepPaymentShippingText'}{/s}">
                    {s name="CheckoutStepPaymentShippingText"}{/s}
                </a>
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer2'}{/block}

        {* Third Step - Confirmation *}
        {block name='frontend_register_steps_confirm'}
            <li class="step-confirm {if $sStepActive=='finished'}active{/if}">
                <a href="{url controller=checkout action=confirm}" title="{s name='CheckoutStepConfirmText'}{/s}">
                    {s name="CheckoutStepConfirmText"}{/s}
                </a>
            </li>
        {/block}
    </ul>
{/block}