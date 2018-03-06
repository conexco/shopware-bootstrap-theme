{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    {if $productBoxLayout eq 'list'}
        {assign "boxSize" "col-xs-12"}
    {elseif $size}
        {assign "boxSize" $size}
    {else}
        {$boxSize = ''}

        {if $theme['articles-col-width-xs'] != $theme['articles-col-width-sm']}
            {$boxSize = "col-xs-`$theme['articles-col-width-xs']`"}
        {/if}

        {if $theme['articles-col-width-sm'] != $theme['articles-col-width-hd']}
            {$boxSize = "`$boxSize` col-sm-`$theme['articles-col-width-sm']`"}
        {/if}

        {if $theme['articles-col-width-hd'] != $theme['articles-col-width-md']}
            {$boxSize = "`$boxSize` col-hd-`$theme['articles-col-width-hd']`"}
        {/if}

        {if $theme['articles-col-width-md'] != $theme['articles-col-width-lg']}
            {$boxSize = "`$boxSize` col-md-`$theme['articles-col-width-md']`"}
        {/if}

        {$boxSize = "`$boxSize` col-lg-`$theme['articles-col-width-lg']`"}
    {/if}
    {block name='frontend_listing_box_article_item_start'}
        <li class="{$boxSize} mbl product-box box-{$productBoxLayout} sw5-plugin"
            data-page-index="{$pageIndex}"
            data-ordernumber="{$sArticle.ordernumber}">
            <div class="thumbnail pam">
    {/block}
    {block name='frontend_listing_box_article_item_wrapper'}
        <div class="item-wrapper" data-equal="item">
            {block name='frontend_listing_box_article_content'}
                {block name='frontend_listing_box_article_info_container'}
                    {if $productBoxLayout eq 'list'}
                        <div class="row">
                        <div class="col-md-4">
                    {/if}

                    {* Product image + badge *}
                    {block name='frontend_listing_box_article_picture'}
                        {include file="frontend/listing/product-box/product-image.tpl"}
                    {/block}
                    {* Product box badges - highlight, newcomer, ESD product and discount *}
                    {block name='frontend_listing_box_article_badges'}
                        {include file="frontend/listing/product-box/product-badges.tpl"}
                    {/block}

                {if $productBoxLayout eq 'list'}
                    </div>
                    <div class="col-md-4">
                {/if}

                    {* Article name *}
                    {block name='frontend_listing_box_article_name'}
                        <div class="title-wrapper mts" data-equal="title">
                            {block name='frontend_listing_box_article_name_inner'}
                                <h4>
                                    <a class="" href="{$sArticle.linkDetails}" title="{$sArticle.articleName|escapeHtml}">{$sArticle.articleName|escapeHtml}</a>
                                </h4>
                            {/block}
                        </div>
                    {/block}

                    {* Description *}
                    {block name='frontend_listing_box_article_description'}
                        <div class="desc-wrapper mbs" data-equal="desc">
                            {block name='frontend_listing_box_article_description_inner'}
                                {* Customer rating for the product *}
                                {block name='frontend_listing_box_article_rating'}
                                    {if !{config name=VoteDisable}}
                                        {if $sArticle.sVoteAverage.average}
                                            <div class="mvs">
                                                {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                            </div>
                                        {/if}
                                    {/if}
                                {/block}

                                <div class="small">
                                    {if $productBoxLayout != 'listing'}
                                        {$sArticle.description_long|strip_tags|truncate:80}
                                    {/if}
                                </div>
                            {/block}
                        </div>
                    {/block}

                    {* Variant description *}
                    {block name='frontend_listing_box_variant_description'}
                        <div class="variant-wrapper" data-equal="variants">
                            {if $sArticle.attributes.swagVariantConfiguration}
                                <span title="
                                    {foreach $sArticle.attributes.swagVariantConfiguration->get('value') as $group}
                                        {$group.groupName}: {$group.optionName}
                                    {/foreach}
                                    ">
                                    {foreach $sArticle.attributes.swagVariantConfiguration->get('value') as $group}
                                        <span class="small variant-description-line">
                                            <span class="variant-groupName">{$group.groupName}:</span> {$group.optionName} {if !$group@last}|{/if}
                                        </span>
                                    {/foreach}
                                </span>
                            {/if}
                        </div>
                    {/block}

                {if $productBoxLayout eq 'list'}
                    </div>
                    <div class="col-md-4">
                {/if}

                    {block name='frontend_listing_box_article_price_info'}
                        {* Product price - Default and discount price *}
                        {block name='frontend_listing_box_article_price'}
                            {include file="frontend/listing/product-box/product-price.tpl"}
                        {/block}

                        {* Product price - Unit price *}
                        {block name='frontend_listing_box_article_unit'}
                            {include file="frontend/listing/product-box/product-price-unit.tpl"}
                        {/block}
                    {/block}

                    {block name="frontend_listing_box_article_buy"}
                        {if {config name="displayListingBuyButton"}}
                            <div class="product-btn-container">
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
        </li>
    {/block}
{/block}
