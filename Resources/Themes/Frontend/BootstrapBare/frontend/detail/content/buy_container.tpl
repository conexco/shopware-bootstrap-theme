{block name='frontend_detail_index_overview_inner'}
    <div class="product-buybox mb-3 sw5-plugin" id="buybox">
        {block name="frontend_detail_rich_snippets_brand"}
            <meta itemprop="brand" content="{$sArticle.supplierName|escape}"/>
        {/block}

        {block name="frontend_detail_rich_snippets_weight"}
            {if $sArticle.weight}
                <meta itemprop="weight" content="{$sArticle.weight} kg"/>
            {/if}
        {/block}

        {block name="frontend_detail_rich_snippets_height"}
            {if $sArticle.height}
                <meta itemprop="height" content="{$sArticle.height} cm"/>
            {/if}
        {/block}

        {block name="frontend_detail_rich_snippets_width"}
            {if $sArticle.width}
                <meta itemprop="width" content="{$sArticle.width} cm"/>
            {/if}
        {/block}

        {block name="frontend_detail_rich_snippets_depth"}
            {if $sArticle.length}
                <meta itemprop="depth" content="{$sArticle.length} cm"/>
            {/if}
        {/block}

        {block name="frontend_detail_rich_snippets_release_date"}
            {if $sArticle.sReleasedate}
                <meta itemprop="releaseDate" content="{$sArticle.sReleasedate}"/>
            {/if}
        {/block}

        {block name="frontend_detail_rich_snippets_url"}
            <meta itemprop="url" content="{url sArticle=$sArticle.articleID title=$sArticle.articleName}" />
        {/block}

        {* Category path. Google recommends the following format: "Parent category > Child category" *}
        {block name="frontend_detail_rich_snippets_category"}
            <meta itemprop="category" content="{strip}
                            {foreach $sBreadcrumb as $crumb}
                                {if !$crumb@last}
                                    {if !$crumb@first} > {/if}{$crumb.name}
                                {/if}
                            {/foreach}
                        {/strip}" />
        {/block}

        {* Product data *}
        {block name='frontend_detail_index_buy_container_inner'}
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">

                {*! Article data *}
                {block name='frontend_detail_index_data'}
                    {if $sArticle.sBlockPrices}
                        {$lowestPrice=false}
                        {$highestPrice=false}
                        {foreach $sArticle.sBlockPrices as $blockPrice}
                            {if $lowestPrice === false || $blockPrice.price < $lowestPrice}
                                {$lowestPrice=$blockPrice.price}
                            {/if}
                            {if $highestPrice === false || $blockPrice.price > $highestPrice}
                                {$highestPrice=$blockPrice.price}
                            {/if}
                        {/foreach}

                        <meta itemprop="lowPrice" content="{$lowestPrice}" />
                        <meta itemprop="highPrice" content="{$highestPrice}" />
                        <meta itemprop="offerCount" content="{$sArticle.sBlockPrices|count}" />
                    {else}
                        <meta itemprop="priceCurrency" content="{$Shop->getCurrency()->getCurrency()}"/>
                    {/if}

                    {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}

                {/block}

                {block name='frontend_detail_index_after_data'}{/block}
                {block name="frontend_detail_index_buy_container_base_info"}{/block}

                {block name='frontend_detail_buy_laststock'}
                    {if !$sArticle.isAvailable && ($sArticle.isSelectionSpecified || !$sArticle.sConfigurator)}
                        {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailBuyInfoNotAvailable' namespace='frontend/detail/buy'}{/s}"}
                    {/if}
                {/block}

                {* Product eMail notification *}
                {block name="frontend_detail_index_notification"}
                    {if $sArticle.notification && $sArticle.instock <= 0 && $ShowNotification}
                        {include file="frontend/plugins/notification/index.tpl"}
                    {/if}
                {/block}

                {* Configurator drop down menus *}
                {block name="frontend_detail_index_configurator"}
                    {if $sArticle.sConfigurator}
                        {if $sArticle.sConfiguratorSettings.type == 1}
                            {$file = 'frontend/detail/config_step.tpl'}
                        {elseif $sArticle.sConfiguratorSettings.type == 2}
                            {$file = 'frontend/detail/config_variant.tpl'}
                        {else}
                            {$file = 'frontend/detail/config_upprice.tpl'}
                        {/if}

                        {include file=$file}
                    {/if}
                {/block}

                {*! Include buy button and quantity box *}
                {block name="frontend_detail_index_buybox"}
                    {include file="frontend/detail/buy.tpl"}
                {/block}
            </div>
        {/block}
    </div>

    {*! Article comments - small overview *}
    {block name="frontend_detail_comments_overview"}
        {if !{config name=VoteDisable}}
            {if !$sArticle.sVoteAverage.count}
                {block name="frontend_detail_comments_no_review"}
                    <p class="small mb-1">
                        <a href="#tabcomments" class="showtabcomments" rel="nofollow" 
                           title="{s name='NoReviewText'}Geben Sie die erste Bewertung für diesen Artikel ab{/s}">
                            {s name='NoReviewText'}{/s}
                        </a>
                    </p>
                {/block}
            {else}
                {block name="frontend_detail_comments_review"}
                    {block name="frontend_detail_comments_review_inner"}
                        {block name="frontend_detail_comments_stars"}
                            {block name="frontend_detail_comments_stars_inner"}
                                {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                            {/block}
                        {/block}
                    {/block}
                {/block}
            {/if}
        {/if}
    {/block}

    {* Product actions *}
    {block name="frontend_detail_index_actions"}
        {include file="frontend/detail/actions.tpl"}
    {/block}

    {*! Additional Data *}
    {block name="frontend_detail_supplier_ordernumber"}
        {if $sArticle.supplierName || $sArticle.ordernumber}
            <dl class="row small">
                {*! Supplier name *}
                {if $sArticle.supplierName}
                    {block name='frontend_detail_index_supplier'}
                        <dt class="col-4">{s name="DetailFromNew"}Hersteller:{/s}</dt>
                        <dd class="col-6">{$sArticle.supplierName}</dd>
                    {/block}
                {/if}

                {*! Order number *}
                {if $sArticle.ordernumber}
                    {block name='frontend_detail_data_ordernumber'}
                        {* Product SKU - Label *}
                        {block name='frontend_detail_data_ordernumber_label'}
                            <dt class="col-4">
                                {s name="DetailDataId" namespace='frontend/detail/data'}Artikelnummer:{/s}
                            </dt>
                        {/block}

                        {* Product SKU - Content *}
                        {block name='frontend_detail_data_ordernumber_content'}
                            <meta itemprop="productID" content="{$sArticle.articleDetailsID}"/>
                            <dd class="col-6 entry-sku" itemprop="sku">{$sArticle.ordernumber}</dd>
                        {/block}
                    {/block}
                {/if}
            </dl>
        {/if}
    {/block}
{/block}
