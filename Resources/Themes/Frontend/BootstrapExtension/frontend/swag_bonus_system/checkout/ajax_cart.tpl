{block name="frontend_checkout_ajax_cart_bonus_earning"}
    <div class="mbs">
        <span class="fa-stack bonussystem-info-orb">
            <i class="fa fa-circle fa-stack-2x"></i>
            <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
        </span>
        <span class="text-success">
            <span>{s namespace="frontend/checkout/cart" name="BonusSystemBasketBottomEarningPoints"}Punkte f&uuml;r die Bestellung{/s}:</span>
            {block name="frontend_checkout_ajax_cart_bonus_earning_container"}
                <span>+{$sBonusSystem.points.earning}</span>
            {/block}
        </span>
    </div>
{/block}

{block name="frontend_checkout_ajax_cart_bonus_spending"}
    <div class="mbs">
        <span class="fa-stack bonussystem-info-orb">
            <i class="fa fa-circle fa-stack-2x"></i>
            <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
        </span>
        <span class="text-danger">
            <span>{s namespace="frontend/checkout/cart" name="BonusSystemBasketBottomSpendingPoints"}Punkte eingel&ouml;st{/s}:</span>
            {block name="frontend_checkout_ajax_cart_bonus_spending_container"}
                <span>-{$sBonusSystem.points.spending}</span>
            {/block}
        </span>
    </div>
{/block}