{block name="frontend_detail_data"}
    {* Graduated prices *}
    {if $sArticle.sBlockPrices}
        {* Include block prices *}
        {block name="frontend_detail_data_block_price_include"}
            {include file="frontend/detail/block_price.tpl" sArticle=$sArticle}
        {/block}
    {else}
        {* Discount price *}
        {block name='frontend_detail_data_pseudo_price'}
            {if $sArticle.has_pseudoprice}
                {block name='frontend_detail_data_pseudo_price_discount_icon'}{/block}

                {* Discount price content *}
                {block name='frontend_detail_data_pseudo_price_discount_content'}
                    {* Percentage discount *}
                    {block name='frontend_detail_data_pseudo_price_discount_content_percentage'}
                        {if $sArticle.pseudopricePercent.float}
                            {block name='frontend_detail_data_pseudo_price_discount_before'}
                                {s name="priceDiscountLabel"}{/s}
                            {/block}

                            <p class="text-right">
                                <span class="label label-danger price-saving">
                                    {$sArticle.pseudopricePercent.float|number}% {s name="DetailDataInfoSavePercent"}{/s}
                                </span>
                            </p>

                            {block name='frontend_detail_data_pseudo_price_discount_after'}
                                {s name="priceDiscountInfo"}{/s}
                            {/block}
                        {/if}
                    {/block}

                    <p class="price text-right{if $sArticle.sVariants} hide{/if}">
                        <span class="price-pseudo">
                            {s name="reducedPrice" namespace="frontend/listing/box_article"}{/s} {$sArticle.pseudoprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        </span>
                    </p>
                {/block}
            {/if}
        {/block}

        {* Default price *}
        {block name='frontend_detail_data_price_configurator'}
            {if $sArticle.priceStartingFrom && !$sArticle.sConfigurator && $sView}
                {* Price - Starting from *}
                {block name='frontend_detail_data_price_configurator_starting_from_content'}
                    <div class="text-right">
                        <span id="DetailDataInfoFrom">
                            {s name="DetailDataInfoFrom"}{/s}
                        </span>
                        {$sArticle.priceStartingFrom|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                    </div>
                {/block}
            {else}
                {* Regular price *}
                {block name='frontend_detail_data_price_default'}
                    <div class="text-right">
                        <p class="price price-content price-large{if $sArticle.pseudoprice} price-discount{else} price-default{/if} sw5-plugin">
                            <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
                            {if $sArticle.priceStartingFrom}
                                {s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s}
                            {/if}
                            {$sArticle.price|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        </p>
                    </div>
                {/block}
            {/if}
        {/block}
    {/if}

    {* Unit price *}
    {block name='frontend_detail_data_price'}
        {if $sArticle.purchaseunit}
            {include file="frontend/listing/product-box/product-price-unit.tpl"}
        {/if}
    {/block}

    {* Tax information *}
    {block name='frontend_detail_data_tax'}
        <p data-toggle="ajax-modal"><small>{s name="DetailDataPriceInfo"}{/s}</small></p>
    {/block}

    {if $sArticle.sBlockPrices && (!$sArticle.sConfigurator || $sArticle.pricegroupActive)}
        {foreach $sArticle.sBlockPrices as $blockPrice}
            {if $blockPrice.from == 1}
                <input id="price_{$sArticle.ordernumber}" type="hidden" value="{$blockPrice.price|replace:",":"."}">
            {/if}
        {/foreach}
    {/if}
{/block}
