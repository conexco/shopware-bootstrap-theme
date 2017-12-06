{namespace name="frontend/checkout/ajax_cart"}

{block name='frontend_checkout_ajax_cart_row_inner'}
    {if $sBasketItem.additional_details.sConfigurator}
        {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber}}
    {else}
        {$detailLink=$sBasketItem.linkDetails}
    {/if}

    <div class="row mbm">
        {block name='frontend_checkout_ajax_cart_articleimage'}
            <div class="col-xs-3">
                {block name='frontend_checkout_ajax_cart_articleimage_product'}
                    {if $sBasketItem.modus == 0 || $sBasketItem.modus == 1}
                        {$desc = $sBasketItem.articlename|escapeHtml}
                        {if $sBasketItem.additional_details.image.thumbnails}
                            {if $sBasketItem.additional_details.image.description}
                                {$desc = $sBasketItem.additional_details.image.description|escape}
                            {/if}
                            <img srcset="{$sBasketItem.additional_details.image.thumbnails[0].sourceSet}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-center img-fluid" />
                        {elseif $sBasketItem.image.src.0}
                            <img src="{$sBasketItem.image.src.0}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-center img-fluid" />
                        {/if}
                    {/if}
                {/block}
            </div>
        {/block}

        {block name='frontend_checkout_ajax_cart_articlename'}
            <div class="col-xs-9">
                <div class="row mbm">    
                    {block name="frontend_checkout_ajax_cart_articlename_name"}
                        <div class="col-xs-10">
                            <a href="{$detailLink}" class="small" title="{$sBasketItem.articlename|strip_tags}">
                                {$sBasketItem.articlename|truncate:30|escapeHtml}
                            </a>
                        </div>
                    {/block}

                    {block name='frontend_checkout_ajax_cart_actions'}
                        <div class="col-xs-2 text-right">
                            {$deleteUrl = {url controller="checkout" action="ajaxDeleteArticleCart" sDelete=$basketItem.id}}

                            {if $basketItem.modus == 2}
                                {$deleteUrl = {url controller="checkout" action="ajaxDeleteArticleCart" sDelete="voucher"}}
                            {/if}
                            {if $sBasketItem.modus != 4}
                                {block name="frontend_checkout_modify_ajax_cart_delete_article"}
                                    <form action="{$deleteUrl}" method="post">
                                        <button type="submit" class="btn btn-link btn-sm ptn delete-article" title="{s name="AjaxCartRemoveArticle"}{/s}">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                {/block}
                            {/if}
                        </div>
                    {/block}
                </div>

                <div class="row">
                    {block name="frontend_checkout_ajax_cart_articlename_quantity"}
                        {if $sBasketItem.modus == 0}
                            <div class="col-xs-6">
                                {block name="frontend_checkout_modify_ajax_cart_change_quantity"}
                                    <form class="change-quantity" id="change-quantity-{$sBasketItem.id}" name="change-quantity-{$sBasketItem.id}">
                                        <select class="form-control" name="sQuantity">
                                            {for $i=1 to $sBasketItem.maxpurchase step $sBasketItem.purchasesteps}
                                                <option value="{$i}" {if $i == $sBasketItem.quantity}selected{/if}>{$i}</option>
                                            {/for}
                                        </select>
                                        <input type="hidden" name="sArticle" value="{$sBasketItem.id}"/>
                                    </form>
                                {/block}
                            </div>
                        {/if}
                    {/block}

                    {block name="frontend_checkout_ajax_cart_articlename_price"}
                        <div class="{if $sBasketItem.modus == 0}col-xs-6{else}col-xs-12{/if} text-right">
                            <p class="price price-small price-default">
                                {if $sBasketItem.amount}
                                    {$sBasketItem.amount|currency}
                                {else}
                                    {s name="AjaxCartInfoFree"}{/s}
                                {/if}
                                {s name="Star" namespace="frontend/listing/box_article"}{/s}
                            </p>
                        </div>  
                    {/block}
                </div>
            </div>
        {/block}
    </div>
{/block}