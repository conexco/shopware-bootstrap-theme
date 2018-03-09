{extends file="frontend/index/index.tpl"}

{* Hide sidebar left *}
{block name="gridconfig"}
    {assign var="grid" value="g010"}
    {$smarty.block.parent}
{/block}
{block name='frontend_index_content_left'}{/block}

{* Shop header *}
{block name='frontend_index_navigation'}
    {* makes it possible to override checkout header in custom theme *}
    {block name='frontend_index_navigation_checkout_header_include'}
        {$includeCheckoutHeader = $theme.checkoutHeader}
    {/block}

    {if !$includeCheckoutHeader}
        {$smarty.block.parent}
    {else}
        {include file="frontend/checkout/header.tpl"}
    {/if}
{/block}

{* Footer *}
{block name="frontend_index_footer"}
    {if !$theme.checkoutFooter}
        {$smarty.block.parent}
    {else}
        {block name="frontend_index_checkout_shipping_payment_footer"}
            {include file="frontend/index/footer_minimal.tpl"}
        {/block}
    {/if}
{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Step box *}
{block name='frontend_index_content_top'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
	{include file="frontend/register/steps.tpl" sStepActive="paymentShipping"}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div data-ajax-shipping-payment="true">
        {include file="frontend/checkout/shipping_payment_core.tpl"}
    </div>
{/block}