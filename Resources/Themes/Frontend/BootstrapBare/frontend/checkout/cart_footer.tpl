{block name='frontend_checkout_cart_footer_element'}
    <div class="row mtl">
        {block name='frontend_checkout_cart_cart_footer_left'}
            <div class="col-sm-12 col-hd-6 col-md-8">
                {if $sTargetAction != 'shippingPayment'}
                    <div class="row mtl">
                        {* Add product using a voucher *}
                        {block name='frontend_checkout_cart_footer_add_voucher'}
                            <div class="col-sm-6 col-hd-12 col-md-6">
                                <form method="post" action="{url action='addVoucher' sTargetAction=$sTargetAction}">
                                    <div class="input-group">
                                        {block name='frontend_checkout_cart_footer_add_voucher_field'}
                                            <input type="text" class="form-control" id="basket_add_voucher" name="sVoucher" placeholder="{s name='CheckoutFooterAddVoucherLabelInline' namespace='frontend/checkout/cart_footer_left'}{/s}">
                                        {/block}
                                        {block name='frontend_checkout_cart_footer_add_voucher_button'}
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </span>
                                        {/block}
                                    </div>
                                </form>
                            </div>
                        {/block}

                        {* Add product using the sku *}
                        {block name='frontend_checkout_cart_footer_add_product'}
                            <div class="col-sm-6 col-hd-12 col-md-6 mtm-xs mtm-hd">
                                <form method="post" action="{url action='addArticle' sTargetAction=$sTargetAction}">
                                    <div class="input-group">
                                        {block name='frontend_checkout_cart_footer_add_product_field'}
                                            <input id="basket_add_article" class="form-control" name="sAdd" type="text" placeholder="{s name='CheckoutFooterAddProductPlaceholder' namespace='frontend/checkout/cart_footer_left'}{/s}"/>
                                        {/block}
                                        {block name='frontend_checkout_cart_footer_add_product_button'}
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </span>
                                        {/block}
                                    </div>
                                </form>
                            </div>
                        {/block}
                    </div>
                {/if}    
                    
                {* Shipping costs pre-calculation *}
                {if $sBasket.content && !$sUserLoggedIn && !$sUserData.additional.user.id && {config name=basketShowCalculation}}
                    {block name='frontend_checkout_shipping_costs_country_include'}
                        {include file="frontend/checkout/shipping_costs.tpl"}
                    {/block}
                {/if}
            </div>
        {/block}

        {block name='frontend_checkout_cart_cart_footer_right'}
            <div class="col-sm-12 col-hd-6 col-md-4">
                {block name='frontend_checkout_cart_footer_tax_information'}{/block}

                {* Field labels *}
                {block name='frontend_checkout_cart_footer_field_labels'}
                    <dl class="dl-horizontal dl-checkout mtl">
                        {* Basket sum *}
                        {block name='frontend_checkout_cart_footer_field_labels_sum'}
                            {block name='frontend_checkout_cart_footer_field_labels_sum_label'}
                                <dt>{s name="CartFooterLabelSum"}{/s}</dt>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_sum_value'}
                                <dd>{$sBasket.Amount|currency}</dd>
                            {/block}
                        {/block}

                        {* Shipping costs *}
                        {block name='frontend_checkout_cart_footer_field_labels_shipping'}
                            {block name='frontend_checkout_cart_footer_field_labels_shipping_label'}
                                <dt>{s name="CartFooterLabelShipping"}{/s}</dt>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_shipping_value'}
                                <dd>{$sShippingcosts|currency}</dd>
                            {/block}
                        {/block}

                        {* Total sum *}
                        {block name='frontend_checkout_cart_footer_field_labels_total'}
                            {block name='frontend_checkout_cart_footer_field_labels_total_label'}
                                <dt>{s name="CartFooterLabelTotal"}{/s}</dt>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_total_value'}
                                <dd>{if $sAmountWithTax && $sUserData.additional.charge_vat}{$sAmountWithTax|currency}{else}{$sAmount|currency}{/if}</dd>
                            {/block}
                        {/block}

                        {* Total net *}
                        {block name='frontend_checkout_cart_footer_field_labels_totalnet'}
                            {if $sUserData.additional.charge_vat}
                                {block name='frontend_checkout_cart_footer_field_labels_totalnet_label'}
                                    <dt>{s name="CartFooterTotalNet"}{/s}</dt>
                                {/block}
                                {block name='frontend_checkout_cart_footer_field_labels_totalnet_value'}
                                    <dd>{$sAmountNet|currency}</dd>
                                {/block}

                                {* Taxes *}
                                {block name='frontend_checkout_cart_footer_field_labels_taxes'}
                                    {foreach $sBasket.sTaxRates as $rate=>$value}
                                        {block name='frontend_checkout_cart_footer_field_labels_taxes_entry'}
                                            {block name='frontend_checkout_cart_footer_field_labels_taxes_label'}
                                                <dt>{s name="CartFooterTotalTax"}{/s}</dt>
                                            {/block}
                                            {block name='frontend_checkout_cart_footer_field_labels_taxes_value'}
                                                <dd>{$value|currency}</dd>
                                            {/block}
                                        {/block}
                                    {/foreach}
                                {/block}
                            {/if}
                        {/block}
                    </dl>
                {/block}
            </div>
        {/block}
    </div>
{/block}
