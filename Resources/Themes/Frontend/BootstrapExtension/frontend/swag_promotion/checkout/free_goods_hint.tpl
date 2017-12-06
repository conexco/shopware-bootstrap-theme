{namespace name="frontend/swag_promotion/main"}

{block name="checkout_ajax_add_information_promotion_hint"}
    <div class="text-right">
        {block name="checkout_ajax_add_information_promotion_link"}
            <a href="{url action=cart}#promotion-free-goods" title="{s name="freeGoodsLinkBtn"}Gratisartikel wählen{/s}" class="btn btn-outline-secondary">
                {s name="freeGoodsLinkBtn"}{/s}
            </a>
        {/block}
    </div>
{/block}