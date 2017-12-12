{namespace name="frontend/listing/box_article"}

{block name='frontend_listing_box_article_price_inner'}
    <div class="row product-price">
        {block name='frontend_listing_box_article_price_discount_wrapper'}
            <div class="col-5 col-sm-12">
                <div class="pseudo-wrapper" data-equal="pseudo">
                    {* Discount price *}
                    {block name='frontend_listing_box_article_price_discount'}
                        {if $sArticle.has_pseudoprice}
                            {block name='frontend_listing_box_article_price_discount_before'}
                                {s name="priceDiscountLabel" namespace="frontend/detail/data"}{/s}
                            {/block}

                            {block name='frontend_listing_box_article_pseudo_inner'}
                                <p class="price price-small price-pseudo">
                                    {s name="reducedPrice"}statt: {/s}{$sArticle.pseudoprice|currency}{s name="Star"}*{/s}
                                </p>
                            {/block}

                            {block name='frontend_listing_box_article_price_discount_after'}
                                {s name="priceDiscountInfo" namespace="frontend/detail/data"}{/s}
                            {/block}
                        {/if}
                    {/block}
                </div>
            </div>
        {/block}

        {block name='frontend_listing_box_article_price_default_wrapper'}
            <div class="{if $sArticle.has_pseudoprice}col-7 col-sm-12{else}col-12{/if}">
                <div class="price-wrapper" data-equal="price">
                    {* Default price *}
                    {block name='frontend_listing_box_article_price_default'}
                        <div class="text-right">
                            {block name='frontend_listing_box_article_price_default_inner'}
                                <p class="price price-large{if !$sArticle.pseudoprice} price-default{else} price-discount{/if}">
                                    {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}
                                        {s name='ListingBoxArticleStartsAt'}{/s} 
                                    {/if}
                                    {$sArticle.price|currency}{s name="Star"}*{/s}
                                </p>
                            {/block}
                        </div>
                    {/block}
                </div>
            </div>
        {/block}
    </div>
{/block}