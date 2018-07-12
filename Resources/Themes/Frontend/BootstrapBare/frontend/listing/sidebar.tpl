{extends file="frontend/index/sidebar.tpl"}

{block name="frontend_index_sidebar"}
    {if $theme.sidebarFilter}
        <div id="sidebarFilterOffcanvas">
            <div class="buttons-off-canvas{if $class} {$class}{else} offcanvas-default{/if}">
                {block name='frontend_listing_sidebar_offcanvas_inner'}
                    <a href="#" title="{"{s name="OffcanvasCloseMenuLink"}Menü schließen{/s}"|escape}"
                       class="close-off-canvas sw5-plugin">
                        <i class="fa fa-angle-left"></i>
                        <span class="sidebar-offcanvas-close"
                              data-show-products-text="{s name="ListingActionsCloseFilterShowProducts" namespace="frontend/listing/listing_actions"}{/s}">
                            {s name="OffcanvasCloseMenuLink"}{/s}
                        </span>
                    </a>
                {/block}
            </div>

            {block name='frontend_listing_sidebar'}
                <div class="listing-sidebar mt-3 mt-md-0">
                    {$smarty.block.parent}

                    <div class="card sidebar-filter">
                        {* TODO: check if container with js class really needed *}
                        <div class="card-body sidebar-filter--content sw5-plugin">
                            {include file="frontend/listing/actions/action-filter-panel.tpl" filterBtn='btn-block'}
                        </div>
                    </div>
                </div>
            {/block}
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
