{if $sDispatches}
        <div>
            <form method="POST" action="{url action='calculateShippingCosts' sTargetAction=$sTargetAction}">
                <p><strong>{s name='CheckoutDispatchHeadline'}Versandart{/s}: </strong><span>{$sDispatch.name}</span></p>
                <div data-equal="paymentrow">
                    {if $sDispatches|count>1}
                        {foreach from=$sDispatches item=dispatch name=dispatches}
                            {block name='frontend_checkout_dispatch_fieldset_input_radio'}
                                <div>
                                    <label for="confirm_dispatch{$dispatch.id}">
                                        <input id="confirm_dispatch{$dispatch.id}" type="radio" data-auto-submit="true" value="{$dispatch.id}" name="sDispatch" {if $dispatch.id eq $sDispatch.id}checked="checked"{/if} />
                                        {$dispatch.name}
                                      </label>
                                </div>
                            {/block}

                            {block name='frontend_checkout_dispatch_fieldset_description'}
                                {if $dispatch.description}
                                    <span class="text-muted">{$dispatch.description}</span>
                                {/if}
                            {/block}
                        {/foreach}
                    {else}
                        {block name='frontend_checkout_dispatch_fieldset_input_radio'}
                            <p><strong>{$sDispatch.name}</strong></p>
                        {/block}

                        {block name='frontend_checkout_dispatch_fieldset_description'}
                            {if $sDispatch.description}
                                <span class="text-muted">{$sDispatch.description}</span>
                            {/if}
                        {/block}
                    {/if}
                </div>
            </form>
        </div>
{/if}
