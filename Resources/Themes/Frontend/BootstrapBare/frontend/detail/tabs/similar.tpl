{namespace name="frontend/detail/similar"}

{if count($sArticle.sSimilarArticles) > 0}
	<div class="page-header">
		<h4>{s name='DetailRecommendationSimilarLabel' namespace='frontend/detail/index'}{/s}</h4>
	</div>
	<div data-equalheight="true">
		<div class="row">
			{foreach name=line from=$sArticle.sSimilarArticles item=sSimilarArticle key=key name="counter"}
				{include file="frontend/listing/box_article.tpl" sArticle=$sSimilarArticle productBoxLayout="similar"}
			{/foreach}
		</div>
	</div>
{/if}
