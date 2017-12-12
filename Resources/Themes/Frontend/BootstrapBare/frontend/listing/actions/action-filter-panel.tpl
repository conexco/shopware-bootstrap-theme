{namespace name="frontend/listing/listing_actions"}

{block name='frontend_listing_actions_filter'}
    {$listingMode = {config name=listingMode}}

    {block name='frontend_listing_actions_filter_container'}
        <div class="filter-container">

            {block name='frontend_listing_actions_filter_close_button'}
                <span class="sidebar-offcanvas-close d-none"
                      data-show-products-text="{s name='ListingActionsCloseFilterShowProducts'}{/s}">
                    {s name="OffcanvasCloseMenuLink"}{/s}
                </span>
            {/block}

            {block name='frontend_listing_actions_filter_form'}
                <form id="filter"
                      method="get"
                      data-filter-form="true"
                      data-is-in-sidebar="{if $theme.sidebarFilter}true{else}false{/if}"
                      data-listing-url="{$countCtrlUrl}"
                      data-is-filtered="{if $criteria}{$criteria->getUserConditions()|count}{else}0{/if}"
                      data-load-facets="{if $listingMode == 'filter_ajax_reload'}true{else}false{/if}"
                      data-instant-filter-result="{if $listingMode != 'full_page_reload'}true{else}false{/if}"
                      class="{if $listingMode != 'full_page_reload'}is-instant-filter{/if}">

                    {if $listingMode === 'full_page_reload'}
                        {include file="frontend/listing/actions/filter-apply-button.tpl" 
                                 clsSuffix='filter-actions-top d-sm-none'}
                    {/if}

                    {block name="frontend_listing_actions_filter_form_page"}
                        <input type="hidden" 
                               name="{$shortParameters['sPage']}" 
                               value="1"/>
                    {/block}

                    {block name="frontend_listing_actions_filter_form_search"}
                        {if $term}
                            <input type="hidden" 
                                   name="{$shortParameters['sSearch']}" 
                                   value="{$term}"/>
                        {/if}
                    {/block}

                    {block name="frontend_listing_actions_filter_form_sort"}
                        {if $sSort}
                            <input type="hidden" 
                                   name="{$shortParameters['sSort']}" 
                                   value="{$sSort|escape}"/>
                        {/if}
                    {/block}

                    {block name="frontend_listing_actions_filter_form_perpage"}
                        {if $criteria && $criteria->getLimit()}
                            <input type="hidden" 
                                   name="{$shortParameters['sPerPage']}"
                                   value="{$criteria->getLimit()|escape}"/>
                        {/if}
                    {/block}

                    {block name="frontend_listing_actions_filter_form_category"}
                        {if !$sCategoryContent && 
                            $sCategoryCurrent != $sCategoryStart 
                            && {controllerName} != 'search'}
                            <input type="hidden" 
                                   name="{$shortParameters['sCategory']}"
                                   value="{$sCategoryCurrent|escape}"/>
                        {/if}
                    {/block}

                    {block name="frontend_listing_actions_filter_form_facets"}
                        <div class="action-filter-options sw5-plugin{if !$theme.sidebarFilter} collapse{/if}{if $listingMode != 'full_page_reload'} is-ajax-reload{/if}">
                            <div class="filter-panel-container{if !$theme.sidebarFilter} row{/if}">
                                {include file="frontend/listing/actions/action-filter-facets.tpl" facets=$facets}
                            </div>
                        </div>
                    {/block}

                    {block name="frontend_listing_actions_filter_active_filters"}
                        <div class="filter-active-container sw5-plugin"
                             data-reset-label="{s name='ListingFilterResetAll'}{/s}"></div>
                    {/block}

                    {if $listingMode === 'full_page_reload'}
                        {include file="frontend/listing/actions/filter-apply-button.tpl" clsSuffix='filter-actions-bottom'}
                    {/if}
                </form>
            {/block}
        </div>
    {/block}
{/block}
