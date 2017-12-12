{namespace name="frontend/listing/box_article"}

<div class="unit-wrapper" data-equal="unit">
    {block name='frontend_listing_box_article_unit_inner'}
        {if $sArticle.purchaseunit && $sArticle.purchaseunit != 0}
            <p class="price-unit small">
                <strong>{s name="ListingBoxArticleContent"}Inhalt{/s}:</strong> {$sArticle.purchaseunit} {$sArticle.sUnit.description}
                {if $sArticle.referenceunit && 
                    $sArticle.sUnit.description && 
                    $sArticle.purchaseunit != $sArticle.referenceunit}
                    ({$sArticle.referenceprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s} / {$sArticle.referenceunit} {$sArticle.sUnit.description})
                {/if}
            </p>
        {/if}
    {/block}
</div>