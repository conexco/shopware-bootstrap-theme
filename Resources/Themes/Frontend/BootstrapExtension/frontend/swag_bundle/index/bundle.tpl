{block name = "swag_bundle_detail_bundle"}
    {if !$sShowBundleBelowDesc}
        <br>
        {if $sBundles}
            {foreach $sBundles as $bundle}
                <form class="bundle-form" method="POST" action="{url controller=Bundle action=addBundleToBasket bundleId=$bundle.id forceSecure}">
                    {include file="frontend/swag_bundle/bundle/bundle.tpl" bundle=$bundle longestShippingTimeArticle=$bundle.longestShippingTimeArticle}
                </form>
            {/foreach}
        {/if}
        {if $sBundlesButNotForThisVariant}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s namespace="frontend/detail/bundle" name="NotForThisVariant"}No bundles available for the selected variant.{/s}"}
        {/if}
    {/if}
{/block}
