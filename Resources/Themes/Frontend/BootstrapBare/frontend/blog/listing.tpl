<div class="listing-blog">
    {if $sCategoryContent.cmsheadline || $sCategoryContent.cmstext}
        {include file="frontend/listing/text.tpl"}
    {/if}
    {if $sBlogArticles}
        {foreach from=$sBlogArticles item=sArticle key=key name="counter"}
            {include file="frontend/blog/box.tpl" sArticle=$sArticle key=$key}
        {/foreach}

        {* Paging *}
        {block name="frontend_listing_bottom_paging"}
            {if $sNumberPages > 1}
                {include file="frontend/listing/actions/action-pagination.tpl" pages=$sNumberPages}
            {/if}
        {/block}
    {/if}
</div>

