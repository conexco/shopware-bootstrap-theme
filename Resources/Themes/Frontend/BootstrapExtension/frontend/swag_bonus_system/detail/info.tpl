{if $bonusArticle}
    <div class="bonussystem-info sw5-plugin card card-body mtm text-center{if !$sBonusSystem.settings.bonus_system_active} d-none{/if}"
         data-detail-url="{url module=widgets controller=SwagBonusSystem action=articlePoints}"
         data-article-id="{$sArticle.articleID}"
            {if $sArticle.sBlockPrices}
                data-prices="{$sArticle.sBlockPrices|json_encode|escape:"html":null:true}"
            {/if}
         data-price="{$sArticle.price}"
         data-is-bonus-article="true">

        {block name="frontend_detail_bonussystem_points"}
            <input type="hidden" name="earning_points_per_unit" id="earning_points_per_unit" value="{$sArticleEarningPointsPerUnit}"/>
            <input type="hidden" name="conversion_factor" id="conversion_factor" value="{$sConversionFactor}"/>
            {block name="frontend_detail_bonussystem_points_icon"}
                <span class="fa-stack bonussystem-info-orb">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
                </span>
            {/block}

            {block name="frontend_detail_bonussystem_points_info"}
                <span>{s namespace="frontend/detail/buy" name="DetailPointsForArticleBefore"}Jetzt{/s}</span>
                <span class="bonussystem-earning sw5-plugin">{$sArticleEarningPointsCurrent}</span>
                <a href="{url controller=BonusSystem forceSecure}" title="{s namespace="frontend/detail/buy" name="DetailPointsForArticleBefore"}Jetzt{/s} {s namespace="frontend/detail/buy" name="DetailPointsForArticleAfter"}Bonuspunkte sichern{/s}">
                    {s namespace="frontend/detail/buy" name="DetailPointsForArticleAfter"}Bonuspunkte sichern{/s}
                </a>
            {/block}
        {/block}
    </div>
{/if}