{block name='frontend_checkout_ajax_cart'}
    
    {* Offcanvas close button *}
    {block name='frontend_checkout_ajax_cart_buttons_offcanvas'}
        {block name='frontend_checkout_ajax_cart_buttons_offcanvas_inner'}
            {include file="frontend/_includes/close-offcanvas.tpl" class="offcanvas-cart"}
        {/block}
    {/block}
    
    {block name='frontend_checkout_ajax_cart_alert_box'}
        {if $theme.detailOffcanvasCart} 
            {if $basketInfoMessage}
                {include file="frontend/_includes/messages.tpl" visible=false type="info" content=$basketInfoMessage}
            {else}
                {include file="frontend/_includes/messages.tpl" visible=false type="success" content="{s name='AjaxCartSuccessText' namespace='frontend/checkout/ajax_cart'}{/s}"}
            {/if}
        {/if}
    {/block}

    {if $sBasket.content}
        {block name='frontend_checkout_ajax_cart_item_container'}
            {block name='frontend_checkout_ajax_cart_item_container_inner'}
                <div class="ajax-cart-item-wrapper mbl">
                    {foreach name=ajaxbasket from=$sBasket.content item=sBasketItem}
                        {block name='frontend_checkout_ajax_cart_row'}
                            {include file="frontend/checkout/ajax_cart_item.tpl" basketItem=$sBasketItem}
                        {/block}
                    {/foreach}
                </div>
            {/block}
        {/block}

        {block name='frontend_checkout_ajax_cart_prices_container'}
            {if $sBasket.content}
                <div class="prices-container">
                    {block name='frontend_checkout_ajax_cart_prices_container_inner'}
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="prices-articles-text">
                                    {s name="AjaxCartTotalAmount"}{/s}
                                </span>
                            </div>
                            <div class="col-xs-6 text-right">
                                <span class="price price-small price-default prices-articles-amount">
                                    {$sBasket.Amount|currency}
                                </span>
                            </div>
                        </div>
                    {/block}
                    {block name='frontend_checkout_ajax_cart_prices_info'}
                        <p class="small prices-tax">
                            {s name="DetailDataPriceInfo" namespace="frontend/detail/data"}{/s}
                        </p>
                    {/block}
                </div>
            {/if}
        {/block}

        {* Basket link *}
        {block name='frontend_checkout_ajax_cart_button_container'}
            {block name='frontend_checkout_ajax_cart_button_container_inner'}
                {block name='frontend_checkout_ajax_cart_open_basket'}
                    <a href="{url controller='checkout' action='cart'}" class="btn btn-default btn-block btn-sm" title="{s name='AjaxCartLinkBasket'}{/s}">
                        {s name='AjaxCartLinkBasket'}{/s}
                    </a>
                {/block}
                {block name='frontend_checkout_ajax_cart_open_checkout'}
                    {if !($sDispatchNoOrder && !$sDispatches)}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner'}
                            <a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}" class="btn btn-primary btn-block btn-sm" title="{s name='AjaxCartLinkConfirm'}{/s}">
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </a>
                        {/block}
                    {else}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner_disabled'}
                            <button class="btn btn-primary btn-block btn-sm" title="{s name='AjaxCartLinkConfirm'}{/s}" disabled>
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </button>
                        {/block}
                    {/if}
                {/block}
            {/block}
        {/block}
    {else}
        {block name='frontend_checkout_ajax_cart_empty'}
            <p class="text-center mal">{s name='AjaxCartInfoEmpty'}{/s}</p>
        {/block}
    {/if}
{/block}