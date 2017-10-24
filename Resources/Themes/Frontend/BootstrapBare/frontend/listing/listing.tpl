{* Emotion worlds *}
{block name="frontend_listing_list_promotion"}
    {if $hasEmotion}
        {$fullscreen = false}

        {block name="frontend_listing_emotions"}
            <div class="content-emotions">

                {foreach $emotions as $emotion}
                    {if $emotion.fullscreen == 1}
                        {$fullscreen = true}
                    {/if}

                    <div class="emotion-wrapper sw5-plugin"
                         data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                         data-availableDevices="{$emotion.devices}">
                    </div>
                {/foreach}

                {block name="frontend_listing_list_promotion_link_show_listing"}
                    {$showListingCls = "emotion-show-listing"}

                    {foreach $showListingDevices as $device}
                        {$showListingCls = "{$showListingCls} hidden-{$emotionViewports[$device]}"}
                    {/foreach}

                    <div class="{$showListingCls} text-center sw5-plugin">
                        <a href="{url controller='cat' sPage=1 sCategory=$sCategoryContent.id}" title="{$sCategoryContent.name|escape}" class="btn btn-primary mbm">
                            {s name="ListingActionsOffersLink"}Weitere Artikel in dieser Kategorie &raquo;{/s}
                        </a>
                    </div>
                {/block}
            </div>
        {/block}
    {/if}
{/block}

{* Listing wrapper *}
{block name="frontend_listing_listing_wrapper"}
    {if $showListing}

        {$listingCssClass = "listing-wrapper"}

        {foreach $showListingDevices as $device}
            {$listingCssClass = "{$listingCssClass} visible-{$emotionViewports[$device]}"}
        {/foreach}

        {if $theme.sidebarFilter}
            {$listingCssClass = "{$listingCssClass} has-sidebar-filter"}
        {/if}

        <div class="{$listingCssClass} sw5-plugin{if !$showListing} hidden{/if}">
            {* Sorting and changing layout *}
            {block name="frontend_listing_top_actions"}
                {include file='frontend/listing/listing_actions.tpl'}
            {/block}

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
                                <div class="col-xs-12">
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
                {include file="frontend/listing/actions/action-pagination.tpl"}
            {/block}
        </div>
    {/if}
{/block}
