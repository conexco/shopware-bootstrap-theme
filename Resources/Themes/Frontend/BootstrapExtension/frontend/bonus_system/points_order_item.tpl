{block name='frontend_bonus_system_point'}
    <tr>
        {* Order date *}
        {block name="frontend_bonussystem_orders_item_date"}
            <td>

                {block name="frontend_bonussystem_orders_item_date_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_date_value"}
                    {$bonusPosition.ordertime|date:"DATE_MEDIUM"}
                {/block}
            </td>
        {/block}

        {* Order number *}
        {block name="frontend_bonussystem_orders_item_number"}
            <td>

                {block name="frontend_bonussystem_orders_item_number_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_number_value"}
                    {$bonusPosition.ordernumber}
                {/block}
            </td>
        {/block}

        {* Order status *}
        {block name="frontend_bonussystem_orders_item_status"}
            <td>

                {block name="frontend_bonussystem_orders_item_status_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_status_value"}
                    {if $bonusPosition.approval}
                        <span>
                            {s namespace="frontend/plugins/bonus_system/index" name="StatusApprovalClean"}Freigegeben{/s}
                        </span>
                    {else}
                        <span>
                            {s namespace="frontend/plugins/bonus_system/index" name="StatusWaitForApprovalClean"}Warte auf Freigabe{/s}
                        </span>
                    {/if}
                {/block}
            </td>
        {/block}

        {* Order amount *}
        {block name="frontend_bonussystem_orders_item_amount"}
            <td>

                {block name="frontend_bonussystem_orders_item_amount_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_amount_value"}
                    {$bonusPosition.amount|number_format:2:',':'.'}
                {/block}
            </td>
        {/block}

        {* Order spending *}
        {block name="frontend_bonussystem_orders_item_spending"}
            <td class="text-right text-danger">

                {block name="frontend_bonussystem_orders_item_spending_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_spending_value"}
                    <span>-</span>
                    {$bonusPosition.spending}
                {/block}
            </td>
        {/block}

        {* Order earning *}
        {block name="frontend_bonussystem_orders_item_earning"}
            <td class="text-right text-danger">

                {block name="frontend_bonussystem_orders_item_earning_label"}
                {/block}

                {block name="frontend_bonussystem_orders_item_earning_value"}
                    <span>+</span>
                    {$bonusPosition.earning}
                {/block}
            </td>
        {/block}
    </tr>
{/block}