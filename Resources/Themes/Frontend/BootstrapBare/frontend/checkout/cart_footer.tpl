{block name='frontend_checkout_cart_footer_element'}
    <div class="row mb-4">
        {block name='frontend_checkout_cart_cart_footer_left'}
            <div class="col-12 col-md-6 col-lg-8">
                {if $sTargetAction != 'shippingPayment'}
                    <div class="row">
                        {* Add product using a voucher *}
                        {block name='frontend_checkout_cart_footer_add_voucher'}
                            <div class="col-lg-6 mb-4">
                                <form method="post" action="{url action='addVoucher' sTargetAction=$sTargetAction}">
                                    <div class="input-group">
                                        {block name='frontend_checkout_cart_footer_add_voucher_field'}
                                            <input type="text" class="form-control" id="basket_add_voucher"
                                                   name="sVoucher"
                                                   placeholder="{s name='CheckoutFooterAddVoucherLabelInline' namespace='frontend/checkout/cart_footer_left'}{/s}">
                                        {/block}
                                        {block name='frontend_checkout_cart_footer_add_voucher_button'}
                                            <span class="input-group-btn">
                                                <button class="btn btn-outline-secondary" type="submit">
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
                            <div class="col-lg-6 mb-4">
                                <form method="post" action="{url action='addArticle' sTargetAction=$sTargetAction}">
                                    <div class="input-group">
                                        {block name='frontend_checkout_cart_footer_add_product_field'}
                                            <input id="basket_add_article" class="form-control" name="sAdd" type="text"
                                                   placeholder="{s name='CheckoutFooterAddProductPlaceholder' namespace='frontend/checkout/cart_footer_left'}{/s}"/>
                                        {/block}
                                        {block name='frontend_checkout_cart_footer_add_product_button'}
                                            <span class="input-group-btn">
                                                <button class="btn btn-outline-secondary" type="submit">
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
            <div class="col-md-6 col-lg-4">
                <div class="row">
                    {block name='frontend_checkout_cart_footer_tax_information'}{/block}

                    {* Field labels *}
                    {block name='frontend_checkout_cart_footer_field_labels'}

                        {* Basket sum *}
                        {block name='frontend_checkout_cart_footer_field_labels_sum'}
                            {block name='frontend_checkout_cart_footer_field_labels_sum_label'}
                                <div class="col-8">{s name="CartFooterLabelSum"}{/s}</div>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_sum_value'}
                                <div class="col-4 text-right">{$sBasket.Amount|currency}</div>
                            {/block}
                        {/block}

                        {* Shipping costs *}
                        {block name='frontend_checkout_cart_footer_field_labels_shipping'}
                            {block name='frontend_checkout_cart_footer_field_labels_shipping_label'}
                                <div class="col-8">{s name="CartFooterLabelShipping"}{/s}</div>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_shipping_value'}
                                <div class="col-4 text-right">{$sShippingcosts|currency}</div>
                            {/block}
                        {/block}

                        {* Total sum *}
                        {block name='frontend_checkout_cart_footer_field_labels_total'}
                            {block name='frontend_checkout_cart_footer_field_labels_total_label'}
                                <div class="col-8 font-weight-bold">{s name="CartFooterLabelTotal"}{/s}</div>
                            {/block}
                            {block name='frontend_checkout_cart_footer_field_labels_total_value'}
                                <div class="col-4 text-right font-weight-bold">{if $sAmountWithTax && $sUserData.additional.charge_vat}{$sAmountWithTax|currency}{else}{$sAmount|currency}{/if}</div>
                            {/block}
                        {/block}

                        {* Total net *}
                        {block name='frontend_checkout_cart_footer_field_labels_totalnet'}
                            {if $sUserData.additional.charge_vat}
                                {block name='frontend_checkout_cart_footer_field_labels_totalnet_label'}
                                    <div class="col-8">{s name="CartFooterTotalNet"}{/s}</div>
                                {/block}
                                {block name='frontend_checkout_cart_footer_field_labels_totalnet_value'}
                                    <div class="col-4 text-right align-self-end">{$sAmountNet|currency}</div>
                                {/block}

                                {* Taxes *}
                                {block name='frontend_checkout_cart_footer_field_labels_taxes'}
                                    {foreach $sBasket.sTaxRates as $rate=>$value}
                                        {block name='frontend_checkout_cart_footer_field_labels_taxes_entry'}
                                            {block name='frontend_checkout_cart_footer_field_labels_taxes_label'}
                                                <div class="col-8">{s name="CartFooterTotalTax"}{/s}</div>
                                            {/block}
                                            {block name='frontend_checkout_cart_footer_field_labels_taxes_value'}
                                                <div class="col-4 text-right">{$value|currency}</div>
                                            {/block}
                                        {/block}
                                    {/foreach}
                                {/block}
                            {/if}
                        {/block}
                    {/block}
                </div>
            </div>
        {/block}
    </div>
{/block}
