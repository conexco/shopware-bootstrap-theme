{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    {if $productBoxLayout eq 'list'}
        {assign "boxSize" "col-12"}
    {elseif $size}
        {assign "boxSize" $size}
    {else}
        {$boxSize = ''}

        {* TODO: refactor with new breakpoints *}
        {if $theme['articles-col-width-xs'] != $theme['articles-col-width-sm']}
            {$boxSize = "col-`$theme['articles-col-width-xs']`"}
        {/if}

        {if $theme['articles-col-width-sm'] != $theme['articles-col-width-hd']}
            {$boxSize = "`$boxSize` col-sm-`$theme['articles-col-width-sm']`"}
        {/if}

        {if $theme['articles-col-width-hd'] != $theme['articles-col-width-md']}
            {$boxSize = "`$boxSize` col-sm-`$theme['articles-col-width-hd']`"}
        {/if}

        {if $theme['articles-col-width-md'] != $theme['articles-col-width-lg']}
            {$boxSize = "`$boxSize` col-md-`$theme['articles-col-width-md']`"}
        {/if}

        {$boxSize = "`$boxSize` col-lg-`$theme['articles-col-width-lg']`"}
    {/if}

    {block name='frontend_listing_box_article_item_start'}
        <div class="{$boxSize} product-box box-{$productBoxLayout} pb-4 mb-2 sw5-plugin"
            data-page-index="{$pageIndex}"
            data-ordernumber="{$sArticle.ordernumber}">
            <div class="card card-body">
    {/block}

    {block name='frontend_listing_box_article_item_wrapper'}
        <div class="item-wrapper" data-equal="item">
            {block name='frontend_listing_box_article_content'}
                {block name='frontend_listing_box_article_info_container'}
                    {if $productBoxLayout eq 'list'}
                        <div class="row">
                        <div class="col-md-4">
                    {/if}

                    {* Product image *}
                    {block name='frontend_listing_box_article_picture'}
                        {include file="frontend/listing/product-box/product-image.tpl"}
                    {/block}

                    {* Product box badges *}
                    {block name='frontend_listing_box_article_badges'}
                        {include file="frontend/listing/product-box/product-badges.tpl"}
                    {/block}

                    {if $productBoxLayout eq 'list'}
                        </div>
                        <div class="col-md-4">
                    {/if}

                    {* Product name *}
                    {block name='frontend_listing_box_article_name'}
                        <div class="title-wrapper" data-equal="title">
                            {block name='frontend_listing_box_article_name_inner'}
                                <a class="product-name" 
                                   href="{$sArticle.linkDetails}" 
                                   title="{$sArticle.articleName|escapeHtml}">
                                    {$sArticle.articleName|escapeHtml}
                                </a>
                            {/block}
                        </div>
                    {/block}

                    {* Description *}
                    {block name='frontend_listing_box_article_description'}
                        <div class="desc-wrapper" data-equal="desc">
                            {block name='frontend_listing_box_article_description_inner'}
                                <div class="product-description small">
                                    {$sArticle.description_long|strip_tags|truncate:80}
                                </div>
                            {/block}
                        </div>
                    {/block}

                    {* Customer rating for the product *}
                    {block name='frontend_listing_box_article_rating'}
                        {if !{config name=VoteDisable}}
                            <div class="rating-wrapper" data-equal="rating">
                                {if $sArticle.sVoteAverage.average}
                                    {include file='frontend/_includes/rating.tpl' 
                                             points=$sArticle.sVoteAverage.average 
                                             type="aggregated" 
                                             count=$sArticle.sVoteAverage.count}
                                {/if}
                            </div>
                        {/if}
                    {/block}

                    {if $productBoxLayout eq 'list'}
                        </div>
                        <div class="col-md-4">
                    {/if}

                    {block name='frontend_listing_box_article_price_info'}
                        <div class="product-price-info mb-3">
                            {* Product price - Default and discount price *}
                            {block name='frontend_listing_box_article_price'}
                                {include file="frontend/listing/product-box/product-price.tpl"}
                            {/block}

                            {* Product price - Unit price *}
                            {block name='frontend_listing_box_article_unit'}
                                {include file="frontend/listing/product-box/product-price-unit.tpl"}
                            {/block}
                        </div>
                    {/block}

                    {block name="frontend_listing_box_article_buy"}
                        {if {config name="displayListingBuyButton"}}
                            <div class="product-buy">
                                {if $sArticle.allowBuyInListing}
                                    {include file="frontend/listing/product-box/button-buy.tpl"}
                                {else}
                                    {include file="frontend/listing/product-box/button-detail.tpl"}
                                {/if}
                            </div>
                        {/if}
                    {/block}

                    {* Product actions - Compare product, more information *}
                    {block name='frontend_listing_box_article_actions'}
                        {include file="frontend/listing/product-box/product-actions.tpl"}
                    {/block}

                    {if $productBoxLayout eq 'list'}
                        </div>
                        </div>
                    {/if}
                {/block}
            {/block}
        </div>
    {/block}

    {block name='frontend_listing_box_article_item_end'}
            </div>
        </div>
    {/block}
{/block}
