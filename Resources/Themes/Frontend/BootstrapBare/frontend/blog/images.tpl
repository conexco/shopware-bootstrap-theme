{* Article picture *}
{if $sArticle.preview.thumbnails[0] && $sArticle.media}
    {if $sArticle.media|@count > 1}
        {* Main Image *}
        {block name='frontend_blog_images_main_image'}
            {$alt = $sArticle.title|escape}
            {if $sArticle.preview.description}
                {$alt = $sArticle.preview.description|escape}
            {/if}
            <div id="gallery" class="slick"
                 data-arrows="1"
                 data-asNavFor="#thumbs"
                 data-fade="1"
                 data-md='{ldelim}
                    "arrows": "1"
                 {rdelim}'
                 data-hd='{ldelim}
                    "arrows": "1"
                 {rdelim}'
                 data-sm='{ldelim}
                    "arrows": "1"
                 {rdelim}'
                 data-xs='{ldelim}
                    "arrows": "1"
                 {rdelim}'>
                <a href="{$sArticle.preview.source}" title="{$alt}"
                   data-toggle="img-modal"
                   data-modal-size="{$theme['modal-gallery-size']}"
                        {if $theme['modal-gallery']}
                            data-modal-gallery="true"
                            data-modal-gallery-url="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                        {/if}
                   data-title="{$alt}">
                    <img srcset="{$sArticle.preview.thumbnails[1].sourceSet}"
                         src="{$sArticle.preview.thumbnails[1].source}"
                         alt="{$alt}"
                         class="img-fluid img-center"
                         title="{$alt|truncate:160:""}" 
                         itemprop="image"/>
                </a>
                {foreach from=$sArticle.media item=sArticleMedia}
                    {if !$sArticleMedia.preview}
                        {$alt = $sArticle.articleName|escape}
                        {if $image.description}
                            {$alt = $image.description|escape}
                        {/if}
                        <a href="{$sArticleMedia}" title="{$alt}"
                           data-toggle="img-modal"
                           data-modal-size="{$theme['modal-gallery-size']}"
                                {if $theme['modal-gallery']}
                                    data-modal-gallery="true"
                                    data-modal-gallery-url="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                                {/if}
                           data-title="{$alt}" >
                            <img srcset="{$sArticleMedia.thumbnails[1].sourceSet}"
                                 alt="{$alt}"
                                 class="img-fluid img-center"/>
                        </a>
                    {/if}
                {/foreach}
            </div>
        {/block}

        {* Thumbnails *}
        {block name='frontend_blog_images_thumbnails'}
            {assign var="countSlides" value=$sArticle.media|@count}
            <div id="ThumbsWrapper" class="blog-slider-thumbnail-wrapper">
                <div id="thumbs" class="hidden-xs hidden-sm slick"
                     data-arrows="1"
                     data-slidesToShow="4"
                     data-slidesToScroll="4"
                     data-focusOnSelect="true"
                     data-infinite="true"
                     {if $countSlides>5}centerMode="true"{/if}
                     data-asNavFor="#gallery"
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
                    {foreach $sArticle.media as $sArticleMedia}
                        {$alt = $sArticle.title|escape}
                        {if $sArticleMedia.description}
                            {$alt = $sArticleMedia.description}
                        {/if}
                        <div class="mhs card card-body">
                            <img srcset="{$sArticleMedia.thumbnails[0].sourceSet}"
                                 alt="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}"
                                 class="img-fluid img-center"
                                 title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt|truncate:25:""}" />
                        </div>
                    {/foreach}
                </div>
            </div>
        {/block}
    {else}
        {$alt = $sArticle.title|escape}
        {if $sArticle.preview.description}
            {$alt = $sArticle.preview.description|escape}
        {/if}
        <a href="{$sArticle.preview.thumbnails[2].retinaSource}" title="{$alt}"
           data-toggle="img-modal"
           data-modal-size="{$theme['modal-gallery-size']}"
           data-title="{$alt}">
            <img srcset="{$sArticle.preview.thumbnails[1].sourceSet}"
                 alt="{$alt}"
                 class="img-fluid mbl"
                 title="{$alt|truncate:160:""}" />
        </a>
    {/if}
{/if}
