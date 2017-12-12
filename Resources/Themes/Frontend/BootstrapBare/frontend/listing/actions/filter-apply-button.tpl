{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_submit_button"}
    <div class="filter-actions{if $clsSuffix} {$clsSuffix}{/if}">
        <button type="submit"
                class="btn btn-primary filter-btn-apply sw5-plugin{if $filterBtn} {$filterBtn}{/if}"
                disabled="disabled">
            <span class="filter-count sw5-plugin"></span>
            {s name="ListingFilterApplyButton"}{/s}
            <i class="fa fa-refresh ml-2"></i>
        </button>
     </div>
{/block}
