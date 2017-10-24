{namespace name="frontend/checkout/cart_item"}

<div class="table-row">
    <div class="row">
        <div class="col-sm-2">
            {* Badge *}
            {block name='frontend_checkout_cart_item_voucher_badge'}
                <div class="image-wrapper pts hidden-xs hidden-sm">
                    <span class="label label-danger">
                        {s name='CartVoucherBadgeText'}Gutschein{/s}
                    </span>
                </div>
            {/block}
        </div>
        <div class="col-xs-12 col-sm-10">
            <div class="row">
                {* Product information *}
                {block name='frontend_checkout_cart_item_voucher_details'}
                    <div class="col-xs-8 col-sm-6 col-md-7">
                        <p>
                            {* Product name *}
                            {block name='frontend_checkout_cart_item_voucher_details_title'}
                                <strong>{$sBasketItem.articlename}</strong>
                            {/block}

                            {* Product SKU number *}
                            {block name='frontend_checkout_cart_item_voucher_details_sku'}
                                <i>({s name="CartItemInfoId"}{/s} {$sBasketItem.ordernumber})</i>
                            {/block}

                            {* Additional product information *}
                            {block name='frontend_checkout_cart_item_voucher_details_inline'}{/block}
                        </p>

                        {* Remove voucher from basket *}
                        {block name='frontend_checkout_cart_item_voucher_delete_article'}
                            <a href="{url action='deleteArticle' sDelete=voucher sTargetAction=$sTargetAction}" title="{s name='CartVoucherLinkDelete'}entfernen{/s}" data-use="deleteArticle">{s name='CartVoucherLinkDelete'}{/s}</a>
                        {/block}


                    </div>
                {/block}

                {*! Product price *}
                {block name='frontend_checkout_cart_item_voucher_price'}
                    <div class="col-xs-4 col-sm-2 text-right">
                        {block name='frontend_checkout_cart_item_voucher_price_display'}
                            {if $sBasketItem.itemInfo}
                                <strong>{$sBasketItem.itemInfo}</strong>
                            {else}
                                <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}</strong>
                            {/if}
                        {/block}
                    </div>
                {/block}

                {*! Tax price *}
                {block name='frontend_checkout_cart_item_voucher_tax_price'}{/block}
            </div>
        </div>
    </div>
</div>