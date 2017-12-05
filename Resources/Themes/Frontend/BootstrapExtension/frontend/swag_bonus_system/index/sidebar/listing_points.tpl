{if $sUserLoggedIn}
	{block name="frontend_bonus_sidebar"}
        <div class="bonussystem-sidebar sw5-plugin">
            <div class="panel panel-default d-block d-xl-none d-lg-none">
                {block name="frontend_bonus_sidebar_header"}
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <span>{s namespace="widgets/index/shop_menu" name="YouOwn"}Sie besitzen{/s}</span>
                            <span class="bonus-header-points sw5-plugin">{$sBonusSystem.points.remaining}</span>
                            <span>{s name="BonusPoints" namespace="frontend/account/content_right"}Bonuspunkte{/s}</span>
                        </h4>
                    </div>
                {/block}

                <div class="list-group">
                    {block name="frontend_bonus_sidebar_points"}
                        <div class="list-group-item sidebar-bonus-menu hidden sw5-plugin">
                            <a href="{url controller=BonusSystem action=points forceSecure}" title="{"{s namespace='widgets/index/shop_menu' name='DisplayUserPointAccount'}Ihr Punktekonto{/s}"|escape}" rel="nofollow">
                                {s namespace='widgets/index/shop_menu' name="DisplayUserPointAccount"}Ihr Punktekonto{/s}
                            </a>
                        </div>
                    {/block}
                    {block name="frontend_bonus_sidebar_bonus_articles"}
                        {if $sBonusSystem.settings.bonus_articles_active}
                            <div class="list-group-item">
                                <a href="{url controller=BonusSystem forceSecure}" title="{"{s namespace='widgets/index/shop_menu' name='DisplayAllBonusArticlesTitle'}Zu den Bonus-Artikeln{/s}"|escape}" rel="nofollow">
                                    {s namespace='widgets/index/shop_menu' name="DisplayAllBonusArticlesTitle"}Zu den Bonus-Artikeln{/s}
                                </a>
                            </div>
                        {/if}
                    {/block}
                </div>
            </div>
        </div>
	{/block}
{/if}