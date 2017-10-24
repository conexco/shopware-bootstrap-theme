{* Pseudo price, price *}
{block name='frontend_liveshopping_detail_pricing'}
    <div class="price-container mbm">
        {block name='frontend_liveshopping_detail_price'}
            <span class="price liveshopping-price sw5-plugin">
                {$liveShopping.currentPrice|currency} {s namespace="frontend/listing/box_article" name="Star"}{/s}
            </span>
        {/block}

        {block name='frontend_liveshopping_detail_pseudoprice'}
            <span class="price price-small price-pseudo">
                {if $liveShopping.type===1 || $liveShopping.type===2}
                    {s name="reducedPrice" namespace="frontend/live_shopping/main"}{/s} {$liveShopping.startPrice|currency} {s namespace="frontend/listing/box_article" name="Star"}{/s}
                {else}
                    {s name="reducedPrice" namespace="frontend/live_shopping/main"}{/s} {$liveShopping.endPrice|currency} {s namespace="frontend/listing/box_article" name="Star"}{/s}
                {/if}
            </span>
        {/block}
    </div>
{/block}

{* Countdown progress bar *}
{block name='frontend_liveshopping_detail_elapse'}
    {if $liveShopping.type === 2 || $liveShopping.type === 3}
        <div class="progress mbm">
            <div class="progress-bar elapse-inner sw5-plugin" role="progressbar" aria-valuemin="0" aria-valuemax="100">&nbsp;</div>
        </div>
    {/if}
{/block}

{* Discount *}
{block name='frontend_liveshopping_detail_charge_counter'}
    {if $liveShopping.type === 2 || $liveShopping.type === 3}
        <div class="discount-container">
            {* Charge counter *}
            {block name='frontend_liveshopping_detail_charge_counter_include'}
                {include file='frontend/swag_live_shopping/_includes/liveshopping-charge-counter.tpl'}
            {/block}
        </div>
    {/if}
{/block}

{block name='frontend_detail_data_price_legal_message'}
    <p data-toggle="ajax-modal">
        {s name="DetailDataPriceInfo" namespace="frontend/detail/data"}{/s}
    </p>
{/block}

{* Unit price *}
{block name='frontend_liveshopping_detail_unit_price'}
	<div class="unit-price-container">
		{if $sArticle.purchaseunit && $sArticle.purchaseunit != $sArticle.referenceunit}
            <strong>{s name="DetailDataInfoContent" namespace="frontend/detail/data"}{/s}</strong>
            {$sArticle.purchaseunit} {$sArticle.sUnit.description}
            (<span class="unit-price sw5-plugin">{$liveShopping.referenceUnitPrice|currency}</span> {s name="Star" namespace="frontend/listing/box_article"}{/s} / {$sArticle.referenceunit} {$sArticle.sUnit.description})
		{/if}
	</div>
{/block}

{block name='frontend_detail_data_price_default'}
    <span class="price price-content">
        <meta itemprop="price" content="{$liveShopping.currentPrice|string_format:"%.2f"}">
    </span>
{/block}