{if $liveShopping}
	{* Liveshopping detail page *}
	{block name="frontend_liveshopping_detail"}
		<div class="liveshopping-details sw5-plugin"
			 data-live-shopping="true"
			 data-validTo="{$liveShopping.validTo}"
			 data-liveShoppingId="{$liveShopping.id}"
			 data-dataUrl="{url module=widgets controller="LiveShopping" action="getLiveShoppingData" liveShoppingId=$liveShopping.id}"
			 data-initialQuantity="{$liveShopping.quantity}"
			 data-liveShoppingType="{$liveShopping.type}"
			 data-star="{s namespace="frontend/listing/box_article" name="Star"}*{/s}"
			 data-initialSells="{$liveShopping.sells}"
			 data-currencyHelper="{0|currency}">

            <div class="panel panel-danger text-center">
                {* Liveshopping counter *}
                {block name="frontend_liveshopping_detail_counter"}
                    {* Liveshopping counter headline *}
                    {block name="frontend_liveshopping_detail_counter_headline"}
                        <div class="panel-heading">
                            {s name="sLiveHeadline" namespace="frontend/live_shopping/main"}{/s}
                        </div>
                    {/block}

                    <div class="panel-body">
                        {* Liveshopping counter *}
                        {block name='frontend_liveshopping_detail_counter_include'}
                            {include file='frontend/swag_live_shopping/_includes/liveshopping-counter.tpl'}
                        {/block}

                        {* Liveshopping stock *}
                        {block name='frontend_liveshopping_detail_stock'}
                            {if $liveShopping.limited === 1}
                                {include file='frontend/swag_live_shopping/_includes/liveshopping-stock.tpl'}
                            {/if}
                        {/block}

                        {* Liveshopping content with price and discount *}
                        {block name='frontend_liveshopping_detail_content'}
                            <div class="mtm">
                                {* Icon, regular price, discount price, unit price *}
                                {block name='frontend_liveshopping_detail_pricing_include'}
                                    {include file="frontend/swag_live_shopping/detail/liveshopping-detail-pricing.tpl"}
                                {/block}
                            </div>
                        {/block}
                    </div>
                {/block}
            </div>
		</div>
	{/block}
{/if}