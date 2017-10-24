{block name="frontend_bonussystem_orders"}

	{block name="frontend_bonussystem_orders_headline"}
	    <h3>{s namespace="frontend/plugins/bonus_system/points" name="Orders"}Bestellungen{/s}</h3>
	{/block}

	{block name="frontend_bonussystem_orders_table"}
        <table class="table tabel-striped table-responsive">
			{block name="frontend_bonussystem_orders_table_head"}
                <thead>
                    <tr>
                        {block name="frontend_bonussystem_orders_table_head_date"}
                            <th>
                                {s namespace="frontend/plugins/bonus_system/index" name="BonusColumnDate"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_orders_table_head_number"}
                            <th>
                                {s namespace="frontend/plugins/bonus_system/index"  name="BonusColumnOrdernumber"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_orders_table_head_status"}
                            <th>
                                {s namespace="frontend/plugins/bonus_system/index"  name="BonusColumnStatus"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_orders_table_head_amount"}
                            <th>
                                {s namespace="frontend/plugins/bonus_system/index" name="BonusColumnAmount"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_orders_table_head_spending"}
                            <th class="text-right">
                                {s namespace="frontend/plugins/bonus_system/index" name="Spending"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_orders_table_head_earning"}
                            <th class="text-right">
                                {s namespace="frontend/plugins/bonus_system/index" name="Earning"}{/s}
                            </th>
                        {/block}
                    </tr>
                </thead>
			{/block}

			{block name="frontend_bonussystem_orders_items"}
                <tbody>
                    {foreach name=bonusitems from=$bonusOrders item=bonusPosition}
                        {if $smarty.foreach.bonusitems.last}
                            {$lastitem=1}
                        {else}
                            {$lastitem=0}
                        {/if}

                        {block name="frontend_bonussystem_orders_item"}
                            {include file="frontend/bonus_system/points_order_item.tpl" lastitem=$lastitem}
                        {/block}
                    {/foreach}
                </tbody>
			{/block}
		</table>
	{/block}
{/block}