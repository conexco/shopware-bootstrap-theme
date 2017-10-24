{block name="frontend_checkout_bonussystem_points_earning"}
    {block name="frontend_checkout_bonussystem_points_earning_label"}
        <dt>{s namespace="frontend/checkout/cart" name="BonusSystemBasketBottomEarningPoints"}Punkte f&uuml;r die Bestellung{/s}:</dt>
    {/block}

    {block name="frontend_checkout_bonussystem_points_earning_value"}
        <dd>+{$sBonusSystem.points.earning} P</dd>
    {/block}
{/block}

{block name="frontend_checkout_bonussystem_points_spending"}
    {block name="frontend_checkout_bonussystem_points_spending_label"}
        <dt>{s namespace="frontend/checkout/cart" name="BonusSystemBasketBottomSpendingPoints"}Punkte eingel&ouml;st{/s}:</dt>
    {/block}

    {block name="frontend_checkout_bonussystem_points_spending_value"}
        <dd>-{$sBonusSystem.points.spending} P</dd>
    {/block}
{/block}