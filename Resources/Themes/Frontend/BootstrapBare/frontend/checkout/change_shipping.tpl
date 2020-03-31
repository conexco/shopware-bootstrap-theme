{block name='frontend_checkout_shipping_headline'}
    <h2>{s namespace='frontend/checkout/shipping_payment' name='ChangeShippingTitle'}{/s}</h2>
{/block}

{block name='frontend_checkout_shipping_content'}
    {foreach $sDispatches as $dispatch}
        {block name="frontend_checkout_dispatch_container"}
            <div class="dispatch-method dispatch--method{if $dispatch@last} method_last{else} method{/if} block">
                {* Method Name *}
                {block name='frontend_checkout_dispatch_shipping_input_label'}
                    <div class="radio">
                        <label for="confirm_dispatch{$dispatch.id}">
                            {* Radio Button *}
                            {block name='frontend_checkout_dispatch_shipping_input_radio'}
                                <div class="method--input">
                                    <input type="radio" id="confirm_dispatch{$dispatch.id}" class="radio auto_submit" value="{$dispatch.id}" name="sDispatch"{if $dispatch.id eq $sDispatch.id} checked="checked"{/if} />
                                </div>
                            {/block}
                            {$dispatch.name}
                        </label>
                    </div>
                {/block}

                {* Method Description *}
                {block name='frontend_checkout_shipping_fieldset_description'}
                    {if $dispatch.description}
                        <span class="help-block">
                            {$dispatch.description}
                        </span>
                    {/if}
                {/block}
            </div>
        {/block}
    {/foreach}

    {* Actions *}
    {block name="frontend_checkout_shipping_action_buttons"}
        <input type="hidden" class="agb-checkbox" name="sAGB" value="{if $sAGBChecked}1{else}0{/if}" />
    {/block}
{/block}
