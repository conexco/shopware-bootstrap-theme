{block name='frontend_detail_data_block_prices_start'}
    <div class="block-prices {$sArticle.ordernumber}{if $hidden && !$sArticle.selected} d-none{/if}">
        {block name='frontend_detail_data_block_prices_headline'}
            <div class="h4">
                {s namespace="frontend/detail/data" name="DetailDataHeaderBlockprices"}{/s}
            </div>
        {/block}

        {block name="frontend_detail_data_block_prices_table"}
            <table class="table table-striped table-bordered table-sm">
                {block name="frontend_detail_data_block_prices_table_inner"}
                    {block name="frontend_detail_data_block_prices_table_head"}
                        <thead>
                            {block name="frontend_detail_data_block_prices_table_head_inner"}
                                <tr>
                                    {block name="frontend_detail_data_block_prices_table_head_row"}
                                        {block name="frontend_detail_data_block_prices_table_head_cell_quantity"}
                                            <th scope="col">{s namespace="frontend/detail/data" name="DetailDataColumnQuantity"}{/s}</th>
                                        {/block}
                                        {block name="frontend_detail_data_block_prices_table_head_cell_price"}
                                            <th scope="col">{s namespace="frontend/detail/data" name="DetailDataColumnPrice"}{/s}</th>
                                        {/block}
                                    {/block}
                                </tr>
                            {/block}
                        </thead>
                    {/block}

                    {block name="frontend_detail_data_block_prices_table_body"}
                        <tbody class="block-prices-body sw5-plugin">
                            {block name="frontend_detail_data_block_prices_table_body_inner"}
                                {foreach from=$sArticle.sBlockPrices item=row key=key}
                                    {block name='frontend_detail_data_block_prices'}
                                        <tr class="block-prices-row sw5-plugin" 
                                            itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                            {block name="frontend_detail_data_block_prices_table_body_row"}
                                                {block name="frontend_detail_data_block_prices_table_body_cell_quantity"}
                                                    <td>
                                                        <meta itemprop="priceCurrency" content="{$Shop->getCurrency()->getCurrency()}" />
                                                        <meta itemprop="price" content="{$row.price}" />
                                                        <link itemprop="availability" href="http://schema.org/InStock" />

                                                        {if $row.from=="1"}
                                                            {s namespace="frontend/detail/data" name="DetailDataInfoUntil"}{/s}
                                                            <span class="block-prices-quantity">{$row.to}</span>
                                                        {else}
                                                            {s namespace="frontend/detail/data" name="DetailDataInfoFrom"}{/s}
                                                            <span class="block-prices-quantity">{$row.from}</span>
                                                        {/if}
                                                    </td>
                                                {/block}
                                                {block name="frontend_detail_data_block_prices_table_body_cell_price"}
                                                    <td>
                                                        <strong>
                                                            {$row.price|currency}*
                                                        </strong>
                                                    </td>
                                                {/block}
                                            {/block}
                                        </tr>
                                    {/block}
                                {/foreach}
                            {/block}
                        </tbody>
                    {/block}
                {/block}
            </table>
        {/block}
    </div>
{/block}
