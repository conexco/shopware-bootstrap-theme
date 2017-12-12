{* Categorie headline *}
{block name="frontend_listing_text"}
    {if $sCategoryContent.cmsheadline && $sCategoryContent.cmstext}
        <div class="card mb-3">
            {* Headline *}
            {block name="frontend_listing_text_headline"}
                <h1 class="card-header h5">
                    {$sCategoryContent.cmsheadline}
                </h1>
            {/block}

            {* Category text *}
            {block name="frontend_listing_text_content"}
                <div class="card-body">
                    {$sCategoryContent.cmstext}
                </div>
            {/block}
        </div>
    {elseif $sCategoryContent.cmsheadline}
        <h1 class="mb-4">{$sCategoryContent.cmsheadline}</h1>
    {/if}
{/block}