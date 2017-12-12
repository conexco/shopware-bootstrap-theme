{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article_label_container"}
    <div class="label-container">
        {* Newcomer badge *}
        {block name='frontend_listing_box_article_new'}
            {if $sArticle.newArticle}
                <span class="badge badge-primary d-block mb-1">
                    {s name='ListingBoxNew'}NEU{/s}
                </span>
            {/if}
        {/block}

        {* Highlight badge *}
        {block name='frontend_listing_box_article_hint'}
            {if $sArticle.highlight}
                <span class="badge badge-success d-block mb-1">
                    {s name='ListingBoxTip'}TIPP!{/s}
                </span>
            {/if}
        {/block}

        {* ESD product badge *}
        {block name='frontend_listing_box_article_esd'}
            {if $sArticle.esd}
                <span class="badge badge-warning d-block mb-1">
                    {s name='ListingBoxInstantDownload'}Download{/s}
                </span>
            {/if}
        {/block}

        {* Discount badge *}
        {block name='frontend_listing_box_article_pseudo'}
            {if $sArticle.pseudoprice}
                <span class="badge badge-danger d-block mb-1">
                    {s name='ListingBoxDiscount'}%%%{/s}
                </span>
            {/if}
        {/block}
    </div>
{/block}