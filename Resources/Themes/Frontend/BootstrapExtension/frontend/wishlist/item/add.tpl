{* 
form needs to be wrapped around cart btn, otherwise compare btn doesn't work anymore
=> form in form 
original SW: form is in /wishlist/item_form.tpl
*}
<form data-add-article="true"
      name="sAddToBasket-{$item.id}"
      method="post"
      data-eventName="submit"
      {if $theme.offcanvasCart}
        data-showModal="false"
        data-addArticleUrl="{url controller=checkout action=ajaxAddArticleCart}"
      {/if}
    >

    <input type="hidden" name="sAdd" value="{$item.article.ordernumber}">
    <div class="advancedCart-buybox">
        {if $item.article.isAvailable == 1}
            <button class="buybox-button btn btn-primary btn-block item-id-{$item.id}">
                {s namespace="frontend/plugins/swag_advanced_cart/plugin" name='AddToCart'}Add to Basket{/s}
            </button>
        {else}
            {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace="frontend/plugins/swag_advanced_cart/plugin" name="CurrentlyUnavailable"}Product currently unavailable{/s}"}
        {/if}
    </div>
    
</form>