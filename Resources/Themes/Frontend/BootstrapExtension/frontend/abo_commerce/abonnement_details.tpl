{namespace name="frontend/abo_commerce/orders"}

<div id="order{$order.lastOrder.number}{$order.id}" class="collapse">
{block name="frontend_account_abonnement_item_detail_table"}
	{block name="frontend_account_abonnement_item_detail_id"}
		<input type="hidden" name="sAddAccessories" value="{$order.lastOrder.number|escape}" />
	{/block}
    <table class="table table-bordered table-responsive">
        {block name="frontend_account_abonnement_item_detail_table_head"}
            <thead>
                <tr>
                    {block name="frontend_account_abonnement_item_detail_table_head_name"}
                        <th>{s name="AboCommerceOrdersArticle"}Artikel{/s}</th>
                    {/block}

                    {block name="frontend_account_abonnement_item_detail_table_head_article_number"}
                        <th>{s name="AboCommerceOrdersArticleNumber"}Artikelnummer{/s}</th>
                    {/block}

                    {block name="frontend_account_abonnement_item_detail_table_head_quantity"}
                        <th>{s name="AboCommerceOrdersQuantity"}Anzahl{/s}</th>
                    {/block}

                    {block name="frontend_account_abonnement_item_detail_table_head_total"}
                        <th>{s name="AboCommerceOrdersSum"}Summe{/s}</th>
                    {/block}
                </tr>
            </thead>
        {/block}

        {block name="frontend_account_abonnement_item_detail_table_rows"}
            <tbody>
                {block name="frontend_account_abonnement_item_detail_table_row_main"}
                    <tr>
                        {block name="frontend_account_abonnement_item_info"}
                            <td>
                                {* Name *}
                                {block name="frontend_account_abonnement_item_name"}
                                    <strong>{$order.articleOrderDetail.articleName}</strong>
                                {/block}
                            </td>
                        {/block}

                        {* Abonnement item article number *}
                        {block name='frontend_account_abonnement_item_article_number'}
                            <td>
                                {block name='frontend_account_abonnement_item_article_number_label'}{/block}

                                {block name='frontend_account_abonnement_item_article_number_value'}
                                    <div>{$order.articleOrderDetail.articleNumber}</div>
                                {/block}
                            </td>
                        {/block}

                        {* Abonnement item quantity *}
                        {block name='frontend_account_abonnement_item_quantity'}
                            <td>
                                {block name='frontend_account_abonnement_item_quantity_label'}{/block}

                                {block name='frontend_account_abonnement_item_quantity_value'}
                                    <div>{$order.articleOrderDetail.quantity}x</div>
                                {/block}
                            </td>
                        {/block}

                        {* Abonnement items total amount *}
                        {block name='frontend_account_abonnement_item_amount'}
                            <td>
                                {block name='frontend_account_abonnement_item_amount_label'}{/block}

                                {block name='frontend_account_abonnement_item_amount_value'}
                                    <strong>{"{$order.articleOrderDetail.price * $order.articleOrderDetail.quantity}"|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</strong>
                                {/block}
                            </td>
                        {/block}
                    </tr>
                {/block}

                {if $order.discountOrderDetail}
                    {block name="frontend_account_abonnement_item_detail_table_row_discount"}
                        <tr>
                            {block name="frontend_account_abonnement_item_info"}
                                <td>
                                    {* Name *}
                                    {block name="frontend_account_abonnement_item_name"}
                                        <strong>{s name="AboCommerceOrdersAboRebate"}Abo-Rabatt{/s}</strong>
                                    {/block}
                                </td>
                            {/block}

                            {* Abonnement item article number *}
                            {block name='frontend_account_abonnement_item_article_number'}
                                <td>
                                    {block name='frontend_account_abonnement_item_article_number_label'}{/block}

                                    {block name='frontend_account_abonnement_item_article_number_value'}
                                        <div>{$order.discountOrderDetail.articleNumber}</div>
                                    {/block}
                                </td>
                            {/block}

                            {* Abonnement item quantity *}
                            {block name='frontend_account_abonnement_item_quantity'}
                                <td>
                                    {block name='frontend_account_abonnement_item_quantity_label'}{/block}

                                    {block name='frontend_account_abonnement_item_quantity_value'}
                                        <div>{$order.discountOrderDetail.quantity}x</div>
                                    {/block}
                                </td>
                            {/block}

                            {* Abonnement item total amount *}
                            {block name='frontend_account_abonnement_item_amount'}
                                <td>
                                    {block name='frontend_account_abonnement_item_amount_label'}{/block}

                                    {block name='frontend_account_abonnement_item_amount_value'}
                                        <strong>{$order.discountOrderDetail.price|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</strong>
                                    {/block}
                                </td>
                            {/block}
                        </tr>
                    {/block}
                {/if}

                {include file="frontend/abo_commerce/abonnement_footer.tpl"}
                {include file="frontend/abo_commerce/abonnement_shipping.tpl"}
            </tbody>
        {/block}
    </table>
{/block}
</div>