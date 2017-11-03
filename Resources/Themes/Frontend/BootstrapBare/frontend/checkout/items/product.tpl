{namespace name="frontend/checkout/cart_item"}

{if $sBasketItem.additional_details.sConfigurator}
    {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber forceSecure}}
{else}
    {$detailLink=$sBasketItem.linkDetails}
{/if}

{block name='frontend_checkout_cart_item_details_title_mobile'}
    <div class="row mtm visible-xs">
        <div class="col-xs-12">
            {block name='frontend_checkout_cart_item_details_title_mobile'}
                <a href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename|strip_tags}">
                    {$sBasketItem.articlename|strip_tags|truncate:60}
                </a>
            {/block}
        </div>
    </div>
{/block}

{block name='frontend_checkout_cart_item_wrapper'}
    <div class="table-row">
        <div class="row">
            <div class="col-xs-3 col-sm-2">
                {* Product image *}
                {block name='frontend_checkout_cart_item_image'}
                    <div class="image-wrapper">
                        {block name="frontend_checkout_cart_item_image_container"}
                            {block name="frontend_checkout_cart_item_image_container_outer"}
                                {block name="frontend_checkout_cart_item_image_container_inner"}
                                    {$image = $sBasketItem.additional_details.image}
                                    {$desc = $sBasketItem.articlename|escape}

                                    {if $image.thumbnails[0]}
                                        <a href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags|escape}"
                                                {if {config name=detailmodal} && {controllerAction} === 'confirm'}
                                                    data-toggle="ajax-modal"
                                                    data-href="{url controller=detail action=productQuickView ordernumber={$sBasketItem.ordernumber} fullPath}"
                                                {/if}>
                                            {if $image.description}
                                                {$desc = $image.description|escape}
                                            {/if}
                                            <img srcset="{$image.thumbnails[0].sourceSet}" alt="{$desc}" class="img-responsive img-center" title="{$desc|truncate:160:""}" />
                                        </a>
                                    {else}
                                        <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-responsive img-center" />
                                    {/if}
                                {/block}
                            {/block}
                        {/block}
                    </div>
                {/block}
            </div>
            <div class="col-xs-9 col-sm-10">
                <div class="row">
                    {* Product information *}
                    {block name='frontend_checkout_cart_item_details_column'}
                        <div class="col-xs-12 col-sm-4 col-md-5">
                            {block name='frontend_checkout_cart_item_details'}
                                {* Product name *}
                                {block name='frontend_checkout_cart_item_details_title'}
                                    <a class="hidden-xs" href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags|escape}"
                                        {if {config name=detailmodal} && {controllerAction} === 'confirm'}
                                            data-toggle="ajax-modal"
                                            data-href="{url controller=detail action=productQuickView ordernumber={$sBasketItem.ordernumber} fullPath}"
                                        {/if}>
                                        {$sBasketItem.articlename|strip_tags|truncate:60}
                                    </a>
                                {/block}

                                {* Product SKU number *}
                                {block name='frontend_checkout_cart_item_details_sku'}
                                    <dl class="dl-horizontal dl-article mts">
                                        <dt>{s name="CartItemInfoId"}Artikelnummer{/s}</dt>
                                        <dd>{$sBasketItem.ordernumber}</dd>
                                    </dl>
                                {/block}

                                {* Product delivery information *}
                                {block name='frontend_checkout_cart_item_delivery_informations'}
                                    {if {config name=BasketShippingInfo} && $sBasketItem.shippinginfo}
                                        {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem}
                                    {/if}
                                {/block}

                                {* Additional product information *}
                                {block name='frontend_checkout_cart_item_details_inline'}{/block}
                            {/block}
                        </div>
                    {/block}

                    {* Product quantity *}
                    {block name='frontend_checkout_cart_item_quantity'}
                        <div class="col-xs-6 col-sm-2">
                            <form name="basket_change_quantity{$sBasketItem.id}" method="post" action="{url action='changeQuantity' sTargetAction=$sTargetAction}">
                                <input type="hidden" name="sArticle" value="{$sBasketItem.id}"/>
                                {block name='frontend_checkout_cart_item_quantity_selection'}
                                    {if !$sBasketItem.additional_details.laststock || ($sBasketItem.additional_details.laststock && $sBasketItem.additional_details.instock > 0)}
                                        <select name="sQuantity" class="form-control" data-auto-submit="true" aria-label="{s name='CartColumnQuantity' namespace='frontend/checkout/cart_header'}{/s}">
                                            {section name="i" start=$sBasketItem.minpurchase loop=$sBasketItem.maxpurchase+1 step=$sBasketItem.purchasesteps}
                                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index==$sBasketItem.quantity}selected="selected"{/if}>
                                                    {$smarty.section.i.index}
                                                </option>
                                            {/section}
                                        </select>
                                    {else}
                                        {s name="CartColumnQuantityEmpty" namespace="frontend/checkout/cart_item"}{/s}
                                    {/if}
                                {/block}
                            </form>
                        </div>
                    {/block}

                    {* Remove product from basket *}
                    {block name='frontend_checkout_cart_item_delete_article'}
                        <div class="col-xs-6 col-sm-2 col-sm-push-4 col-md-1 text-right">
                            {block name='frontend_checkout_cart_item_delete_article_button'}
                                <a href="{url action='deleteArticle' sDelete=$sBasketItem.id sTargetAction=$sTargetAction}" class="btn btn-danger" title="{s name='CartItemLinkDelete'}L&ouml;schen{/s}" data-use="deleteArticle">
                                    <i class="fa fa-trash-o"></i>
                                </a>
                            {/block}
                        </div>
                    {/block}

                    {* Product unit price *}
                    {block name='frontend_checkout_cart_item_price'}
                        <div class="col-xs-12 col-sm-2 col-sm-pull-2 col-md-pull-1 text-right">
                            {if !$sBasketItem.modus}
                                <div class="mtm-xs">
                                    {block name='frontend_checkout_cart_item_unit_price_label'}
                                        <span class="visible-xs-inline-block pull-left">{s name="CartColumnPrice" namespace="frontend/checkout/cart_header"}St&uuml;ckpreis{/s}</span>
                                    {/block}
                                    {$sBasketItem.price|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
                                </div>
                            {/if}
                        </div>
                    {/block}

                    {* Accumulated product price *}
                    {block name='frontend_checkout_cart_item_total_sum'}
                        <div class="col-xs-12 col-sm-2 col-sm-pull-2 col-md-pull-1 text-right">
                            <div class="mtm-xs">
                                {block name='frontend_checkout_cart_item_total_price_label'}
                                    <strong class="visible-xs-inline-block pull-left">{s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}</strong>
                                {/block}
                                <strong>{$sBasketItem.amount|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}</strong>
                            </div>
                        </div>
                    {/block}

                    {* Product tax rate *}
                    {block name='frontend_checkout_cart_item_tax_price'}{/block}
                </div>
            </div>
        </div>
    </div>
{/block}