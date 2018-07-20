{block name="frontend_detail_data"}
	{if !$sArticle.liveshoppingData.valid_to_ts}
        {* Graduated prices *}
        {if $sArticle.sBlockPrices && !$sArticle.liveshoppingData.valid_to_ts}

            {* Include block prices *}
            {block name="frontend_detail_data_block_price_include"}
                {include file="frontend/detail/block_price.tpl" sArticle=$sArticle}
            {/block}

            {* @deprecated Block *}
            {block name='frontend_detail_data_price_info'}{/block}
		{else}

            <div class="d-block d-lg-flex align-items-center">
                {* Default price *}
                {block name='frontend_detail_data_price_configurator'}
                    {if $sArticle.priceStartingFrom && !$sArticle.sConfigurator && $sView}
                        {* Price - Starting from *}
                        {block name='frontend_detail_data_price_configurator_starting_from_content'}
                            <span class="detail-data-from">
                                {s name="DetailDataInfoFrom"}{/s}
                            </span>
                            {$sArticle.priceStartingFrom|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        {/block}
                    {else}
                        {* Regular price *}
                        {block name='frontend_detail_data_price_default'}
                            <div class="h3{if $sArticle.pseudoprice} price-discount{else} price-default{/if} mr-3 sw5-plugin">
                                <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
                                {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}
                                    {s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s}
                                {/if}
                                {$sArticle.price|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                            </div>
                        {/block}
                    {/if}
                {/block}

                {* Discount price *}
                {block name='frontend_detail_data_pseudo_price'}
                    {if $sArticle.pseudoprice}
                        {block name='frontend_detail_data_pseudo_price_discount_icon'}{/block}

                        {* Discount price content *}
                        {block name='frontend_detail_data_pseudo_price_discount_content'}
                            <span class="price-pseudo small mr-3">
                                {$sArticle.pseudoprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                            </span>

                            {* Percentage discount *}
                            {block name='frontend_detail_data_pseudo_price_discount_content_percentage'}
                                {if $sArticle.pseudopricePercent.float}
                                    {block name='frontend_detail_data_pseudo_price_discount_before'}
                                        {s name="priceDiscountLabel"}{/s}
                                    {/block}
                                  
                                    <span class="badge badge-danger">{$sArticle.pseudopricePercent.float|number_format:1:',': '.'}% 
                                        {s name="DetailDataInfoSavePercent"}{/s}</span>
                          
                                    {block name='frontend_detail_data_pseudo_price_discount_after'}
                                        {s name="priceDiscountInfo"}{/s}
                                    {/block}
                                {/if}
                            {/block}
                        {/block}
                    {/if}
                {/block}
            </div>
        {/if}

        {* Unit price *}
        {block name='frontend_detail_data_price'}
            {if $sArticle.purchaseunit}
                {include file="frontend/listing/product-box/product-price-unit.tpl"}
            {/if}
        {/block}

        {* Tax information *}
        {block name='frontend_detail_data_tax'}
            <span class="small text-muted" data-toggle="ajax-modal">{s name="DetailDataPriceInfo"}{/s}</span>
        {/block}
	{/if}

    {if $sArticle.sBlockPrices && (!$sArticle.sConfigurator || $sArticle.pricegroupActive)}
        {foreach $sArticle.sBlockPrices as $blockPrice}
            {if $blockPrice.from == 1}
                <input id="price_{$sArticle.ordernumber}" type="hidden" value="{$blockPrice.price|replace:",":"."}">
            {/if}
        {/foreach}
    {/if}

    {block name="frontend_detail_data_delivery"}
        {* Delivery informations *}
        {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
            {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
        {/if}
    {/block}

    {* @deprecated Liveshopping data *}
    {block name="frontend_detail_data_liveshopping"}{/block}
{/block}
