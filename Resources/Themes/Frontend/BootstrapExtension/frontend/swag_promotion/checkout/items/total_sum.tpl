{* Promotion voucher items can be removed *}
{block name='frontend_checkout_cart_item_promotion_voucher_delete'}
    {if $promotionVoucherIds[$sBasketItem.id]}
        <div class="col-sm-4 col-md-3">
        	{block name='frontend_checkout_cart_item_promotion_voucher_delete_link'}
	            <a href="{url action='deletePromotionVoucher' controller='SwagPromotion' voucherId=$promotionVoucherIds[$sBasketItem.id] sTargetAction=$sTargetAction}"
	              title="{"{s name='CartItemLinkDelete' namespace='frontend/checkout/cart_item'}{/s}"|escape}"
	              data-use="deleteArticle" class="btn btn-danger pull-right">
	              {s name='CartItemLinkDelete' namespace='frontend/checkout/cart_item'}{/s}
	              <i class="fa fa-trash-o"></i>
	            </a>
            {/block}  
        </div>
    {/if}
{/block}