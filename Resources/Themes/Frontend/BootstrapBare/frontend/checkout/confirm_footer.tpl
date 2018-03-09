{extends file='frontend/checkout/cart_footer.tpl'}

{block name='frontend_checkout_cart_footer_tax_information'}
	{$smarty.block.parent}
    {if !$sUserData.additional.charge_vat && {config name=nettonotice}}
        <p>{s name='CheckoutFinishTaxInformation'}{/s}</p>
    {/if}

    {if {config name=countrynotice} && $sCountry.notice && {include file="string:{$sCountry.notice}"} !== ""}
        {* Include country specific notice message *}
        <p>{include file="string:{$sCountry.notice}"}</p>
    {/if}
{/block}

{block name='frontend_checkout_cart_footer_add_product'}{/block}

{block name='frontend_checkout_cart_footer_add_voucher'}{/block}



