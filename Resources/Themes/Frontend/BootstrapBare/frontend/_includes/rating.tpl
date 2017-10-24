{**
 *  Global star rating template
 *
 *  The template provides an easy way to include a star rating in the storefront.
 *
 *  The component requires at least the parameter ```points``` to display the message correctly.
 *  The option depends on the rating and could be eg. ``$vote.points``.
 *
 *  ```
 *     {include file="frontend/_includes/rating.tpl" points=$vote.points}
 *  ```
 *
 *  There are two types of star ratings available. One type for the single ratings (eg. for comments) and one type for the average ratings.
 *  The parameter is ```type```. The available options: single (default) or aggregated.
 *
 *  ```
 *     {include file="frontend/_includes/rating.tpl" points=$sArticle.sVoteAverage.average type="aggregated"}
 *  ```

{* Type *}
{block name='frontend_rating_type'}
    {$isType='single'} {* available options: single (default) or aggregated *}
    {if isset($type)}
        {$isType=$type}
    {/if}
{/block}

{* Base *}
{block name='frontend_rating_base'}
    {$isBase=5}
{/block}

{* Microdata *}
{block name='frontend_rating_microdata'}
    {$hasMicroData=true}
    {if isset($microData)}
        {$hasMicroData=$microData}
    {/if}
    {if $hasMicroData && $isType === 'aggregated' && $count === 0} {* Don't display microdata for empty aggregated ratings *}
        {$hasMicroData=false}
    {/if}
{/block}

{* Microdata depending on type *}
{block name='frontend_rating_microdata_type'}
    {if $isType === 'single'}
        {$data='itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating"'}
    {else}
        {$data='itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating"'}
    {/if}
{/block}

{* Star rating content *}
{block name='frontend_rating_content'}
    <span class="product-rating"{if $hasMicroData} {$data}{/if}>
        {* Average calculation *}
        {block name='frontend_rating_content_average'}
            {if $isType === 'single'}
                {$average = $points}
            {else}
                {$average = $points / 2}
            {/if}
        {/block}

        {* Microdata *}
        {block name='frontend_rating_content_microdata'}
            {if $hasMicroData}
                <meta itemprop="ratingValue" content="{$average}">
                <meta itemprop="worstRating" content="1">
                <meta itemprop="bestRating" content="{$isBase}">
                {if $isType === 'aggregated'}
                <meta itemprop="ratingCount" content="{$count}">
                {/if}
            {/if}
        {/block}

        {* Stars *}
        {block name='frontend_rating_content_stars'}
            {if $points != 0}
                {for $value=1 to 5}
                    {$cls = 'fa-star'}

                    {if $value > $average}
                        {$diff=$value - $average}

                        {if $diff > 0 && $diff <= 0.5}
                            {$cls = 'fa-star-half-o'}
                        {else}
                            {$cls = 'fa-star-o'}
                        {/if}
                    {/if}

                    <i class="fa {$cls} rating"></i>
                {/for}
            {/if}
        {/block}
    </span>
{/block}