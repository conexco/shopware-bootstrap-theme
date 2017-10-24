{block name = "swag_bundle_product_image_badge"}
    {if $sBasketItem.attribute.bundleId > 0}
        <div class="label-container">
            <span class="label label-info img-label">
                {s name="bundleBadge" namespace="frontend/listing/bundle"}BUNDLE{/s}
            </span>
        </div>
    {/if}
{/block}
