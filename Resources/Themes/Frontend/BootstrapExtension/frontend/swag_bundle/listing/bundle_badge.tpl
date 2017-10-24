{if $sArticle.attributes.swag_bundle && {config name=SwagBundleShowBundleIcon} && $Controller != 'Bundle'}
    <span class="label label-info price-saving img-label">
		{block name='frontend_bundle_listing_badge_content'}
            <span>{s name="bundleBadge" namespace="frontend/listing/bundle"}BUNDLE{/s}</span>
        {/block}
    </span>
{/if}