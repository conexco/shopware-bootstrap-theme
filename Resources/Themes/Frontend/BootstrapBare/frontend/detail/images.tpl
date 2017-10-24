{* Product image - Gallery *}
{block name="frontend_detail_image_box"}
    {block name="frontend_detail_images_gallery_wrapper"}
        <div id="GalleryWrapper">
            <div id="gallery" class="slick"
                {if {config name=sUSEZOOMPLUS}}
                data-image-zoom="true"
                data-zoomType="{$theme['zoom-type']}"
                data-lensShape="{$theme['zoom-shape']}"
                {/if}
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
                {block name='frontend_detail_image_default_image_element'}
                    {$alt = $sArticle.articleName|escape}
                    {if $sArticle.image.description}
                        {$alt = $sArticle.image.description|escape}
                    {/if}

                    {block name='frontend_detail_image_default_image_media'}
                        <a href="{$sArticle.image.source}" title="{$alt}"
                           data-toggle="img-modal"
                           data-modal-size="{$theme['modal-gallery-size']}"
                           {if $theme['modal-gallery']}
                           data-modal-gallery="true"
                           data-modal-gallery-url="{url controller='detail' action='index' sArticle=$sArticle.articleID number=$sArticle.ordernumber}"
                           {/if}
                           data-title="{$alt}">
                            {if isset($sArticle.image.thumbnails)}
                                {block name='frontend_detail_image_default_picture_element'}
                                    <img srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                                         {if {config name=sUSEZOOMPLUS}}
                                         data-zoom-image="{$sArticle.image.thumbnails[2].source}"
                                         {/if}
                                         alt="{$alt}"
                                         itemprop="image"
                                         class="img-responsive img-center item" />
                                {/block}
                            {else}
                                {block name='frontend_detail_image_fallback'}
                                    <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$alt}" class="img-responsive img-center item"/>
                                {/block}
                            {/if}
                        </a>
                    {/block}
                {/block}

                {foreach $sArticle.images as $image}
                    {block name='frontend_detail_images_image_element'}
                        {$alt = $sArticle.articleName|escape}
                        {if $image.description}
                            {$alt = $image.description|escape}
                        {/if}
                        {block name='frontend_detail_images_image_media'}
                            <a href="{$image.source}" title="{$alt}"
                               data-toggle="img-modal"
                               data-modal-size="{$theme['modal-gallery-size']}"
                               {if $theme['modal-gallery']}
                               data-modal-gallery="true"
                               data-modal-gallery-url="{url controller='detail' action='index' sArticle=$sArticle.articleID number=$sArticle.ordernumber}"
                               {/if}
                               data-title="{$alt}" >
                                {if isset($image.thumbnails)}
                                    {block name='frontend_detail_images_picture_element'}
                                        <img srcset="{$image.thumbnails[1].sourceSet}"
                                             {if {config name=sUSEZOOMPLUS}}
                                             data-zoom-image="{$image.thumbnails[2].source}"
                                             {/if}
                                             alt="{$alt}"
                                             itemprop="image"
                                             class="img-responsive img-center item"/>
                                    {/block}
                                {else}
                                    {block name='frontend_detail_images_fallback'}
                                        <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$alt}" class="img-responsive img-center item"/>
                                    {/block}
                                {/if}
                             </a>
                        {/block}
                    {/block}
                {/foreach}
            </div>
        </div>
    {/block}
{/block}

{* Product image - Thumbnails *}
{block name="frontend_detail_images_thumbs"}
    {if $sArticle.images}
        {assign var="countSlides" value=$sArticle.images|@count}
        {block name="frontend_detail_images_thumbs_wrapper"}
            <div id="ThumbsWrapper" class="gallery-thumb-slider-wrapper">
                <hr>
                {block name="frontend_detail_images_thumbs_list"}
                    <div id="thumbs" class="slick"
                         data-arrows="1"
                         data-slidesToShow="4"
                         data-slidesToScroll="4"
                         data-focusOnSelect="true"
                         data-infinite="true"
                         {if $countSlides>5}data-centerMode="true"{/if}
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
                        {block name='frontend_detail_image_thumbnail_items'}
                            {block name='frontend_detail_image_thumbnail_preview_image'}
                                {* Thumbnail - Main image *}
                                {if $sArticle.image.thumbnails}
                                    {$alt = $sArticle.articleName|escape}
                                    {if $sArticle.image.description}
                                        {$alt = $sArticle.image.description|escape}
                                    {/if}

                                    <div class="mhs thumbnail">
                                        {block name='frontend_detail_image_thumbs_main_img'}
                                            <img srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                                                 alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
                                                 title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:160:""}"
                                                 class="img-responsive img-center item" />
                                        {/block}
                                    </div>
                                {/if}
                            {/block}
                            {* Thumbnails *}
                            {foreach $sArticle.images as $image}
                                {if $image.thumbnails}
                                    {block name='frontend_detail_image_thumbnail_images'}
                                        {$alt = $sArticle.articleName|escape}
                                        {if $image.description}
                                            {$alt = $image.description|escape}
                                        {/if}

                                        <div class="mhs thumbnail">
                                            {block name='frontend_detail_image_thumbs_images_img'}
                                                <img srcset="{$image.thumbnails[0].sourceSet}"
                                                     alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
                                                     title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:160:""}"
                                                     class="img-responsive img-center item" />
                                            {/block}
                                        </div>
                                    {/block}
                                {/if}
                            {/foreach}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    {/if}
{/block}
