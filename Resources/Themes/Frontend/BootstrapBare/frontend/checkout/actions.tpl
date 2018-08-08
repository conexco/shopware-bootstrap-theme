{block name='frontend_checkout_cart_table_actions_inner'}
	<div class="col-sm-6 text-right text-sm-left">
	    {* Contiune shopping *}
        {block name="frontend_checkout_actions_link_last"}{/block}

	    {if $bottom && !$sMinimumSurcharge && ($sInquiry || $sDispatchNoOrder)}
	        {block name="frontend_checkout_actions_inquiry"}
				<a href="{$sInquiryLink}" title="{s name='CheckoutActionsLinkOffer'}{/s}" class="btn btn-outline-secondary mb-2">{s name="CheckoutActionsLinkOffer"}{/s}</a>
	        {/block}
	    {/if}
	</div>
    <div class="col-sm-6 text-right">
        {* Checkout *}
        {block name="frontend_checkout_actions_confirm"}
            <a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}" title="{"{s name='CheckoutActionsLinkProceed'}{/s}"|escape}" class="btn btn-primary mb-2" {if $sMinimumSurcharge && $sDispatchNoOrder}disabled="disabled"{/if} >
	            {s name="CheckoutActionsLinkProceed"}{/s}
            </a>
        {/block}
    </div>
{/block}
