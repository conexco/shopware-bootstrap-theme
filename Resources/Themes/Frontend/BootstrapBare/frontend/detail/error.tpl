{extends file='frontend/detail/index.tpl'}

{block name='frontend_index_content'}
    {if $sRelatedArticles}
        {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='DetailRelatedHeader'}{/s}"}

        <h2 class="h4 mb-3">
            {s name='DetailRelatedHeaderSimilarArticles'}{/s}
        </h2>

        {block name="frontend_detail_error_related_slider_content"}
            {include file="frontend/_includes/product_slider.tpl" articles=$sRelatedArticles sliderInitOnEvent="onShowContent-related"}
        {/block}
    {/if}
{/block}