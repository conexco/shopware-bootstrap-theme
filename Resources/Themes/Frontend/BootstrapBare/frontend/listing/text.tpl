{* Categorie headline *}
{block name="frontend_listing_text"}
    {if $sCategoryContent.cmsheadline && $sCategoryContent.cmstext}
        <div class="panel panel-default">
            {* Headline *}
            {block name="frontend_listing_text_headline"}
                <div class="panel-heading">
                    <h1 class="panel-title">{$sCategoryContent.cmsheadline}</h1>
                </div>
            {/block}
            {* Category text *}
            {block name="frontend_listing_text_content"}
                <div class="panel-body">
                    {$sCategoryContent.cmstext}
                </div>
            {/block}
        </div>
    {elseif $sCategoryContent.cmsheadline}
        <h1>{$sCategoryContent.cmsheadline}</h1>
    {/if}
{/block}