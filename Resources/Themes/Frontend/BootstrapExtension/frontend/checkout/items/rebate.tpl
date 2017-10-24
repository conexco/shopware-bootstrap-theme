{extends file='parent:frontend/checkout/items/rebate.tpl'}

{* Delete Vocuher-Promo *}
 {block name='frontend_checkout_cart_item_rebate_tax_price' append}
    {block name="frontend_checkout_cart_item_rebate_total_sum_promotion"}
        {include file="frontend/swag_promotion/checkout/items/total_sum.tpl"}
    {/block}
{/block}
