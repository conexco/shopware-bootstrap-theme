{extends file="parent:frontend/checkout/shipping_payment_core.tpl"}

{block name="frontend_checkout_footer"}
    {$smarty.block.parent}
    <div class="pp-approval-url d-none">{$PaypalPlusApprovalUrl}</div>
{/block}