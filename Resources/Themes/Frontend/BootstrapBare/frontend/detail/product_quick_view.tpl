{block name='frontend_detail_product_quick_view'}
    <div class="modal-dialog">
        <div class="modal-content">
            {block name='frontend_detail_product_quick_view_inner'}
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">
                        {$sArticle.articleName}
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        {block name='frontend_detail_product_quick_view_image_link'}
                            <div class="col-lg-6">
                                <a class="quick-view-image-link" href="{$sArticle.linkDetails}" title="{if $sArticle.image.res.description}{$sArticle.image.res.description|escape}{else}{$sArticle.articlename|escape}{/if}">
                                    {block name='frontend_detail_product_quick_view_image'}
                                        {$alt = $sArticle.articlename|escape}
                                        {if $sArticle.image.description}
                                            {$alt = $sArticle.image.description|escape}
                                        {/if}
                                        {block name='frontend_detail_product_quick_view_image_inner'}
                                            {if $sArticle.image.thumbnails}
                                                <img srcset="{$sArticle.image.thumbnails[1].sourceSet}" alt="{$alt}" class="img-fluid mx-auto d-block"/>
                                            {else}
                                                {block name='product_quick_view_image_fallback'}
                                                <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$alt}" class="img-fluid mx-auto d-block">
                                                {/block}
                                            {/if}
                                        {/block}
                                    {/block}
                                </a>
                            </div>
                        {/block}
                        {block name='frontend_detail_product_quick_view_header'}
                            <div class="col-lg-6">
                                {block name='frontend_detail_product_quick_view_header_inner'}
                                    {block name='frontend_detail_product_quick_view_title'}
                                        <div class="page-header">
                                            {block name='frontend_detail_product_quick_view_title_inner'}
                                                {$sArticle.articleName|escape}
                                            {/block}
                                        </div>
                                    {/block}
                                    {block name='frontend_detail_product_quick_view_supplier'}
                                        <p>
                                            {block name='frontend_detail_product_quick_view_supplier_inner'}
                                                <strong>{s name="DetailFromNew" namespace="frontend/detail/index"}{/s} </strong>{$sArticle.supplierName|escape}
                                            {/block}
                                        </p>
                                    {/block}
                                    {if $sArticle.attr1}
                                        <p>{$sArticle.attr1}</p>
                                    {/if}
                                    {if $sArticle.attr2}
                                        <p>{$sArticle.attr2}</p>
                                    {/if}
                                    {if $sArticle.sProperties}
                                        <table class="table table-condensed table-striped table-responsive">
                                            {foreach from=$sArticle.sProperties item=sProperty}
                                                <tr>
                                                    <td>
                                                        {$sProperty.name}
                                                    </td>
                                                    <td>
                                                        {$sProperty.value}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        </table>
                                    {/if}
                                {/block}
                            </div>
                        {/block}
                    </div>
                    {block name='frontend_detail_product_quick_view_description_title'}
                        <div class="page-header">
                            {block name='frontend_detail_product_quick_view_description_title_inner'}
                                <h3><small>{s name="DetailDescriptionHeader" namespace="frontend/detail/description"}{/s} "{$sArticle.articleName}"</small></h3>
                            {/block}
                        </div>
                    {/block}
                    {block name='frontend_detail_product_quick_view_description'}
                        <div class="quick-view-description">
                            {block name='frontend_detail_product_quick_view_description_inner'}
                                <p>{$sArticle.description_long}</p>
                                {if $sArticle.attr3}
                                    <h2>{s name='DetailDescriptionComment' namespace="frontend/detail/description"}{/s}</h2>
                                    <blockquote>{$sArticle.attr3}</blockquote>
                                {/if}
                            {/block}
                        </div>
                    {/block}
                </div>
            {/block}
        </div>
    </div>
{/block}