{namespace name="frontend/listing/listing_actions"}

{if $limit === null && $criteria}
    {$limit = $criteria->getLimit()}
{/if}

{if $limit && $pageSizes}
    <div class="col-sm-5 col-md-4">
        <form method="get" data-action-form="true" class="action-per-page sw5-plugin">

            {* Necessary to reset the page to the first one *}
            <input type="hidden" name="{$shortParameters.sPage}" value="1">

            {* Per page field *}
            {block name='frontend_listing_actions_items_per_page_field'}
                <select id="{$shortParameters.sPerPage}" 
                        name="{$shortParameters.sPerPage}" 
                        class="form-control per-page-field action-field" 
                        aria-label="{s name='ListingLabelItemsPerPage'}{/s}"
                        data-auto-submit="true" 
                        data-class="per-page-select">

                    {block name='frontend_listing_actions_items_per_page_label'}
                        <option value="" disabled="disabled">{s name='ListingLabelItemsPerPage'}{/s}</option>
                    {/block}

                    {foreach $pageSizes as $perPage}
                        <option value="{$perPage}" {if $perPage == $limit}selected="selected"{/if}>{$perPage}</option>
                    {/foreach}
                    
                    {block name='frontend_listing_actions_per_page_values'}{/block}
                </select>
            {/block}
        </form>
    </div>
{/if}