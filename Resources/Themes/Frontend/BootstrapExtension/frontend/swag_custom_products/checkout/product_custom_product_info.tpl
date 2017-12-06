{namespace name="frontend/detail/option"}

{$IS_NON_CUSTOM_PRODUCT = 0}
{$IS_CUSTOM_PRODUCT_MAIN = 1}
{$IS_CUSTOM_PRODUCT_OPTION = 2}
{$IS_CUSTOM_PRODUCT_VALUE = 3}
{$action = {controllerAction|lower}}

{* Check if we're dealing with a custom product *}
{if $sBasketItem.customProductMode == $IS_CUSTOM_PRODUCT_MAIN}
    {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges"}
        <div class="{if $action == 'cart' || $action == 'confirm'|| $action == 'finish'}table-row{/if} row custom-products-basket-overview">
            <div class="{if $action != 'ajax_cart'}col-9 col-offset-3 col-sm-10 col-sm-offset-2{else}col-12{/if}">
                {* Surcharges headline *}
                {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_title"}
                    <div class="row mbs">
                        <div class="col-8">
                            <strong class="custom-product-overview-title">{s name="basket/surcharges"}Surcharges{/s}</strong>
                        </div>
                        <div class="col-4 text-right">
                            {strip}<strong class="custom-product-price-surcharges">{$sBasketItem.custom_product_prices.surchargesTotal|currency}
                            {if !$isCheckoutConfirm}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/if}</strong>{/strip}
                        </div>        
                    </div>
                {/block}

                {* Option list *}
                {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_list"}
                    <div class="custom-product-overview-list mbs{if $action == 'ajax_cart'} phs{/if}">
                        {foreach $sBasketItem.custom_product_adds as $option}

                            {* Option *}
                            {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_list_item"}
                                <div class="custom-product-overview-list-item mbs">

                                    {* Option name *}
                                    {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_item_name"}
                                        <span class="custom-product-overview-option-name">
                                            <span class="overview-option-name">
                                                {$option.name}
                                            </span>

                                            {if $option.could_contain_values}
                                                {* Option price *}
                                                {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_option_price"}
                                                    {include file="frontend/swag_custom_products/checkout/checkout_price.tpl"
                                                        price = $option.surcharge
                                                        is_once_surcharge = $option.is_once_surcharge
                                                        isTaxFreeDelivery = $option.isTaxFreeDelivery
                                                        isCheckoutConfirm = $isCheckoutConfirm
                                                        sUserData = $sUserData
                                                        tax = $option.tax
                                                    }
                                                {/block}
                                            {/if}
                                            :
                                        </span>
                                    {/block}

                                    {* Option value *}
                                    {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_item_value"}
                                        <span class="custom-product-overview-option-value">
                                            {if $option.could_contain_values}
                                                <ul class="custom-product-value-list">
                                                    {foreach $option.values as $value}
                                                        <li class="custom-product-value-list-item">
                                                            {if $value.path}<i class="fa fa-paperclip mrs"></i>&nbsp;{/if}{$value.name|truncate:30}

                                                            {* Option price *}
                                                            {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_values_price"}
                                                                {include file="frontend/swag_custom_products/checkout/checkout_price.tpl"
                                                                    price = $value.surcharge
                                                                    is_once_surcharge = $value.is_once_surcharge
                                                                    isTaxFreeDelivery = $value.isTaxFreeDelivery
                                                                    isCheckoutConfirm = $isCheckoutConfirm
                                                                    sUserData = $sUserData
                                                                    tax = $value.tax
                                                                }
                                                            {/block}
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            {else}
                                                {if $option.type === 'date'}
                                                    {$option.selectedValue.0|date:DATE_MEDIUM}
                                                {else}
                                                    {$option.selectedValue.0|truncate:25}
                                                {/if}

                                                {* Option price *}
                                                {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_value_price"}
                                                    {include file="frontend/swag_custom_products/checkout/checkout_price.tpl"
                                                        price = $option.surcharge
                                                        is_once_surcharge = $option.is_once_surcharge
                                                        isTaxFreeDelivery = $option.isTaxFreeDelivery
                                                        isCheckoutConfirm = $isCheckoutConfirm
                                                        sUserData = $sUserData
                                                        tax = $option.tax
                                                    }
                                                {/block}
                                            {/if}
                                        </span>
                                    {/block}
                                </div>
                            {/block}
                        {/foreach}
                    </div>
                {/block}

                {block name="frontend_checkout_cart_item_details_inline_swag_custom_products_surcharges_total"}
                    {if $action == 'cart' || $action == 'confirm'}
                        {if $sBasketItem.additional_details.sConfigurator}
                            {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber forceSecure}}
                        {else}
                            {$detailLink = {url controller=detail sArticle=$sBasketItem.articleID forceSecure}}
                        {/if}
                        <a href="{$detailLink}#{$sBasketItem.customProductHash}" title="{s name="basket/open_configuration"}{/s}" class="custom-product-open-config text-primary">
                            {s name="basket/open_configuration"}{/s}
                        </a>
                    {/if}

                    <div class="row mts">
                        <div class="col-8">
                            <strong>{s name="basket/total_sum"}Total sum{/s}</strong>
                        </div>
                        <div class="col-4 text-right">
                            <strong class="surcharges-total-display">
                                {$sBasketItem.custom_product_prices.total|currency}{if $action !== 'confirm'}{/if}{strip}
                                {if !$isCheckoutConfirm}
                                    {s name="Star" namespace="frontend/listing/box_article"}{/s}
                                {/if}{/strip}
                            </strong>
                        </div>
                    </div>
                {/block}
            </div>    
        </div>
    {/block}
{/if}
