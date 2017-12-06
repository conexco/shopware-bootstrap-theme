{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_header"}
    <div class="panel-header">
        {block name="frontend_listing_actions_filter_button"}
            <a href="#FilterContainer"
               class="btn btn-secondary mam collapsed"
               role="button"
               data-toggle="collapse"
               aria-expanded="false"
               aria-controls="FilterContainer">
                <i class="fa fa-filter"></i>
                {s name='ListingFilterButton'}{/s}
                <i class="fa fa-angle-down"></i>
            </a>
        {/block}
    </div>
{/block}
