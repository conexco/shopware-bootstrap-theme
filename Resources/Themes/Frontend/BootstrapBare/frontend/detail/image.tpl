{block name="frontend_detail_image"}
    {* Multiple pictures available *}
    {if count($sArticle.images)}
        {include file="frontend/detail/images.tpl"}
    {* One picture available *}
    {else}
        {block name="frontend_detail_image_box"}
            <div id="gallery"{if {config name=sUSEZOOMPLUS}} data-image-zoom="true" data-zoomType="{$theme['zoom-type']}" data-lensShape="{$theme['zoom-shape']}"{/if}>
                {block name='frontend_detail_image_default_image_element'}
                    {$alt = $sArticle.articleName|escape}
                    {if $sArticle.image.description}
                        {$alt = $sArticle.image.description|escape}
                    {/if}
                    {block name='frontend_detail_image_default_image_media'}
                        <a href="{$sArticle.image.source}"
                           title="{$alt}"
                           data-title="{$alt}"
                           data-toggle="img-modal"
                           data-modal-size="{$theme['modal-gallery-size']}">
                            {if isset($sArticle.image.thumbnails)}
                                {block name='frontend_detail_image_default_picture_element'}
                                    <img srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                                         src="{$sArticle.image.thumbnails[1].source}"
                                         {if {config name=sUSEZOOMPLUS}}
                                         data-zoom-image="{$sArticle.image.thumbnails[2].source}"
                                         {/if}
                                         alt="{$alt}"
                                         itemprop="image"
                                         class="img-responsive img-center item" />
                                {/block}
                            {else}
                                {block name='frontend_detail_image_fallback'}
                                    <img src="{link file='frontend/_public/src/img/no-picture.png'}"
                                         alt="{$alt}"
                                         class="img-responsive img-center item"/>
                                {/block}
                            {/if}
                        </a>
                    {/block}
                {/block}
            </div>
        {/block}
   {/if}
{/block}
