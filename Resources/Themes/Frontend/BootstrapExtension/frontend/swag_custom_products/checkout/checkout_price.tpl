{block name="frontend_swag_custom_products_checkout_price"}
    {if $price != 0.00}
        {strip}(
            {block name="frontend_swag_custom_products_checkout_price_value"}
                <strong class="custom-product-overview-option-price">
                    + {$price|currency}
                    {if $is_once_surcharge}
                        &nbsp;{s namespace="frontend/detail/option" name="basket/once"}once{/s}
                    {else}
                        &nbsp;/&nbsp;{s namespace="frontend/detail/option" name="basket/per_unit"}unit{/s}
                    {/if}
                    {if !$isCheckoutConfirm}
                        {s name="Star" namespace="frontend/listing/box_article"}{/s}
                    {/if}
                </strong>
            {/block}

            {block name="frontend_swag_custom_products_checkout_price_tax"}
                {if $isCheckoutConfirm && !$isTaxFreeDelivery}
                    ,&nbsp;
                    {if $sUserData.additional.charge_vat && !$sUserData.additional.show_net}
                        {s namespace="frontend/checkout/confirm_header" name='CheckoutColumnExcludeTax'}{/s}
                    {else}
                        {s namespace="frontend/checkout/confirm_header" name='CheckoutColumnTax'}{/s}
                    {/if}
                    &nbsp;{$tax|currency}
                {/if}
            {/block}
        ){/strip}
    {/if}
{/block}