{extends file='frontend/checkout/cart_header.tpl'}

{* Hide the price by unit *}
{block name='frontend_checkout_cart_header_price'}{/block}

{* Article tax *}
{block name='frontend_checkout_cart_header_tax'}
    <div class="col-sm-2 text-right">
        {if $sUserData.additional.charge_vat && !$sUserData.additional.show_net}
            {s name='CheckoutColumnExcludeTax'}{/s}
        {elseif $sUserData.additional.charge_vat}
            {s name='CheckoutColumnTaxFix'}MwSt.{/s}
        {else}&nbsp;{/if}
    </div>
{/block}
