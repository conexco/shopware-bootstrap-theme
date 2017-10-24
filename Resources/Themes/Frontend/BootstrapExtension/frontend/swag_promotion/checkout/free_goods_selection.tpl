{block name='frontend_checkout_cart_promotion_free_goods_panel'}
    <div id="promotion-free-goods" class="panel panel-body panel-default" data-free-goods-promotion="true">

        {* Headline *}
        {block name='frontend_checkout_cart_promotion_free_goods_headline'}
            <legend>{s name="selectFreeGood" namespace="frontend/swag_promotion/main"}{/s}</legend>
        {/block}

        {* Product slider *}
        {block name='frontend_checkout_promotion_free_goods_slider'}
            <div class="row" data-equalheight="true">
                {* Product slider container *}
                {block name='frontend_checkout_promotion_free_goods_slider_container'}
                    {foreach $freeGoods as $freeGood}
                        {* Product slider item *}
                        {block name='frontend_checkout_promotion_free_goods_slider_item'}
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="panel panel-primary">
                                    <div class="panel-body" data-ordernumber="{$freeGood.ordernumber}">
                                        <div class="item-wrapper" data-equal="item">
                                            {* Product image *}
                                            {block name='frontend_checkout_promotion_free_goods_image'}
                                                <a href="{$freeGood.linkDetails}"
                                                   title="{$freeGood.articleName|escape}">
                                                    {block name='frontend_checkout_promotion_free_goods_image_element'}
                                                        <div class="image-wrapper" data-equal="image">
                                                            {if $freeGood.image.thumbnails}
                                                                <img srcset="{$freeGood.image.thumbnails[0].sourceSet}"
                                                                     alt="{$freeGood.articleName|escape}"
                                                                     class="img-responsive" />
                                                            {else}
                                                                <img src="{link file='frontend/_public/src/img/no-picture.png'}"
                                                                     alt="{"{s name="ListingBoxNoPicture" namespace="frontend/listing/box_article"}{/s}"|escape}"
                                                                     class="img-responsive">
                                                            {/if}
                                                        </div>
                                                    {/block}
                                                </a>
                                            {/block}

                                            {*Product name*}
                                            {block name='frontend_checkout_promotion_free_goods_article_name'}
                                                <div class="title-wrapper mbs" data-equal="title">
                                                    <a href="{$freeGood.linkDetails}"
                                                       title="{$freeGood.articleName|escape}">
                                                        {$freeGood.articleName|truncate:50}
                                                    </a>
                                                </div>
                                            {/block}

                                            {*select free product *}
                                            {block name='frontend_checkout_promotion_free_goods_form'}
                                                <form action="{url controller=SwagPromotion action=addFreeGoodToCart}" method="post">
                                                    <input type="hidden" name="noXhr" value="true">
                                                    <input type="hidden" name="promotionId" value="{$freeGood.promotionId}">
                                                    
                                                    {block name='frontend_checkout_promotion_free_goods_select_article'}
                                                        <div class="pseudo-wrapper" data-equal="pseudo">
                                                            {if $freeGood.variants && $freeGood.variants|@count > 1}
                                                                <select class="form-control free-good-select sw5-plugin" name="orderNumber">
                                                                    <option value="">{s name='CheckoutSelectVariant' namespace='frontend/swag_promotion/main'}Variante wählen{/s}</option>
                                                                    {foreach from=$freeGood.variants item=variant}
                                                                        <option value="{$variant.orderNumber}">{$variant.additionalText|replace:$freeGood.articleName:''}</option>
                                                                    {/foreach}
                                                                </select>
                                                            {else}
                                                                <input type="hidden" name="orderNumber" value="{$freeGood.ordernumber}"/>
                                                            {/if}
                                                        </div>
                                                        {block name='frontend_checkout_promotion_free_goods_info_button'}
                                                            <button class="btn btn-primary btn-block mtm free-good-add sw5-plugin"
                                                                    type="submit"
                                                                    {if $freeGood.variants && $freeGood.variants|@count > 1}
                                                                        disabled="disabled" 
                                                                    {/if}
                                                                    title="{s name='addToCart' namespace='frontend/swag_promotion/main'}{/s}">
                                                                {s name='addToCart' namespace="frontend/swag_promotion/main"} Gratisartikel wählen{/s}
                                                            </button>
                                                        {/block}
                                                    {/block}
                                                </form>
                                            {/block}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/block}
                    {/foreach}
                {/block}
            </div>
        {/block}
    </div>
{/block}
