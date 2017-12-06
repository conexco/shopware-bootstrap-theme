{block name='image_slider'}
	<div class="bundle-slider slick"
		 data-bundleProductSlider="true"
		 data-mode="ajax"
		 data-slidesToShow="4"
		 data-slidesToScroll="4"
		 data-infinite="0"
		 data-md='{ldelim}
            "slidesToShow": "3",
            "arrows": "1",
            "slidesToScroll": "3"
        {rdelim}'
		 data-hd='{ldelim}
            "slidesToShow": "3",
            "arrows": "1",
            "slidesToScroll": "3"
        {rdelim}'
		 data-sm='{ldelim}
            "slidesToShow": "2",
            "arrows": "1",
            "slidesToScroll": "2"
        {rdelim}'
		 data-xs='{ldelim}
            "slidesToShow": "2",
            "arrows": "1",
            "slidesToScroll": "2"
        {rdelim}'>
		{block name='image_slider_container'}
			{foreach from=$bundle.articles key=index item=article}
				{block name='container_item'}
					<div class="bundle-thumb-wrapper" data-original-index="{$index}">
						<div class="card card-body" data-equal="item" data-bundleImageArticleId="{if $article.bundleArticleId}{$article.bundleArticleId}{else}0{/if}">
							{* product image *}
							{block name='item_image'}
								<div class="item-wrapper" data-equal="item">
									{block name='item_image_element'}
										<a href="{url controller=detail sArticle=$article.articleId}">
											{if isset($article.cover.src)}
												<img class="img-fluid img-center" srcset="{$article.cover.src[0]}" alt="{$article.name|escape:'html'}" />
											{else}
												<img class="img-fluid img-center" srcset="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$article.name|escape:'html'}" />
											{/if}
										</a>
									{/block}
								</div>
							{/block}
						</div>
						{* item seperator *}
						{block name='item_separator'}
							<i class="bundle-thumb-icon fa fa-plus fa-lg text-primary"></i>
						{/block}
					</div>
				{/block}
			{/foreach}
		{/block}
	</div>
{/block}
