{block name='frontend_account_partner_statistic_item_overview_row'}
    <tr>
        <td>
            {$partnerOrder.orderTime|date:DATE_SHORT}
        </td>
        <td>
            {$partnerOrder.number}
        </td>
        <td class="text-right">
            {$partnerOrder.netTurnOver|currency}
        </td>
        <td class="text-right">
            {$partnerOrder.provision|currency}
        </td>
    </tr>

    {if $lastitem}
        <tr>
            <td>
                <strong>
                    {s name="PartnerStatisticItemSum"}Gesamt:{/s}
                </strong>
            </td>
            <td>
            </td>
            <td class="text-right">
                <strong>
                    {$sTotalPartnerAmount.netTurnOver|currency}
                </strong>
            </td>
            <td class="text-right">
                <strong>
                    {$sTotalPartnerAmount.provision|currency}
                </strong>
            </td>
        </tr>
    {/if}
{/block}