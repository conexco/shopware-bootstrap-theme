{block name='promotion_checkout_free_goods_body'}
    {if $freeGoods|count}
        <div class="free-goods-product panel panel-default">
            {* Headline *}
            {block name='promotion_checkout_free_goods_headline'}
                <div class="free-goods-product-title text-center panel-heading">
                    {s name="selectFreeGood" namespace="frontend/swag_promotion/main"}Select free product{/s}
                </div>
            {/block}
            <div class="panel-body">
                {* Product slider *}
            {block name='promotion_checkout_free_goods_slider'}
                <div class="free-goods-product-content">

                    {* Product slider container *}
                    {block name='promotion_checkout_free_goods_slider_container'}
                        <div class="free-goods-product-slider-container" data-arrows="true">
                            {foreach $freeGoods as $article}

                                {* Product slider item *}
                                {block name='promotion_checkout_free_goods_slider_item'}
                                    <div class="container-product product-slider-item">

                                        <div class="product-inner">

                                            {* Product image *}
                                            {block name='promotion_checkout_free_goods_premium_image'}
                                                <a href="{$article.linkDetails}" title="{$article.articleName|escape}" class="product-image">

                                                    {block name='promotion_checkout_free_goods_image_element'}
                                                        <span class="image-element">
                                                            {if $article.image.thumbnails}
                                                                <img srcset="{$article.image.thumbnails[0].sourceSet}"
                                                                     alt="{$article.articleName|escape}" class="img-fluid img-center" />
                                                            {else}
                                                                <img src="{link file='frontend/_public/src/img/no-picture.png'}"
                                                                     alt="{"{s name="PremiumInfoNoPicture"}{/s}"|escape}" class="img-fluid img-center">
                                                            {/if}
                                                        </span>
                                                    {/block}

                                                </a>
                                            {/block}

                                            <div class="item-title mbm">
                                                <span>{$article.articleName}</span>
                                            </div>

                                            {block name='promotion_checkout_free_goods_select_article'}
                                                {if $article.variants && $article.variants|count > 1}
                                                    <div class="free-goods-product-variant">
                                                        <select class="free-goods-product-selection quantity-select form-control" name="addFreeGood{$article.articleID}" data-no-custom-select="true">
                                                            {foreach from=$article.variants item=variant}
                                                                <option value="{$variant.orderNumber}">{$variant.additionalText|replace:$article.articleName:''}</option>
                                                            {/foreach}
                                                        </select>
                                                        {block name='promotion_checkout_free_goods_info_button_small'}
                                                            <button class="free-goods-product-button btn btn-primary btn-block mtm" data-type="hidden" data-name="addFreeGood{$article.articleID}" data-promotionId="{$article.promotionId}" data-url="{url controller=SwagPromotion action=addFreeGoodToCart}">
                                                                {s name="addToCart" namespace="frontend/swag_promotion/main"}Select{/s}
                                                            </button>
                                                        {/block}
                                                    </div>
                                                {else}
                                                    <input type="hidden" name="addFreeGood{$article.articleID}" value="{$article.ordernumber}"/>
                                                    {block name='promotion_checkout_free_goods_info_button'}
                                                        <button class="free-goods-product-button btn btn-primary btn-block" data-type="hidden" data-name="addFreeGood{$article.articleID}" data-promotionId="{$article.promotionId}" data-url="{url controller=SwagPromotion action=addFreeGoodToCart}">
                                                            {s name="addToCart" namespace="frontend/swag_promotion/main"}Select{/s}
                                                        </button>
                                                    {/block}
                                                {/if}
                                            {/block}
                                        </div>

                                    </div>
                                {/block}
                            {/foreach}
                        </div>
                    {/block}
                </div>
            {/block}
            </div>

            <script type="text/javascript">
                var asyncConf = ~~('{$theme.asyncJavascriptLoading}');
                var freeGoodsFn = function() {
                    $('[data-ajax-cart="true"]').swfPromotionHandleFreeGoodsCart();
                };

                if (asyncConf === 1) {
                    document.asyncReady(freeGoodsFn);
                } else {
                    freeGoodsFn();
                }
            </script>
        </div>
    {/if}
{/block}
