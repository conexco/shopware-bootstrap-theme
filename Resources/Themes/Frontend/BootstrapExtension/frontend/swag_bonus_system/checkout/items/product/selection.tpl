{if (($sBonusSystem.points.remaining + $sBasketItem.required_points) / $sBasketItem.points_per_unit) >= 1}
    <select name="sQuantity" class="form-control" data-auto-submit="true">
        {section name="i" start=1 loop=($sBonusSystem.points.remaining + $sBasketItem.required_points)  / $sBasketItem.points_per_unit + 1 max=1000 step=1}
            <option value="{$smarty.section.i.index}" {if $smarty.section.i.index==$sBasketItem.quantity}selected="selected"{/if}>
                {$smarty.section.i.index}
            </option>
        {/section}
    </select>
{else}
    {s name="CartColumnQuantityEmpty" namespace="frontend/checkout/cart_item"}-{/s}
{/if}