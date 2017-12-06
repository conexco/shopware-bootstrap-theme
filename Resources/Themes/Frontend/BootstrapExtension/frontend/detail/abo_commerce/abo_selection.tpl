{namespace name="frontend/listing/box_article"}

{block name='abo_commerce_abo_selection_price'}
	<div class="{if $aboCommerce.hasDiscount}col-6{else}col-12{/if}">
	    <div class="radio mts">
		    {if !$aboCommerce.isExclusive}
		    <label for="abo-delivery-input">
            {/if}
	            {block name="abo_commerce_abo_selection_price_radio"}
					{if !$aboCommerce.isExclusive}
						<input class="abo-delivery-input radio sw5-plugin" id="abo-delivery-input" name="aboSelection" class="selection" value="abo" type="radio"/>
					{/if}
	            {/block}
	            {block name="abo_commerce_abo_selection_price_meta"}
	                <meta itemprop="price" content="{$aboPrice.discountPrice|currency|replace:',':'.'}">
	            {/block}
	            {block name="abo_commerce_abo_selection_price_price"}
	                <span class="{if $aboCommerce.isExclusive}price price-large price-default{/if} delivery-price">{if !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}{$aboPrice.discountPrice|currency}{s name="Star"}*{/s}</span>
	            {/block}
            {if !$aboCommerce.isExclusive}
	        </label>
            {/if}
	    </div>
	</div>
{/block}

{* discount *}
{block name='abo_commerce_abo_selection_discount'}
	{if $aboCommerce.hasDiscount}
        <div class="col-6">
            <div class="abo-pseudo-price mts mbm text-right sw5-plugin{if $aboPrice.discountPercentage == 0} hidden{/if}">
                {block name="abo_commerce_abo_selection_discount_reduced"}
                    <span class="price-pseudo">
                        {s name="reducedPrice"}{/s} <span>{$sArticle.price|currency} {s name="Star"}{/s}</span>
                    </span>
                {/block}
                {block name="abo_commerce_abo_selection_discount_percentage"}
                    <div class="abo-percentage-container sw5-plugin">
                        (<span class="percent">{$aboPrice.discountPercentage|number_format:2|replace:'.':','}</span>% {s namespace="frontend/detail/abo_commerce_detail" name="AboCommerceSaved"}gespart{/s})
                    </div>
                {/block}
            </div>
        </div>
	{/if}
{/block}

{block name="abo_commerce_abo_selection_percent"}{/block}