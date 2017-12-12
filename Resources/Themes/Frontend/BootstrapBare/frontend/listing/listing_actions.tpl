{* Listing actions *}
{block name='frontend_listing_actions_top'}
    {$listingMode = {config name=listingMode}}

    {block name="frontend_listing_actions_top_wrapper"}
        <div class="listing-actions {block name='frontend_listing_actions_class'}{/block}"
             data-listing-actions="true"
             {if $listingMode != 'full_page_reload'}
                data-bufferTime="0"
             {/if}>

            <div class="row justify-content-between">
                {* Order by selection *}
                {block name='frontend_listing_actions_sort'}
                    {include file="frontend/listing/actions/action-sorting.tpl"}
                {/block}

                {* Products per page selection *}
                {block name='frontend_listing_actions_items_per_page'}
                    {include file="frontend/listing/actions/action-per-page.tpl"}
                {/block}
            </div>

            {block name="frontend_listing_actions_spacer"}
                <hr/>
            {/block}

            {block name="frontend_listing_actions_filter_wrapper"}
                {if $facets|count > 0}
                    {if $theme.sidebarFilter}
                        <div class="sidebar-filter-offcanvas d-md-none">
                            <button class="btn btn-outline-secondary btn-block mb-3 d-flex justify-content-between align-items-center"
                               data-offcanvas="true"
                               data-offCanvasSelector="#sidebarFilterOffcanvas"
                               data-filter-trigger="true">
                               
                               <span class="filter-text">
                                    <i class="fa fa-filter"></i>
                                    {s name='ListingFilterButton'}{/s}
                                    <i class="fa fa-angle-right"></i>
                                </span>

                                <span class="badge badge-secondary float-right action-collapse-icon sw5-plugin"></span>
                            </bitton>
                        </div>
                    {else}
                        <div class="card">
                            {* Filter action button *}
                            {block name="frontend_listing_actions_filter"}
                                {include file="frontend/listing/actions/action-filter-button.tpl"}
                            {/block}

                            {* Filter options *}
                            {block name="frontend_listing_actions_filter_options"}
                                {include file="frontend/listing/actions/action-filter-panel.tpl"}
                            {/block}
                        </div>
                    {/if}
                {/if}
            {/block}
        </div>
    {/block}

    {* Listing pagination *}
    {block name='frontend_listing_actions_paging'}
        {include file="frontend/listing/actions/action-pagination.tpl"}
    {/block}

    {block name="frontend_listing_actions_close"}{/block}
{/block}
