{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb[] = ['name' => "{s name='MyOrdersTitle'}{/s}", 'link' => {url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Orders overview *}
    {if !$sOpenOrders}
        {block name="frontend_account_orders_info_empty"}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='OrdersInfoEmpty'}{/s}"}
        {/block}
    {else}
        {* Welcome text *}
        {block name="frontend_account_orders_welcome"}
            {block name="frontend_account_orders_welcome_headline"}
                <h1>{s name="OrdersHeader"}{/s}</h1>
            {/block}

            {block name="frontend_account_orders_welcome_content"}
                <p>{s name="OrdersWelcomeText"}{/s}</p>
            {/block}
        {/block}
        {* Orders overview *}
        {block name="frontend_account_orders_overview"}
            {block name="frontend_account_orders_table"}
                <table class="table table-order-list">
                    {block name="frontend_account_orders_table_head"}
                        <thead>
                            <tr>
                                {block name="frontend_account_orders_table_head_date"}
                                    <th>
                                        {s name="OrderColumnDate"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_id"}
                                    <th class="hidden-xs">
                                        {s name="OrderColumnId"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_dispatch"}
                                    <th>
                                        {s name="OrderColumnDispatch"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_status"}
                                    <th>
                                        {s name="OrderColumnStatus"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_actions"}
                                    <th>
                                        {s name="OrderColumnActions"}{/s}
                                    </th>
                                {/block}
                            </tr>
                        </thead>
                    {/block}
                    {block name="frontend_account_order_item_overview"}
                        <tbody>
                            {foreach $sOpenOrders as $offerPosition}
                                {include file="frontend/account/order_item.tpl"}
                            {/foreach}
                        </tbody>
                    {/block}
                </table>
            {/block}
            {block name="frontend_account_orders_actions_paging"}
                {assign var=sPage value=1}
                {foreach from=$sPages.numbers item=page}
                    {if $page.markup}
                        {assign var=sPage value=$page.value}
                    {/if}
                {/foreach}

                {block name='frontend_account_orders_actions_paging_count'}
                    {if $sNumberPages > 1}
                        {include file="frontend/listing/actions/action-pagination.tpl" pages=$sNumberPages}
                    {/if}
                {/block}
            {/block}
        {/block}
    {/if}
{/block}