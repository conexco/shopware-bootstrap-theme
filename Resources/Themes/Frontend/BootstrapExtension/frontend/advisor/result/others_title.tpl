{block name="frontend_advisor_listing_others_title_ct"}
    <div class="listing-advisor-result"
         data-advisor-listing="true"
         data-listingContainerSelector=".listing-ct--advisor-result"
        {if $theme.infinite-scrolling}
            data-infinite-scrolling="true"
            data-loadPreviousSnippet="{s name="ListingActionsLoadPrevious" namespace="frontend/listing/listing"}{/s}"
            data-loadMoreSnippet="{s name="ListingActionsLoadMore" namespace="frontend/listing/listing"}{/s}"
            data-categoryId="1"
            data-pages="{$pages}"
            data-threshold="{$theme.infiniteThreshold}"
            data-ajaxUrl="{url controller=advisor action=ajaxResult advisorParams=$advisorParams}"
        {/if}>
    <div class="advisor-others-title sw5-plugin col-xs-12">
        {block name="frontend_advisor_listing_others_title_inner"}
            <h4 class="others-title-inner page-header">
                {$advisor['remainingPostsTitle']|truncate:80}
            </h4>
        {/block}
    </div>
{/block}