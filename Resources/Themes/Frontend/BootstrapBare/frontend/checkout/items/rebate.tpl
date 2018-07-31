{namespace name="frontend/checkout/cart_item"}

<div class="table-row my-3">
    <div class="row">
        <div class="d-none d-sm-block col-sm-2">
            {* Badge *}
            {block name='frontend_checkout_cart_item_rebate_badge'}{/block}
        </div>
        <div class="col-12 col-sm-10">
            <div class="row">
                {* Product information *}
                {block name='frontend_checkout_cart_item_rebate_details'}
                    <div class="col-8 col-sm-6 col-md-7">
                        {* Product name *}
                        {block name='frontend_checkout_cart_item_rebate_details_title'}
                            <p><strong>{$sBasketItem.articlename}</strong></p>
                        {/block}

                        {* Additional product information *}
                        {block name='frontend_checkout_cart_item_rebate_details_inline'}{/block}
                    </div>
                {/block}

                {* Product price *}
                {block name='frontend_checkout_cart_item_rebate_price'}
                    <div class="col-4 col-sm-2 text-right">
                        {block name='frontend_checkout_cart_item_rebate_price_display'}
                            {if $sBasketItem.itemInfo}
                                <strong>{$sBasketItem.itemInfo}</strong>
                            {else}
                                <strong>{$sBasketItem.price|currency} {block name='frontend_checkout_cart_tax_symbol'}*{/block}</strong>
                            {/if}
                        {/block}
                    </div>
                {/block}

                {*! Tax price *}
                {block name='frontend_checkout_cart_item_rebate_tax_price'}{/block}
            </div>
        </div>
    </div>
</div>



