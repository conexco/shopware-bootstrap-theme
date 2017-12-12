{* Sorting and changing layout *}
{block name="frontend_listing_top_actions"}
    {* Count of available product pages *}
    {$pages = 1}

    {if $criteria}
        {$pages = ceil($sNumberArticles / $criteria->getLimit())}
    {/if}

    {* Layout for the product boxes *}
    {$productBoxLayout = 'basic'}

    {if $sCategoryContent.productBoxLayout !== null && $sCategoryContent.productBoxLayout !== 'extend'}
        {$productBoxLayout = $sCategoryContent.productBoxLayout}
    {/if}

    {$countCtrlUrl = "{url module="widgets" controller="listing" action="listingCount" params=$ajaxCountUrlParams fullPath}"}

    {include file='frontend/listing/listing_actions.tpl'}
{/block}

{if $theme.sidebarFilter}
    <div class="sidebar-filter--loader sw5-plugin">
        {include file="frontend/listing/actions/action-filter-panel.tpl"}
    </div>
{/if}

{block name="frontend_listing_listing_container"}
    <div class="listing-container">

        {block name="frontend_listing_no_filter_result"}
            <div class="listing-no-filter-result">
                {include file="frontend/_includes/messages.tpl" type="info" content="{s name=noFilterResult}Für die Filterung wurden keine Ergebnisse gefunden!{/s}" visible=false}
            </div>
        {/block}

        {block name="frontend_listing_listing_content"}
            <div class="row listing" data-compare-ajax="true" data-ajax-wishlist="true">
                {if $sArticles|@count > 0}
                    <ul class="thumbnails list-unstyled"
                        data-equalheight="true"
                        {if $theme['infinite-scrolling']}
                            data-infinite-scrolling="true"
                            data-loadPreviousSnippet="{s name="ListingActionsLoadPrevious"}{/s}"
                            data-loadMoreSnippet="{s name="ListingActionsLoadMore"}{/s}"
                            data-categoryId="{$sCategoryContent.id}"
                            data-pages="{$pages}"
                            data-threshold="{$theme['infinite-threshold']}"
                        {/if}>
                        {* Actual listing *}
                        {block name="frontend_listing_list_inline"}
                            {foreach $sArticles as $sArticle}
                                {include file="frontend/listing/box_article.tpl"}
                            {/foreach}
                        {/block}
                    </ul>
                {else}
                    <div class="col-12">
                        <div class="text-center">
                            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='ListingInfoNoArticles'}Keine Artikel gefunden{/s}"}
                        </div>
                    </div>
                {/if}
            </div>
        {/block}
    </div>
{/block}

{* Paging *}
{block name="frontend_listing_bottom_paging"}
    <div class="listing-bottom-paging">
        {include file="frontend/listing/actions/action-pagination.tpl"}
    </div>
{/block}
