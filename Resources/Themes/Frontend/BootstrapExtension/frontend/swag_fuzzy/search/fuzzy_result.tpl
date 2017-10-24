{block name="frontend_search_index_result_list_headline"}
    <div class="search-fuzzy">
        {foreach $swagFuzzySynonymGroups as $synonymGroup}
            {if $synonymGroup.normalSearchHeader || $synonymGroup.normalSearchBanner || $synonymGroup.normalSearchDescription}
                <div class="fuzzy-synonym-banner">
                    <a href="{if $synonymGroup.normalSearchLink}{$synonymGroup.normalSearchLink}{else}#{/if}" title="{$synonymGroup.groupName|escape|truncate:155}">
                        {block name="frontend_search_index_banner_header"}
                            {if $synonymGroup.normalSearchHeader}
                                <h3>{$synonymGroup.normalSearchHeader}</h3>
                            {/if}
                        {/block}
                        {block name="frontend_search_index_banner_image"}    
                            {if $synonymGroup.normalSearchBanner}
                                {assign var=thumbnails value=$synonymGroup.normalSearchBanner->getThumbnails()}
                                <picture>
                                    <source srcset="{link file=$thumbnails[2]->getSource()}" media="(min-width: 78em)">
                                    <source srcset="{link file=$thumbnails[1]->getSource()}" media="(min-width: 48em)">

                                    <img class="fuzzy-synonym-media img-responsive" srcset="{link file=$thumbnails[0]->getSource()}" alt="{$synonymGroup.groupName|escape|truncate:155}"/>
                                </picture>
                            {/if}
                        {/block}
                        {block name="frontend_search_index_banner_description"}    
                            {if $synonymGroup.normalSearchDescription}
                                <div class="mtm">{$synonymGroup.normalSearchDescription}</div>
                            {/if}
                        {/block}    
                    </a>
                </div>
            {/if}
        {/foreach}

        {block name="frontend_search_index_similar_headline"}
            <h1 class="fuzzy-headline">
                {s name='SearchHeadline' namespace='frontend/search/fuzzy'}{/s}
            </h1>
        {/block}

        <div class="fuzzy-similar-related mbl">
            {foreach $keywordFacet->getFacetResults() as $result}
                {block name="frontend_index_search_similar_results_{$result->getFacetName()}"}
                    <div class="fuzzy-{$result->getFieldName()}">
                        <strong class="fuzzy-label mrs">{$result->getLabel()}</strong>
                        {$count = $result->getValues()|count-1}
                        {foreach $result->getValues() as $key => $value}
                            {if $count > $key}
                                <a href="{url controller=search sSearch={$value->getLabel()|escape}}">{$value->getLabel()|escape}</a>
                                |
                            {else}
                                <a href="{url controller=search sSearch={$value->getLabel()|escape}}">{$value->getLabel()|escape}</a>
                            {/if}
                        {/foreach}
                    </div>
                {/block}
            {/foreach}
        </div>
    </div>
{/block}
