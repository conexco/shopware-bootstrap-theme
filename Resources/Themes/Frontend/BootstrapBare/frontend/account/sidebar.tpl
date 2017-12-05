{if ($sUserLoggedIn && !$sOneTimeAccount) || $showSidebar}
    {block name="frontend_account_menu"}
        {block name="frontend_account_menu_panel"}
            <div class="off-canvas-account sw5-plugin">
                {if !{config name=useSltCookie}}
                    {block name="frontend_account_offcanvas_button"}
                        <a href="#"
                           class="btn btn-default d-block d-sm-none d-md-none mbl"
                           data-offcanvas="true"
                           data-offCanvasSelector="#accountSidebar"
                           title="{s name="AccountLinkTitle"}{/s}">
                            {s name="AccountLinkTitle"}{/s}
                            <i class="fa fa-angle-right offcanvas-btn-angle mls"></i>
                        </a>
                    {/block}
                {/if}
                {block name="frontend_account_offcanvas_wrapper"}
                    <div id="accountSidebar" class="account-offcanvas offcanvas-has-panel">
                        <div class="account-menu panel panel-default{if {config name=useSltCookie} && $userInfo && $inHeader} mbn{/if}">
                            {* Sidebar navigation headline *}
                            {block name="frontend_account_menu_title"}
                                <div class="panel-heading hidden-xs hidden-sm">
                                    {if {config name=useSltCookie} && $userInfo}
                                        <h2 class="panel-title navigation-headline">
                                            {block name="frontend_account_menu_greeting"}
                                                {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                                            {/block}
                                        </h2>
                                    {else}
                                        <h2 class="panel-title">{s name="AccountHeaderNavigation"}Mein Konto{/s}</h2>
                                    {/if}
                                </div>
                            {/block}

                            {block name='frontend_account_sidebar_offcanvas_close'}
                                {include file="frontend/_includes/close-offcanvas.tpl" class="offcanvas-account"}
                            {/block}

                            {block name="frontend_account_menu_container"}
                                <div class="list-group">
                                    {block name="frontend_account_menu_list"}
                                        {* Link to the account overview page *}
                                        {block name="frontend_account_menu_link_overview"}
                                            {if {config name=useSltCookie} && !$userInfo && $inHeader}
                                                <li class="navigation-entry list-group-item">
                                                <span class="navigation-signin">
                                                    <a href="{url module='frontend' controller='account'}#hide-registration"
                                                       class="btn btn-primary btn-block navigation-signin-btn{if $register} registration-menu-entry entry-close-off-canvas{/if}"
                                                       data-collapseTarget="#registration"
                                                       data-action="close">
                                                        {s name="AccountLogin"}{/s}
                                                    </a>
                                                    <span class="navigation-register text-center mts">
                                                        {s name="AccountOr"}{/s}
                                                        <a href="{url module='frontend' controller='account'}#show-registration"
                                                           class="text-primary{if $register} registration-menu-entry entry-close-off-canvas{/if}"
                                                           data-collapseTarget="#registration"
                                                           data-action="open">
                                                            {s name="AccountRegister"}{/s}
                                                        </a>
                                                    </span>
                                                </span>
                                                </li>
                                            {/if}
                                            <a href="{url module='frontend' controller='account'}"
                                               title="{s name="AccountLinkOverview"}Übersicht{/s}"
                                               class="list-group-item{if {controllerName|lower} == 'account' && $sAction == 'index'} active{/if}"
                                            " rel="nofollow">
                                            {s name="AccountLinkOverview"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the account profile page *}
                                        {block name="frontend_account_menu_link_profile"}
                                            <a href="{url module='frontend' controller='account' action=profile}"
                                               title="{s name="AccountLinkProfile"}Mein Profil{/s}"
                                               class="list-group-item{if {controllerName|lower} == 'account' && $sAction == 'profile'} active{/if}"
                                               rel="nofollow">
                                                {s name="AccountLinkProfile"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user addresses *}
                                        {block name="frontend_account_menu_link_addresses"}
                                            {if $inHeader}
                                                <a href="{url module='frontend' controller='address' action='index' sidebar=''}"
                                                   title="{s name="AccountLinkAddresses"}{/s}"
                                                   class="navigation-link list-group-item{if {controllerName} == 'address'} active{/if}"
                                                   rel="nofollow">
                                                    {s name="AccountLinkAddresses"}{/s}
                                                </a>
                                            {else}
                                                <a href="{url module='frontend' controller='address' action='index'}"
                                                   title="{s name="AccountLinkAddresses"}My addresses{/s}"
                                                   class="navigation-link list-group-item{if {controllerName} == 'address'} active{/if}"
                                                   rel="nofollow">
                                                    {s name="AccountLinkAddresses"}My addresses{/s}
                                                </a>
                                            {/if}
                                        {/block}

                                        {* Link to the user payment method settings *}
                                        {block name="frontend_account_menu_link_payment"}
                                            <a href="{url module='frontend' controller='account' action='payment'}"
                                               class="list-group-item{if $sAction == 'payment'} active{/if}"
                                               title="{s name="AccountLinkPayment"}Zahlungsart ändern{/s}" rel="nofollow">
                                                {s name="AccountLinkPayment"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user orders *}
                                        {block name="frontend_account_menu_link_orders"}
                                            <a href="{url module='frontend' controller='account' action='orders'}"
                                               class="list-group-item{if $sAction == 'orders'} active{/if}"
                                               title="{s name="AccountLinkPreviousOrders"}Meine Bestellungen{/s}"
                                               rel="nofollow">
                                                {s name="AccountLinkPreviousOrders"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user downloads *}
                                        {block name="frontend_account_menu_link_downloads"}
                                            {if {config name=showEsd}}
                                                <a href="{url module='frontend' controller='account' action='downloads'}"
                                                   class="list-group-item{if $sAction == 'downloads'} active{/if}"
                                                   title="{s name="AccountLinkDownloads"}Meine Sofortdownloads{/s}"
                                                   rel="nofollow">
                                                    {s name="AccountLinkDownloads"}{/s}
                                                </a>
                                            {/if}
                                        {/block}

                                        {* Link to the user product notes *}
                                        {block name="frontend_account_menu_link_notes"}
                                            <a href="{url module='frontend' controller='note'}"
                                               class="list-group-item{if $Controller == 'note'} active{/if}"
                                               title="{s name="AccountLinkNotepad"}Merkzettel{/s}" rel="nofollow">
                                                {s name="AccountLinkNotepad"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the partner statistics *}
                                        {block name="frontend_account_menu_link_partner_statistics"}
                                            {if $sUserLoggedIn && !$sOneTimeAccount && !$inHeader}
                                                {action action="partnerStatisticMenuItem" controller="account"}
                                            {/if}
                                        {/block}

                                        {* Logout action *}
                                        {block name="frontend_account_menu_link_logout"}
                                            {if {config name=useSltCookie} && $userInfo}
                                                {block name="frontend_account_menu_logout_personalized_link"}
                                                    <a href="{url controller='account' action='logout'}"
                                                       title="{s name="AccountLogout"}{/s}"
                                                       class="mtm navigation-link link-logout navigation-personalized account-logout d-block d-sm-none d-md-none{if !$inHeader} mbm btn btn-danger btn-block{else} text-center{/if}">
                                                        {block name="frontend_account_menu_logout_personalized"}
                                                            {block name="frontend_account_menu_logout_personalized_link_user_info"}
                                                                <span class="navigation-logout-personalized">
                                                                    {block name="frontend_account_menu_logout_personalized_link_not_user"}
                                                                        {s name="AccountNot"}{/s}
                                                                    {/block}

                                                                    {block name="frontend_account_menu_logout_personalized_link_user_name"}
                                                                        {$userInfo['firstname']}?
                                                                    {/block}
                                                                </span>
                                                            {/block}

                                                            {block name="frontend_account_menu_logout_personalized_logout_text"}
                                                                <span class="navigation-logout">{s name="AccountLogout"}{/s}</span>
                                                            {/block}
                                                        {/block}
                                                    </a>
                                                {/block}
                                            {elseif $sUserLoggedIn && !$sOneTimeAccount}
                                                {block name="frontend_account_menu_link_logout_standard"}
                                                    {block name="frontend_account_menu_link_logout_standard_link"}
                                                        <a href="{url module='frontend' controller='account' action='logout'}"
                                                           title="{s name="AccountLinkLogout2"}{/s}"
                                                           class="mtm navigation-link link-logout account-logout btn btn-danger btn-block mbm d-block d-sm-none d-md-none"
                                                           rel="nofollow">
                                                            {block name="frontend_account_menu_link_logout_standard_link_text"}
                                                                {s name="AccountLinkLogout2"}{/s}
                                                            {/block}
                                                        </a>
                                                    {/block}
                                                {/block}
                                            {/if}
                                        {/block}
                                    {/block}
                                </div>
                            {/block}
                        </div>
                    </div>
                {/block}
            </div>
        {/block}

        {* Logout action *}
        {block name="frontend_account_menu_link_logout"}
            {if {config name=useSltCookie} && $userInfo}
                <a href="{url controller='account' action='logout'}" title="{s name="AccountLogout"}{/s}"
                   class="navigation-link link-logout navigation-personalized account-logout hidden-xs hidden-sm{if !$inHeader} mbm btn btn-danger btn-block{else} text-center{/if}">
                    {block name="frontend_account_menu_logout_personalized"}
                        <span class="navigation-logout-personalized">
                            {s name="AccountNot"}{/s}
                            {$userInfo['firstname']}?
                        </span>
                        <span class="navigation-logout">{s name="AccountLogout"}{/s}</span>
                    {/block}
                </a>
            {elseif $sUserLoggedIn && !$sOneTimeAccount}
                <a href="{url module='frontend' controller='account' action='logout'}"
                   title="{s name="AccountLinkLogout2"}{/s}"
                   class="navigation-link link-logout account-logout btn btn-danger btn-block {if !$inHeader} mbm{/if} hidden-xs hidden-sm"
                   rel="nofollow">
                    {s name="AccountLinkLogout2"}{/s}
                </a>
            {/if}
        {/block}
    {/block}
{/if}
