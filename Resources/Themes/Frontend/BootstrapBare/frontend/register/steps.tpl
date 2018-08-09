{* Step box *}
{block name='frontend_register_steps'}
    <div class="d-none d-md-flex flex-column mb-5 py-3 border-bottom">
        <ul class="nav nav-pills d-none d-md-flex justify-content-center py-3">
            {block name='frontend_register_steps_basket'}
                <li class="nav-item">
                    {if $sStepActive == 'paymentShipping' || $sStepActive == 'finished'}
                        <span class="nav-link disabled">{s name="CheckoutStepAddressText"}{/s}</span>
                    {else}
                        <a class="nav-link {if $sStepActive == 'address'}btn btn-sm btn-outline-primary{/if}"
                           href="{url controller=checkout action=confirm}"
                           title="{s name='CheckoutStepAddressText'}{/s}">
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
                    <a class="nav-link {if $sStepActive == 'paymentShipping'}btn btn-sm btn-outline-primary{/if}"
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
                    <a class="nav-link {if $sStepActive == 'finished'}btn btn-sm btn-outline-primary{/if}"
                       href="{url controller=checkout action=confirm}" title="{s name='CheckoutStepConfirmText'}{/s}">
                        {s name="CheckoutStepConfirmText"}{/s}
                    </a>
                </li>
            {/block}
        </ul>
        {*Progress Bar*}
        {block name='frontend_register_steps_progress'}
            <div class="progress" style="height: 5px;">
                <div class="progress-bar {if $sStepActive == 'address'}w-25
                                         {elseif $sStepActive == 'paymentShipping'}w-50
                                         {elseif $sStepActive == 'finished'}w-75
                                         {/if}"
                     role="progressbar"
                     aria-valuenow="{if $sStepActive == 'address'}25
                                    {elseif $sStepActive == 'paymentShipping'}50
                                    {elseif $sStepActive == 'finished'}75
                                    {/if}"
                     aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        {/block}
    </div>
{/block}