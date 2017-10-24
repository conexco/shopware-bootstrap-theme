{if $sBasketItem.swagLiveShoppingId > 0 && !$sBasketItem.attribute.bundleId}
    <span class="label-container">
        <span class="label label-danger price-saving img-label">
            {s name="cartBadgeText" namespace="frontend/checkout/main"}LIVE{/s}
        </span>
    </span>
{/if}