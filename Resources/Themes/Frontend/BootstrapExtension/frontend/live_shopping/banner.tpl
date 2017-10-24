{* Live Shopping banner *}
{block name="frontend_listing_banner"}
    {if $listingBanner}
        {block name='frontend_listing_image_only_banner'}
            <img class="img-responsive mbl"
                 alt="{s name="emotionLiveshoppingHeader" namespace="frontend/live_shopping/main"}{/s}"
                 src="{$listingBanner}"/>
        {/block}
    {/if}
{/block}