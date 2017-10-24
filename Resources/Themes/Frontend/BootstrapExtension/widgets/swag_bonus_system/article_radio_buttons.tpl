{if $sBonusSystem.settings.bonus_articles_active && $bonusArticle}
    {if $sDisplayRadios}
        {block name="frontend_detail_bonussystem_radio_money"}
            <div class="bonussystem-radio-item sw5-plugin" data-is-bonus="false">
                <div class="radio">
                    <label for="bonussystem-buyfor-money">
                        <span class="bonussystem-radio-container js-radio-is-active sw5-plugin">
                            <input id="bonussystem-buyfor-money" class="radio" type="radio" name="buy_for" value="euro" checked="checked" />
                        </span>
                        {s namespace="frontend/detail/buy" name="BuyForPointsAddFor"}F&uuml;r je {/s}
                        {if $sArticleLiveShopping}
                            <strong>{$sArticle["liveshopping"]["currentPrice"]|currency}</strong>
                        {else}
                            <strong class="price-holder sw5-plugin"></strong>
                        {/if}
                        {s namespace="frontend/detail/buy" name="BuyForPointsCart"} in den Warenkorb{/s}
                    </label>
                </div>
            </div>
        {/block}

        {block name="frontend_detail_bonussystem_radio_points"}
            <div class="bonussystem-radio-item sw5-plugin" data-is-bonus="true">
                <div class="radio">
                    <label for="bonussystem-buyfor-points">
                        <span class="bonussystem-radio-container sw5-plugin">
                            <input id="bonussystem-buyfor-points" class="radio" type="radio" name="buy_for" value="points"/>
                        </span>
                        {s namespace="frontend/detail/buy" name="BuyForPointsAddFor"}F&uuml;r je {/s}
                        <strong>{$sArticleRequiredPoints} Bonuspunkte</strong>
                        {s namespace="frontend/detail/buy" name="BuyForPointsCart"} in den Warenkorb{/s}
                    </label>
                </div>
            </div>
        {/block}
    {/if}

    {block name="frontend_detail_bonussystem_data"}
        <input type="hidden" id="user_points" value="{$sBonusSystem.points.remaining}"/>
        <input type="hidden" id="round_type" value="{$sBonusSystem.settings.bonus_point_round_type}"/>
        <input type="hidden" id="bonus_point_conversion_factor" value="{$sBonusSystem.settings.bonus_point_conversion_factor}"/>
        <input type="hidden" name="points_per_unit" id="points_per_unit" value="{$sArticleRequiredPoints}"/>
        <input type="hidden" name="bonus_exclude" id="bonus_exclude" value="{$sBonusExclude}"/>
        <input type="hidden" name="toBasket" value="1"/>
    {/block}
{/if}