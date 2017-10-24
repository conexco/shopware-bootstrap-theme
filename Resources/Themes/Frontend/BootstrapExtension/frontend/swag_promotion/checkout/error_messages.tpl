{namespace name="frontend/swag_promotion/main"}
{if $voucherExpired}
    {block name="frontend_checkout_error_messages_voucher_error_promotion_expired"}
        {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace='frontend/swag_promotion/main' name='voucherExpired'}{/s}"}
    {/block}
{/if}
{if $voucherNotCombined}
    {block name="frontend_checkout_error_messages_voucher_error_voucher_not_combined"}
        {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace='frontend/swag_promotion/main' name='voucherNotCombined'}{/s}"}
    {/block}
{/if}
{if $voucherPromotionId}
    {if in_array($voucherPromotionId, $availablePromotions)}
        {block name="frontend_checkout_error_messages_voucher_error_promotion_added"}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s namespace='frontend/swag_promotion/main' name='promotionActivated'}{/s}"}
        {/block}
    {else}
        {block name="frontend_checkout_error_messages_voucher_error_promotion_addedNotActive"}
            {include file="frontend/_includes/messages.tpl" type="warning" content="{s namespace='frontend/swag_promotion/main' name='voucherAddedButNotActive'}{/s}"}
        {/block}
    {/if}
{/if}
