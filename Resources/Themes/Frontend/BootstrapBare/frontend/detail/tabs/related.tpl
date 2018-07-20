{namespace name="frontend/detail/related"}

{* Offcanvas close button *}
{include file="frontend/_includes/close-offcanvas.tpl"}

{if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
	{* Related products - Content *}
	{block name="frontend_detail_index_similar_slider_content"}
	    {include file="frontend/_includes/product_slider.tpl" articles=$sArticle.sRelatedArticles sliderInitOnEvent="onShowContent-related"}
	{/block}
{/if}