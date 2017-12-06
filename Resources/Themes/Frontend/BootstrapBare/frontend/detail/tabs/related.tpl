{namespace name="frontend/detail/related"}

{* Offcanvas close button *}
{include file="frontend/_includes/close-offcanvas.tpl"}

{block name="frontend_detail_tabs_related_inner"}
    <div class="page-header">
        <h3>{s name='DetailRelatedHeader'}{/s}</h3>
    </div>
    <ul class="thumbnails list-unstyled" data-equalheight="true">
        {foreach from=$sArticle.sRelatedArticles item=sArticleSub key=key name="counter"}
            {include file="frontend/listing/box_article.tpl" sArticle=$sArticleSub size='col-12 col-md-6'}
        {/foreach}
    </ul>
{/block}