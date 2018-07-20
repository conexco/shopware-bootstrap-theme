{namespace name="frontend/detail/similar"}

{* Offcanvas close button *}
{include file="frontend/_includes/close-offcanvas.tpl"}

{if count($sArticle.sSimilarArticles) > 0}
	{* Related products - Content *}
	{block name="frontend_detail_index_similar_slider_content"}
		{include file="frontend/_includes/product_slider.tpl" articles=$sArticle.sSimilarArticles sliderInitOnEvent="onShowContent-similar"}
	{/block}
{/if}