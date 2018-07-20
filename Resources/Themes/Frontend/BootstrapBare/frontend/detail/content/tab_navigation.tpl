{block name="frontend_detail_index_tabs_navigation"}
    {block name="frontend_detail_index_tabs_navigation_inner"}
        <ul class="nav nav-tabs mb-3{if !$sArticle.sRelatedArticles && !$sArticle.sSimilarArticles} d-none{/if}">
            {block name="frontend_detail_index_related_similiar_tabs"}
                {* Accessory articles *}
                {block name="frontend_detail_tabs_related"}
                    {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                        <li class="nav-item">
                            <a data-toggle="tab" 
                               href="#related"
                               class="nav-link active show">
                                {s name='DetailTabsAccessories'}Zubehör{/s} 
                                <span class="badge badge-secondary">{$sArticle.sRelatedArticles|@count}</span>
                            </a>
                        </li>
                     {/if}
                {/block}

                {* Similar products *}
                {block name="frontend_detail_index_tabs_similar"}
                    {if $sArticle.sSimilarArticles}
                        <li class="nav-item">
                            <a data-toggle="tab" 
                               href="#similar"
                               class="nav-link">
                                {s name='DetailTabsSimilar'}Ähnliche Artikel{/s}
                            </a>
                        </li>
                    {/if}
                {/block}

                {* Product stream products *}
                {block name="frontend_detail_index_tabs_streams"}
                    {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                        <li class="nav-item">
                            <a data-toggle="tab" 
                               href="#streams"
                               class="nav-link">
                                {$relatedProductStream.name}
                            </a>
                        </li>
                    {/foreach}
                {/block}
            {/block}
        </ul>
    {/block}

    {* Content Tabs *}
    {block name="frontend_detail_index_outer_tabs"}
        {block name="frontend_detail_index_inner_tabs"}
            <div class="tab-content">
                {* Accessory articles *}
                {block name="frontend_detail_index_tabs_related"}
                    {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                        <div class="tab-pane pam active show" id="related">
                            {block name="frontend_detail_index_tabs_related_inner"}
                                {include file="frontend/detail/tabs/related.tpl"}
                            {/block}
                        </div>
                    {/if}
                {/block}

                {* Similar products slider *}
                {block name="frontend_detail_index_tabs_similar"}
                    {if $sArticle.sSimilarArticles}
                        <div class="tab-pane pam" id="similar">
                            {block name="frontend_detail_index_tabs_similar_inner"}
                                {include file='frontend/detail/tabs/similar.tpl'}
                            {/block}
                        </div>
                    {/if}
                {/block}
                
                {* Product streams slider *}
                {block name="frontend_detail_index_tabs_streams"}
                    <div class="tab-pane pam" id="streams">
                        {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                            {block name="frontend_detail_index_tabs_related_product_streams"}
                                {block name="frontend_detail_index_tabs_related_product_streams_inner"}
                                    {include file='frontend/detail/tabs/product_streams.tpl' index=$key}
                                {/block}
                            {/block}
                        {/foreach}
                    </div>
                {/block}
            </div>
        {/block}
    {/block}
{/block}
