<div class="modal-dialog modal-lg">
    <div class="modal-content">
        {block name='checkout_ajax_add_modal_header'}
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                {block name='checkout_ajax_add_title'}
                    <h4 class="modal-title">{s name="AjaxAddHeader"}{/s}</h4>
                {/block}
            </div>
        {/block}
        {block name='checkout_ajax_add_modal_body'}
            <div class="modal-body">
                {block name='checkout_ajax_add_error'}
                    {if !$sBasketInfo}
                        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='ModalCartAddSuccess'}Der Artikel wurde zum Warenkorb hinzugefügt{/s}"}
                    {else}
                        {include file="frontend/_includes/messages.tpl" type="danger" content=$sBasketInfo}
                    {/if}
                {/block}
                {block name='checkout_ajax_add_information'}
                    <table class="table table-responsive">
                        <tr>
                            {* Article image *}
                            {block name='checkout_ajax_add_information_image'}
                                <td>
                                    {$image = $sArticle.additional_details.image}
                                    {$alt = $sArticle.articlename|escape}
                                    {if $image.description}
                                        {$alt = $image.description|escape}
                                    {/if}

                                    {if isset($image.thumbnails)}
                                        <img srcset="{$image.thumbnails[0].sourceSet}" alt="{$alt}" title="{$alt|truncate:160:""}" class="img-fluid mx-auto d-block" />
                                    {else}
                                        {block name='frontend_detail_image_fallback'}
                                            <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$alt}" title="{$alt|truncate:160:""}" class="img-fluid mx-auto d-block">
                                        {/block}
                                    {/if}
                                </td>
                            {/block}
                            {block name='checkout_ajax_add_information_data'}
                                <td>
                                    {* Article Name *}
                                    {block name='checkout_ajax_add_information_name'}
                                        <h4>{$sArticle.articlename|escape|truncate:37}</h4>
                                    {/block}
                                    {block name='checkout_ajax_add_information_details'}
                                        <div class="row">
                                            {* Ordernumber + Quantity *}
                                            {block name='checkout_ajax_add_information_quantity_ordernumber'}
                                                <div class="col-lg-4">
                                                    <dl>
                                                        <dt>{s name="AjaxAddLabelOrdernumber"}{/s}:</dt>
                                                        <dd>{$sArticle.ordernumber}</dd>
                                                        <dt>{s name="AjaxAddLabelQuantity"}{/s}:</dt>
                                                        <dd>{$sArticle.quantity}</dd>
                                                    </dl>
                                                </div>
                                            {/block}
                                            {* Article price *}
                                            {block name='checkout_ajax_add_information_price'}
                                                <div class="col-lg-6 col-offset-2 text-right">
                                                    <p class="price price-default">{$sArticle.price|currency}{s name="Star" namespace="frontend/listing/box_article"}{/s}</p>
                                                </div>
                                            {/block}
                                        </div>
                                    {/block}
                                </td>
                            {/block}
                        </tr>
                    </table>
                {/block}
            </div>
        {/block}
        {block name='checkout_ajax_add_modal_footer'}
            <div class="modal-footer">
                {block name='checkout_ajax_add_actions'}
                    <div class="row">
                        {* Contiune shopping *}
                        {block name='checkout_ajax_add_actions_continue'}
                            <div class="col-12 col-sm-4">
                                <button class="btn btn-outline-secondary btn-block mts" data-dismiss="modal" aria-hidden="true">{s name="AjaxAddLinkBack"}Zurück{/s}</button>
                            </div>
                        {/block}
                        {* Forward to the checkout *}
                        {block name='checkout_ajax_add_actions_checkout'}
                            <div class="col-12 col-sm-4 col-sm-offset-4">
                                <a class="btn btn-primary btn-block mts" href="{url action='cart'}">{s name="AjaxAddLinkCart"}Zum Warenkorb{/s}</a>
                            </div>
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
        {block name='checkout_ajax_add_cross_selling'}
            {if $sCrossSimilarShown|@count || $sCrossBoughtToo|@count}
                {block name='checkout_ajax_add_cross_slider'}
                    <div id="CrossSellerWrapper" class="crossselling-slider-wrapper pam">
                        {* Cross selling title *}
                        {block name='checkout_ajax_add_cross_selling_title'}
                            <h4>{s name="AjaxAddHeaderCrossSelling"}{/s}</h4>
                        {/block}
                        {block name='checkout_ajax_add_cross_slider_container'}

                            {if $sCrossBoughtToo|count < 1 && $sCrossSimilarShown}
                                {$sCrossSellingArticles = $sCrossSimilarShown}
                            {else}
                                {$sCrossSellingArticles = $sCrossBoughtToo}
                            {/if}

                            {include file="frontend/_includes/product_slider.tpl"
                                    articles=$sCrossSellingArticles
                                    equalHeight="true"
                                    sliderMode="ajax"

                                    sliderInfinite="1"
                                    sliderAnimationSpeed="300"
                                    sliderAutoplay="1"
                                    sliderPauseOnHover="1"

                                    sliderArrows="1"
                                    sliderDots="0"
                                    sliderSlidesToShow="3"
                                    sliderSlidesToScroll="3"

                                    sliderMDArrows="1"
                                    sliderMDDots="0"
                                    sliderMDSlidesToShow="3"
                                    sliderMDSlidesToScroll="3"

                                    sliderHDArrows="1"
                                    sliderHDDots="0"
                                    sliderHDSlidesToShow="3"
                                    sliderHDSlidesToScroll="3"

                                    sliderSMArrows="1"
                                    sliderSMDots="0"
                                    sliderSMSlidesToShow="2"
                                    sliderSMSlidesToScroll="2"

                                    sliderXSArrows="1"
                                    sliderXSDots="0"
                                    sliderXSSlidesToShow="1"
                                    sliderXSSlidesToScroll="1"

                                    productBoxLayout="slider"
                                    productSliderCls="cross-seller-slider"}
                        {/block}
                    </div>
                {/block}
            {/if}
        {/block}
    </div>
</div>