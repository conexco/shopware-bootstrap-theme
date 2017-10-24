{extends file="parent:frontend/checkout/ajax_cart.tpl"}

{block name="frontend_checkout_ajax_cart_alert_box_used_promotions"}
    {if $promotionsUsedTooOften}
        {include file="frontend/swag_promotion/checkout/used_too_often_offcanvas.tpl"}
    {/if}
    {if $promotionsDoNotMatch}
        {include file="frontend/swag_promotion/checkout/does_not_match_offcanvas.tpl"}
    {/if}
{/block}
{* Not in use because no space in popover *}
{if !empty($freeGoods)}
    {block name="frontend_checkout_ajax_cart_alert_box_promotion"}
        {include file="frontend/swag_promotion/checkout/free_goods.tpl"}
    {/block}
{/if}
