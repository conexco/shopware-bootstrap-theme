{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb[] = ['name'=>"{s name='MyOrdersTitle'}{/s}", 'link'=>{url}]}
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
                <h2 class="h3 mb-3">{s name="OrdersHeader"}{/s}</h2>
            {/block}

            {block name="frontend_account_orders_welcome_content"}
                <p class="form-text">{s name="OrdersWelcomeText"}{/s}</p>
            {/block}
        {/block}

        {* Orders overview *}
        {block name="frontend_account_orders_overview"}
            {block name="frontend_account_orders_table"}
                <table class="table table-order-list mb-5">
                    {block name="frontend_account_orders_table_head"}
                        <thead>
                            <tr>
                                {block name="frontend_account_orders_table_head_date"}
                                    <th scope="col">
                                        {s name="OrderColumnDate"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_id"}
                                    <th scope="col" 
                                        class="d-none d-sm-block">
                                        {s name="OrderColumnId"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_dispatch"}{/block}
                                {block name="frontend_account_orders_table_head_status"}
                                    <th scope="col">
                                        {s name="OrderColumnStatus"}{/s}
                                    </th>
                                {/block}
                                {block name="frontend_account_orders_table_head_actions"}
                                    <th scope="col">
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