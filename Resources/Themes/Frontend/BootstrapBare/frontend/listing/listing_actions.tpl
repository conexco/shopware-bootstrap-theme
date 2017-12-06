{* Listing actions *}
{block name='frontend_listing_actions_top'}
    {$listingMode = {config name=listingMode}}
    {* Selected Filter Properties List *}
    {block name="frontend_listing_actions_top_wrapper"}
        <div class="listing-actions"
             data-listing-actions="true"
             {if $listingMode != 'full_page_reload'}
                data-bufferTime="0"
             {/if}>
            <div class="row">
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
                        <div class="row mbm">
                            <div class="col-xs-12 col-sm-4">
                                <div class="sidebar-filter-offcanvas d-sm-none">
                                    <a href="#"
                                       class="btn btn-default btn-block"
                                       data-offcanvas="true"
                                       data-offCanvasSelector="#sidebarFilterOffcanvas"
                                       data-filter-trigger="true">
                                        <i class="fa fa-filter"></i>
                                        {s name='ListingFilterButton'}{/s}
                                        <span class="action-collapse-icon text-primary sw5-plugin float-right"></span>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    {else}
                        <div class="panel panel-default">
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
