{extends file='frontend/listing/product-box/box-basic.tpl'}

{* Product description *}
{block name='frontend_listing_box_article_description'}
    <div class="desc-wrapper mbs" data-equal="desc">
        {block name='frontend_listing_box_article_description_inner'}
            {* Customer rating for the product *}
            {block name='frontend_listing_box_article_rating'}
                {if $sArticle.sVoteAverage.average}
                    <div class="mvs">
                        {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                    </div>
                {/if}
            {/block}

            <small>
                {if $productBoxLayout != 'listing'}
                    {$sArticle.description_long|strip_tags|truncate:380}
                {/if}
            </small>
        {/block}
    </div>
{/block}