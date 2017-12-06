{block name="frontend_ajaxsearch_index_inner"}
    <div class="ajax-search-results">
        <div class="list-group">
            {* synonym banner for SwagFuzzy *}
            {block name="frontend_ajaxsearch_index_similar_list_banners"}
                {if $swagFuzzySynonymGroups}
                    {foreach $swagFuzzySynonymGroups as $synonymGroup}
                        {block name="frontend_ajaxsearch_index_similar_list_banner"}
                            {if $synonymGroup.ajaxSearchHeader || $synonymGroup.ajaxSearchBanner || $synonymGroup.ajaxSearchDescription}
                                <div class="fuzzy-synonym-banner mtm">
                                    <a href="{if $synonymGroup.normalSearchLink}{$synonymGroup.normalSearchLink}{else}#{/if}" title="{$synonymGroup.groupName|escape|truncate:155}">
                                        {block name="frontend_ajaxsearch_index_similar_list_banner_header"}
                                            {if $synonymGroup.ajaxSearchHeader}
                                                <div class="text-center">{$synonymGroup.ajaxSearchHeader}</div>
                                            {/if}
                                        {/block}
                                        {block name="frontend_ajaxsearch_index_similar_list_banner_image"}
                                            {if $synonymGroup.ajaxSearchBanner}
                                                {assign var=thumbnails value=$synonymGroup.ajaxSearchBanner->getThumbnails()}
                                                <picture>
                                                    <source srcset="{link file=$thumbnails[2]->getSource()}" media="(min-width: 78em)">
                                                    <source srcset="{link file=$thumbnails[1]->getSource()}" media="(min-width: 48em)">

                                                    <img class="img-fluid fuzzy-synonym-media" srcset="{link file=$thumbnails[0]->getSource()}" alt="{$synonymGroup.groupName|escape|truncate:155}"/>
                                                </picture>
                                            {/if}
                                        {/block}
                                        {block name="frontend_ajaxsearch_index_similar_list_banner_description"}
                                            {if $synonymGroup.ajaxSearchDescription}
                                                <div class="ptm text-center">{$synonymGroup.ajaxSearchDescription}</div>
                                            {/if}
                                        {/block}
                                    </a>
                                </div>
                            {/if}
                        {/block}
                    {/foreach}
                {/if}
            {/block}

            {if $swagFuzzyFacets}
                {$keywordFacets = $swagFuzzyFacets[0]->getFacetResults()}
            {/if}
            {if $keywordFacets[0] && $keywordFacets[0]->getFacetName() == 'similar_requests'}
                {$similarRequestFacet = $keywordFacets[0]}
                {block name="frontend_ajaxsearch_index_similar_list_entries"}
                    <div class="similar-request-facets mbm phm">    
                        {foreach $similarRequestFacet->getValues() as $key => $value}
                            {block name="frontend_ajaxsearch_index_similar_list_entry"}
                                {if $key == 0}
                                    <div class="mbs">
                                        <strong>
                                            {$similarRequestFacet->getLabel()}
                                        </strong>
                                    </div>
                                {/if}    
                                {if $key <= 2}
                                    <a href="{url controller=search sSearch={$value->getLabel()|escape}}" title="{$value->getLabel()}">
                                        {$value->getLabel()|escape}{if !$value@last} | {/if}
                                    </a>
                                {/if}
                                {if $key == 2}
                                    {break}
                                {/if}
                            {/block}    
                        {/foreach}
                    </div>  
                {/block}      
            {/if}

            {foreach $sSearchResults.sResults as $search_result}
                {* Each product in the search result *}
                {block name="search_ajax_list_entry"}
                    <a href="{$search_result.link}" title="{$search_result.name}" id="ajaxresult{$smarty.foreach.results.iteration}" class="list-group-item ajax-search-item">
                        <div class="row">
                            {* Product image *}
                            {block name="search_ajax_list_entry_media"}
                                <div class="col-xs-4">
                                    {if $search_result.image.thumbnails[0]}
                                        <img srcset="{$search_result.image.thumbnails[0].sourceSet}" alt="{$search_result.name|escape}" class="img-fluid img-center">
                                    {else}
                                        <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$sArticle.articleName|escape}" class="img-fluid img-center"/>
                                    {/if}
                                </div>
                            {/block}

                            <div class="col-xs-8">
                                {* Product name *}
                                {block name="search_ajax_list_entry_name"}
                                    <h4 class="list-group-item-heading entry-name">{$search_result.name|escapeHtml}</h4>
                                {/block}

                                {* Product price *}
                                {block name="search_ajax_list_entry_price"}
                                    <div class="text-right">
                                        <p class="price price-default">
                                            {$search_result.price|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                                        </p>
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
                        <strong>{s name="SearchAjaxLinkAllResults" namespace="frontend/search/ajax"}{/s}</strong>
                    {/block}
                    {block name="search_ajax_all_results_number"}
                        <strong>({$sSearchResults.sArticlesCount} {s name='SearchAjaxInfoResults' namespace='frontend/search/ajax'}{/s})</strong>
                    {/block}
                </a>
            {/block}
        </div>    
    </div>
{/block}
