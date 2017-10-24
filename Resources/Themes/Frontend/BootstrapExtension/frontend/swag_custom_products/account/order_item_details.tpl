{namespace name="frontend/account/order_item"}

{block name='frontend_account_order_item_detail_table_row_content_swag_custom_products'}
    <tr class="custom-product-tr custom-product-mode-{$customProductMode}">
        <td colspan="4">
            <span class="custom-product-name">
                {if $customProductMode == 2}
                    <strong>{$article.name}</strong>
                {else}
                    {$article.name}
                {/if}

                {strip}
                    (+ {$article.quantity} x {$article.price|currency}
                    {s name="Star" namespace="frontend/listing/box_article"}{/s})
                {/strip}
            </span>
        </td>
    </tr>
{/block}
