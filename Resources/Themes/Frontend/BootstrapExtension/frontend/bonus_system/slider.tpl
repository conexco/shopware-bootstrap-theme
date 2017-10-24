{foreach $sSliderArticles as $article}
    <div class="product-slider-item">
        {include file="frontend/listing/box_article.tpl" sArticle=$article productBoxLayout="slider"}
    </div>
{/foreach}