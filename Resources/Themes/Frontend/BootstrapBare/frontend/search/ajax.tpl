{if !$sSearchResults.sResults}
    {* no search results *}
    {block name="search_ajax_inner_no_results"}
        <div class="text-center pam">{s name="SearchAjaxNoResults"}{/s}</div>
    {/block}
{else}
    {block name="search_ajax_inner"}
        <div class="ajax-search-results">
            <div class="list-group">
                {* Each product in the search result *}
                {foreach $sSearchResults.sResults as $search_result name=results}
                    {block name="search_ajax_list_entry"}
                        <a href="{$search_result.link}" title="{$search_result.name}" id="ajaxresult{$smarty.foreach.results.iteration}" class="list-group-item ajax-search-item">
                            <div class="row">
                                {* Product image *}
                                {block name="search_ajax_list_entry_media"}
                                    <div class="col-4">
                                        {if $search_result.image.thumbnails[0]}
                                            <img srcset="{$search_result.image.thumbnails[0].sourceSet}" alt="{$search_result.name|escape}" class="img-fluid mx-auto d-block">
                                        {else}
                                            <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$sArticle.articleName|escape}" class="img-fluid mx-auto d-block"/>
                                        {/if}
                                    </div>
                                {/block}
                                <div class="col-8">
                                    {* Product name *}
                                    {block name="search_ajax_list_entry_name"}
                                        <h4 class="list-group-item-heading">{$search_result.name|escapeHtml}</h4>
                                    {/block}
                                    {* Product price *}
                                    {block name="search_ajax_list_entry_price"}
                                        {$sArticle = $search_result}
                                        <div class="text-right">
                                            <p class="price price-default">{if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt' namespace='frontend/listing/product-box/product-price'}{/s} {/if}{$sArticle.price|currency}{s name="Star"}*{/s}</p>
                                        </div>
                                    {/block}
                                </div>
                            </div>
                        </a>
                    {/block}
                {/foreach}
                {* Link to show all founded products using the built-in search *}
                {block name="search_ajax_all_results"}
                    <a href="{url controller='search' sSearch=$sSearchRequest.sSearch}" class="list-group-item text-center">
                        {block name="search_ajax_all_results_link"}
                            <strong>{s name='SearchAjaxLinkAllResults'}Alle Ergebnisse anzeigen{/s}</strong>
                        {/block}
                        {block name="search_ajax_all_results_number"}
                            <strong>({$sSearchResults.sArticlesCount} {s name='SearchAjaxInfoResults'}Treffer{/s})</strong>
                        {/block}
                    </a>
                {/block}
            </div>
        </div>
    {/block}
{/if}
