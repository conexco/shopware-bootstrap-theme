{block name="frontend_liveshopping_listing_pricing"}
	{$liveShopping = $sArticle.liveShopping}
    <div class="row price-wrapper" data-equal="price">
		{* Default price *}
		{block name="frontend_liveshopping_listing_price"}
            <div class="col-xs-7 col-sm-12">
                <div class="text-right">
                    <p class="price price-large price-discount liveshopping-price sw5-plugin">
                        {$liveShopping.currentPrice|currency}
                        {s name="Star" namespace="frontend/listing/box_article"}{/s}
                    </p>
                </div>
            </div>
		{/block}

		{* Pseudo price *}
		{block name="frontend_liveshopping_listing_pseudoprice"}
            <div class="col-xs-5 col-sm-12">
                <div class="pseudo-wrapper">
                    <p class="price price-small price-pseudo">
                        {if $liveShopping.type === 1 || $liveShopping.type === 2}
                            {s name="reducedPrice" namespace="frontend/live_shopping/main"}{/s}
                            {$liveShopping.startPrice|currency}
                            {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        {else}
                            {s name="reducedPrice" namespace="frontend/live_shopping/main"}{/s}
                            {$liveShopping.endPrice|currency}
                            {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        {/if}
                    </p>
                </div>
            </div>
		{/block}
	</div>
{/block}