{extends file='frontend/detail/index.tpl'}

{block name='frontend_index_content'}
    {if $sRelatedArticles}
        {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='DetailRelatedHeader'}{/s}"}
        <h2>{s name='DetailRelatedHeaderSimilarArticles'}{/s}</h2>
        <ul class="thumbnails list-unstyled" data-equalheight="true">
            {foreach from=$sRelatedArticles item=sArticleSub key=key name="counter"}
                {include file="frontend/listing/box_article.tpl" sArticle=$sArticleSub}
            {/foreach}
        </ul>
    {/if}
{/block}