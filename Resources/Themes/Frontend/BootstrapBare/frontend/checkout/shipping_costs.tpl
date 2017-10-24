<form id="recalcShipping" method="POST" class="form-horizontal mtl" action="{url action='calculateShippingCosts' sTargetAction=$sTargetAction}">
    <legend>{s name="ShippingHeader"}{/s}</legend>
    {* Delivery country *}
    {block name='frontend_checkout_shipping_costs_country'}
        <div class="form-group">
            {block name='frontend_checkout_shipping_costs_country_label'}
                <label for="basket_country_list" class="{$FormLabelSize} control-label">{s name="ShippingLabelDeliveryCountry"}{/s}</label>
            {/block}

            {block name='frontend_checkout_shipping_costs_country_selection'}
                <div class="{$FormInputSize} ">
                    <select id="basket_country_list" name="sCountry" class="form-control" data-auto-submit="true">
                        {foreach from=$sCountryList item=country}
                            <option value="{$country.id}" {if $country.id eq $sCountry.id}selected{/if}>
                                {$country.countryname}
                            </option>
                        {/foreach}
                    </select>
                </div>
            {/block}
        </div>

        {* County state selection *}
        {block name='frontend_checkout_shipping_costs_state'}
            {foreach $sCountryList as $country}
                {if $country.states}
                    <div class="form-group {if $country.id != $sCountry.id}hidden{/if}">
                        {block name='frontend_checkout_shipping_costs_state_label'}
                            <label for="country_{$country.id}_states" class="{$FormLabelSize} control-label">{s name='RegisterBillingLabelState'}{/s}</label>
                        {/block}

                        {block name='frontend_checkout_shipping_costs_state_selection'}
                            <div class="{$FormInputSize} ">
                                <select {if $country.id != $sCountry.id}disabled="disabled"{/if} name="sState" id="country_{$country.id}_states" class="form-control" data-auto-submit="true">
                                    <option value="" selected="selected">{s name='StateSelection'}{/s}</option>
                                    {foreach from=$country.states item=state}
                                        <option value="{$state.id}" {if $state.id eq $sState.id || $state.id eq $sState}selected="selected"{/if}>
                                            {$state.name}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        {/block}
                    </div>
                {/if}
            {/foreach}
        {/block}
    {/block}

    {* Payment method *}
    {block name='frontend_checkout_shipping_costs_payment'}
        <div class="form-group">
            {block name='frontend_checkout_shipping_costs_payment_label'}
                <label for="basket_payment_list" class="{$FormLabelSize} control-label">{s name="ShippingLabelPayment"}{/s}</label>
            {/block}

            {block name='frontend_checkout_shipping_costs_payment_selection'}
                <div class="{$FormInputSize} ">
                    <select id="basket_payment_list" name="sPayment" class="form-control" data-auto-submit="true">
                        {foreach from=$sPayments item=payment}
                            <option value="{$payment.id}" {if $payment.id eq $sPayment.id}selected{/if}>
                                {$payment.description}
                            </option>
                        {/foreach}
                    </select>
                </div>
            {/block}
        </div>
    {/block}

    {* Dispatch method *}
    {block name='frontend_checkout_shipping_costs_dispatch'}
        <div class="form-group">
            {block name='frontend_checkout_shipping_costs_dispatch_label'}
                <label for="basket_dispatch_list" class="{$FormLabelSize} control-label">{s name="ShipppingLabelDispatch"}{/s}</label>
            {/block}

            {block name='frontend_checkout_shipping_costs_dispatch_selection'}
                <div class="{$FormInputSize}">
                    <select id="basket_dispatch_list" name="sDispatch" class="form-control" data-auto-submit="true">
                        {if $sDispatches}
                            {foreach from=$sDispatches item=dispatch}
                                <option value="{$dispatch.id}" {if $dispatch.id eq $sDispatch.id}selected{/if}>
                                    {$dispatch.name}
                                </option>
                            {/foreach}
                        {/if}
                    </select>
                </div>
            {/block}
        </div>
    {/block}
</form>

{* Dispatch notice *}
{block name='frontend_checkout_shipping_costs_dispatch_notice'}
    {if $sDispatch.description}
        {include file="frontend/_includes/messages.tpl" type="info" content=$sDispatch.description}
    {/if}
{/block}
