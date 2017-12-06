{block name="frontend_advisor_listing_wizard_actions"}
    {if $advisor['mode'] === 'wizard_mode'}
        <div class="row">
            <div class="col-12 col-hd-4 col-lg-2 mbm mbn-lg">
                {block name="frontend_advisor_listing_wizard_actions_last_question"}
                    <a href="{$advisor['lastQuestionUrl']}" class="btn btn-default btn-block">
                        {s name="LastQuestionBtnText" namespace="frontend/advisor/main"}Return to last question{/s}
                    </a>
                {/block}
            </div>
            <div class="col-12 col-hd-4 col-lg-2">
                {block name="frontend_advisor_listing_wizard_actions_reset"}
                    <a class="btn btn-default btn-block" title="{s name="ResetAdvisorBtnText" namespace="frontend/advisor/main"}Reset advisor{/s}" href="{$advisorResetUrl}">
                        {s name="ResetAdvisorBtnText" namespace="frontend/advisor/main"}Reset advisor{/s}
                    </a>
                {/block}
            </div>
        </div>
    {/if}
{/block}

<div id="advisor-listing-container sw5-plugin" class="advisor-listing"
     data-ajax-wishlist="true"
     data-compare-ajax="true"
     data-advisor-result="true">
    {$topHit = $advisor['topHit']}
    {if $topHit}
        {* Tophit container *}
        {block name="frontend_advisor_listing_tophit"}
            <div class="advisor-tophit">
                {if $advisor['topHitTitle']|trim}
                    {block name="frontend_advisor_listing_tophit_title"}
                        <h4 class="advisor-listing-title page-header">
                            {$advisor['topHitTitle']|truncate:80}
                        </h4>
                    {/block}
                {/if}
                {* Display the tophit equal to the chosen listing-layout *}
                <div class="row">
                    <ul class="list-unstyled">
                        {if $advisor['listingLayout'] == 'show_matches'}
                            {* Tophit StepByStep *}
                            {block name="frontend_advisor_listing_tophit_hits"}
                                {include file="frontend/swag_product_advisor/listing/product-box/box-hits.tpl" product=$topHit sArticle=$topHit productBoxLayout='advisor-tophit'  sTemplate="list"}
                            {/block}
                        {elseif $advisor['listingLayout'] == 'show_matches_and_misses'}
                            {block name="frontend_advisor_listing_tophit_hits_misses"}
                                {include file="frontend/swag_product_advisor/listing/product-box/box-misses.tpl" product=$topHit sArticle=$topHit productBoxLayout='advisor-tophit' size="col-12"}
                            {/block}
                        {else}
                            {block name="frontend_advisor_listing_tophit_basic"}
                                {include file="frontend/listing/product-box/box-basic.tpl" sArticle=$topHit productBoxLayout='advisor-tophit' size="col-12"}
                            {/block}
                        {/if}
                    </ul>
                </div>
            </div>
        {/block}
    {/if}

    {block name="frontend_advisor_listing_container"}
        {if $advisor['result']}
            <div class="advisor-listing-wrapper">
                {block name="frontend_advisor_listing_title"}
                    <h4 class="advisor-listing-title page-header">
                        {$othersTitle = $advisor['othersTitle']}
                        {$replaceTitle = $othersTitle.replaceTitle}
                        {if $replaceTitle}
                            {block name="frontend_advisor_listing_title_others"}
                                <span class="main-title-others sw5-plugin">
                                    {$advisor['remainingPostsTitle']}
                                </span>
                            {/block}
                        {/if}

                        {block name="frontend_advisor_listing_title_filtered"}
                            <span class="main-title-filtered sw5-plugin{if $replaceTitle} advisor--is-hidden{/if}">
                                {$advisor['listingTitleFiltered']|truncate:80}
                            </span>
                        {/block}
                    </h4>
                {/block}

                {block name="frontend_advisor_listing_actions"}{/block}

                {block name="frontend_advisor_listing_ct"}
                    <ul class="list-unstyled row" data-equalheight="true">
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
                            {$othersTitleFound = false}
                            {foreach $advisor['result'] as $product}

                                {block name="frontend_advisor_listing_others_title"}
                                    {include file="frontend/advisor/result/others.tpl" scope='parent'}
                                {/block}

                                {* Single article box *}
                                {block name="frontend_advisor_listing_article"}
                                    {include file="frontend/listing/box_article.tpl" sArticle=$product productBoxLayout=$advisor['listingLayout'] size="col-lg-4 col-md-6 col-sm-6 col-12"}
                                {/block}
                            {/foreach}
                        </div>
                    </ul>
                {/block}
            </div>
        {/if}
    {/block}
</div>