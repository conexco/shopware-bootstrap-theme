{block name="widgets_index_actions_bonus"}
    {if $sUserLoggedIn}
        <li class="dropdown top-bar-bonuspoints d-none sw5-plugin" data-points-url="{url module=widgets controller=SwagBonusSystem action=headerPoints}" role="menuitem">
            {block name="widgets_index_actions_bonus_container"}
                <a class="dropdown-toggle bonuspoints-dropdown-btn" href="#" data-toggle="dropdown">
                    {block name="widgets_index_actions_bonus_container_orb"}
                        <span class="fa-stack bonussystem-info-orb">
                        <i class="fa fa-circle fa-stack-2x"></i>
                        <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
                    </span>
                    {/block}
                    {block name="widgets_index_actions_bonus_container_points"}
                        <span class="bonussystem-navigation sw5-plugin">{$sBonusSystem.points.remaining}</span>
                    {/block}
                </a>
                {block name="widgets_index_actions_bonus_list"}
                    <ul class="dropdown-menu pam">
                        {block name="widgets_index_actions_bonus_header"}
                            <div class="alert alert-warning">
                                {block name="widgets_index_actions_bonus_header_top"}
                                    {s namespace="widgets/index/shop_menu" name="YouOwn"}Sie besitzen{/s}
                                {/block}
                                {block name="widgets_index_actions_bonus_header_points"}
                                    <div class="header-entry-points sw5-plugin">{$sBonusSystem.points.remaining}</div>
                                {/block}
                                {block name="widgets_index_actions_bonus_header_points_text"}
                                    {s name="BonusPoints" namespace="frontend/account/content_right"}Bonuspunkte{/s}
                                {/block}
                            </div>
                        {/block}

                        {block name="widgets_index_actions_bonus_points"}
                            {block name="widgets_index_actions_bonus_points_link"}
                                <a class="btn btn-outline-secondary btn-block" href="{url controller=BonusSystem action=points forceSecure}" title="{"{s namespace="widgets/index/shop_menu" name="DisplayUserPointAccount"}Ihr Punktekonto{/s}"|escape}">
                                    {block name="widgets_index_actions_bonus_points_link_text"}
                                        {s namespace="widgets/index/shop_menu" name="DisplayUserPointAccount"}Ihr Punktekonto{/s}
                                    {/block}
                                </a>
                            {/block}
                        {/block}

                        {block name="widgets_index_actions_bonus_articles"}
                            {if $sBonusSystem.settings.bonus_articles_active}
                                {block name="widgets_index_actions_bonus_articles_link"}
                                    <a class="btn btn-outline-secondary btn-block" href="{url controller=BonusSystem forceSecure}" title="{"{s namespace="widgets/index/shop_menu" name="DisplayAllBonusArticlesTitle"}Zu den Bonus-Artikeln{/s}"|escape}">
                                        {block name="widgets_index_actions_bonus_articles_link_text"}
                                            {s namespace="widgets/index/shop_menu" name="DisplayAllBonusArticlesTitle"}Zu den Bonus-Artikeln{/s}
                                        {/block}
                                    </a>
                                {/block}
                            {/if}
                        {/block}
                    </ul>
                {/block}
            {/block}
        </li>
    {/if}
{/block}
