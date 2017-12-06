{if $sArticle.liveShopping}
    <span class="badge badge-danger img-label">
		{if $liveShopping.type === 2 || $liveShopping.type === 3}
			{* Charge counter *}
			{block name='frontend_liveshopping_listing_badge_charge_counter'}
				{include file='frontend/swag_live_shopping/_includes/liveshopping-charge-counter.tpl'}
			{/block}
		{else}
			{* Counter *}
			{block name='frontend_liveshopping_listing_badge_counter'}
				{include file='frontend/swag_live_shopping/_includes/liveshopping-counter.tpl'}
			{/block}
		{/if}
    </span>
{elseif $sArticle.attributes.live_shopping}
	{$attribute = $sArticle.attributes.live_shopping}

	{if $attribute->get('has_live_shopping')}
		<div class="badge badge-danger img-label badge-live-shopping-variant">
			<span>{s namespace="frontend/live_shopping/main" name="live_shopping_badge_variant"}LIVE{/s}</span>
		</div>
	{/if}
{/if}