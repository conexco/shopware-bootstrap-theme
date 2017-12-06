{* Live Shopping text *}
{block name="frontend_listing_text"}
    {if $listingText || $listingHeadline}
		{block name="frontend_liveshopping_listing_text_container"}
            <div class="card card-body mtm">
                {block name="frontend_liveshopping_listing_headline"}
                    {if $listingHeadline}
                        <h3">{$listingHeadline}</h3>
                    {/if}
                {/block}

                {if $listingText}
                    {block name="frontend_liveshopping_listing_text"}
                        <p>{$listingText}</p>
                    {/block}
                {/if}
            </div>
		{/block}
    {/if}
{/block}