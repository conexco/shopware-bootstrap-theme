{namespace name="frontend/listing/box_article"}


{block name="frontend_listing_box_article_label_container"}
    <div class="label-container">
        {* New *}
        {block name='frontend_listing_box_article_new'}
            {if $sArticle.newArticle}
                <span class="label label-primary price-saving img-label">{s name='ListingBoxNew' namespace='frontend/listing/box_article'}NEU{/s}</span>
            {/if}
        {/block}

        {* Top *}
        {block name='frontend_listing_box_article_hint'}
            {if $sArticle.highlight}
                <span class="label label-success price-saving img-label">{s name='ListingBoxTip'  namespace='frontend/listing/box_article'}TIPP!{/s}</span>
            {/if}
        {/block}

        {* ESD article *}
        {block name='frontend_listing_box_article_esd'}
            {if $sArticle.esd}
                <span class="label label-warning price-saving img-label">{s name='ListingBoxInstantDownload'  namespace='frontend/listing/box_article'}Download{/s}</span>
            {/if}
        {/block}

        {* Discount article *}
        {block name='frontend_listing_box_article_pseudo'}
            {if $sArticle.pseudoprice}
                <span class="label label-danger price-saving img-label">{s name='ListingBoxDiscount'  namespace='frontend/listing/box_article'}%%%{/s}</span>
            {/if}
        {/block}
    </div>
{/block}