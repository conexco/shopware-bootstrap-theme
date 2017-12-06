{namespace name="frontend/checkout/cart_item"}

<div class="table-row">
    <div class="row">
        <div class="col-xs-3 col-sm-2">
            {* Product image *}
            {block name='frontend_checkout_cart_item_premium_image'}
                {if $sBasketItem.image.src.2}
                    {block name="frontend_checkout_cart_item_image_container"}
                        <a href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename|strip_tags}"
                                {if {config name=detailmodal} && {controllerAction} === 'confirm'}
                                    data-toggle="ajax-modal"
                                    data-href="{url controller=detail action=productQuickView ordernumber={$sBasketItem.ordernumber} fullPath}"
                                {/if}>
                            {$desc = $sBasketItem.articlename|escape}
                            {if $sBasketItem.image.description}
                                {$desc = $sBasketItem.image.description|escape}
                            {/if}
                            <img src="{$sBasketItem.image.src.2}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-fluid img-center" />
                        </a>
                    {/block}
                {/if}
            {/block}
        </div>
        <div class="col-xs-9 col-sm-10">
            <div class="row">
                {* Product information *}
                {block name='frontend_checkout_cart_item_premium_details'}
                    <div class="col-xs-8 col-sm-6 col-md-7">
                        {* Product name *}
                        {block name='frontend_checkout_cart_item_premium_premium_details_title'}
                            <a href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename|strip_tags}"
                                    {if {config name=detailmodal} && {controllerAction} === 'confirm'}
                                        data-toggle="ajax-modal"
                                        data-href="{url controller=detail action=productQuickView ordernumber={$sBasketItem.ordernumber} fullPath}"
                                    {/if}>
                                {$sBasketItem.articlename|strip_tags|truncate:60}
                            </a>
                            <p class="mtm mrm">{s name="CartItemInfoPremium"}{/s}</p>
                        {/block}

                        {* Additional product information *}
                        {block name='frontend_checkout_cart_item_premium_details_inline'}{/block}

                        {* Remove product from basket *}
                        {block name='frontend_checkout_cart_item_premium_delete_article'}
                            <a href="{url action='deleteArticle' sDelete=$sBasketItem.id sTargetAction=$sTargetAction}" title="{s name='CartPremiumLinkDelete'}entfernen{/s}" data-use="deleteArticle">{s name='CartPremiumLinkDelete'}{/s}</a>
                        {/block}
                    </div>
                {/block}

                {* Accumulated product price *}
                {block name='frontend_checkout_cart_item_premium_total_sum'}
                    <div class="col-xs-4 col-sm-2 text-right">
                        {block name='frontend_checkout_cart_item_premium_total_sum_display'}
                            <p>{s name="CartItemInfoFree" namespace='frontend/checkout/cart_item'}{/s}</p>
                        {/block}
                    </div>
                {/block}

                {* Product tax rate *}
                {block name='frontend_checkout_cart_item_premium_tax_price'}{/block}
            </div>
        </div>
    </div>
</div>