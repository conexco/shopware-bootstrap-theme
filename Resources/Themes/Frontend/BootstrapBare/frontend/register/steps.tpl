{* Step box *}
{block name='frontend_register_steps'}
    <ul class="nav nav-tabs nav-justified mbl hidden-sm hidden-xs">
        {block name='frontend_register_steps_basket'}
            <li class="step-basket {if $sStepActive=='address'}active{else}disabled{/if}">              
                <a>{s name="CheckoutStepAddressText"}{/s}</a>
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer1'}{/block}

        {* Second Step - Payment *}
        {block name='frontend_register_steps_register'}
            <li class="step-register {if $sStepActive=='paymentShipping'}active{else}disabled{/if}">
                <a>{s name="CheckoutStepPaymentShippingText"}{/s}</a>
            </li>
        {/block}

        {* Spacer *}
        {block name='frontend_register_steps_spacer2'}{/block}

        {* Third Step - Confirmation *}
        {block name='frontend_register_steps_confirm'}
            <li class="step-confirm {if $sStepActive=='finished'}active{else}disabled{/if}">
                <a>{s name="CheckoutStepConfirmText"}{/s}</a>
            </li>
        {/block}
    </ul>
{/block}