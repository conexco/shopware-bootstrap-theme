{block name="frontend_abocommerce_listing_text"}
	{if $aboCommerceSettings.bannerHeadline}
        {block name="frontend_abocommerce_listing_text_headline"}
            <h1>{$aboCommerceSettings.bannerHeadline}</h1>
        {/block}
    {/if}
    {if $aboCommerceSettings.bannerSubheadline}
        {block name="frontend_abocommerce_listing_text_subheadline"}
            <p>{$aboCommerceSettings.bannerSubheadline}</p>
        {/block}
	{/if}
{/block}