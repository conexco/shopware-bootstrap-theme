{if ($sUserLoggedIn && !$sOneTimeAccount) || $showSidebar}
    {block name="frontend_account_menu"}
        {block name="frontend_account_menu_panel"}
            <div class="off-canvas-account">
                {if !{config name=useSltCookie}}
                    {block name="frontend_account_offcanvas_button"}
                        <a href="#"
                           class="btn btn-outline-secondary d-md-none mbl"
                           data-offcanvas="true"
                           data-offCanvasSelector="#accountSidebar"
                           title="{s name="AccountLinkTitle"}{/s}">
                            {s name="AccountLinkTitle"}{/s}
                            <i class="fa fa-angle-right offcanvas-btn-angle mls"></i>
                        </a>
                    {/block}
                {/if}

                {block name="frontend_account_offcanvas_wrapper"}
                    <div id="accountSidebar" class="account-offcanvas">
                        <div class="account-menu{if !$inHeader} card{/if}">
                            {* Sidebar navigation headline *}
                            {block name="frontend_account_menu_title"}
                                <div class="card-header">    
                                    {if {config name=useSltCookie} && $userInfo}
                                        <h2 class="card-title mb-0 h5">
                                            {block name="frontend_account_menu_greeting"}
                                                {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                                            {/block}
                                        </h2>
                                    {else}
                                        <h2 class="card-title mb-0 h5">
                                            {s name="AccountHeaderNavigation"}Mein Konto{/s}
                                        </h2>
                                    {/if}
                                </div>
                            {/block}

                            {block name='frontend_account_sidebar_offcanvas_close'}
                                {include file="frontend/_includes/close-offcanvas.tpl" class="offcanvas-account"}
                            {/block}

                            {block name="frontend_account_menu_container"}
                                <div class="list-group list-group-flush">
                                    {block name="frontend_account_menu_list"}
                                        {* Link to the account overview page *}
                                        {block name="frontend_account_menu_link_overview"}
                                            {if {config name=useSltCookie} && !$userInfo && $inHeader}
                                                <li class="list-group-item">
                                                    <a href="{url module='frontend' controller='account'}#hide-registration"
                                                       class="btn btn-primary btn-block btn-sm mb-2">
                                                        {s name="AccountLogin"}{/s}
                                                    </a>

                                                    <div class="text-center small">
                                                        {s name="AccountOr"}{/s}
                                                        <a href="{url module='frontend' controller='account'}#show-registration"
                                                           class="text-primary">
                                                            {s name="AccountRegister"}{/s}
                                                        </a>
                                                    </div>
                                                </li>
                                            {/if}

                                            <a href="{url module='frontend' controller='account'}"
                                               title="{s name="AccountLinkOverview"}Übersicht{/s}"
                                               class="list-group-item list-group-item-action{if {controllerName|lower} == 'account' && $sAction == 'index'} active{/if}"
                                            " rel="nofollow">
                                            {s name="AccountLinkOverview"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the account profile page *}
                                        {block name="frontend_account_menu_link_profile"}
                                            <a href="{url module='frontend' controller='account' action=profile}"
                                               title="{s name="AccountLinkProfile"}Mein Profil{/s}"
                                               class="list-group-item list-group-item-action{if {controllerName|lower} == 'account' && $sAction == 'profile'} active{/if}"
                                               rel="nofollow">
                                                {s name="AccountLinkProfile"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user addresses *}
                                        {block name="frontend_account_menu_link_addresses"}
                                            <a 
                                               title="{s name="AccountLinkAddresses"}{/s}"
                                               {if $inHeader}
                                               href="{url module='frontend' controller='address' action='index' sidebar=''}"
                                               {else}
                                               href="{url module='frontend' controller='address' action='index'}"
                                               {/if}
                                               class="list-group-item list-group-item-action{if {controllerName} == 'address'} active{/if}"
                                               rel="nofollow">
                                                {s name="AccountLinkAddresses"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user payment method settings *}
                                        {block name="frontend_account_menu_link_payment"}
                                            <a href="{url module='frontend' controller='account' action='payment'}"
                                               class="list-group-item list-group-item-action{if $sAction == 'payment'} active{/if}"
                                               title="{s name="AccountLinkPayment"}Zahlungsart ändern{/s}" rel="nofollow">
                                                {s name="AccountLinkPayment"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user orders *}
                                        {block name="frontend_account_menu_link_orders"}
                                            <a href="{url module='frontend' controller='account' action='orders'}"
                                               class="list-group-item list-group-item-action{if $sAction == 'orders'} active{/if}"
                                               title="{s name="AccountLinkPreviousOrders"}Meine Bestellungen{/s}"
                                               rel="nofollow">
                                                {s name="AccountLinkPreviousOrders"}{/s}
                                            </a>
                                        {/block}

                                        {* Link to the user downloads *}
                                        {block name="frontend_account_menu_link_downloads"}
                                            {if {config name=showEsd}}
                                                <a href="{url module='frontend' controller='account' action='downloads'}"
                                                   class="list-group-item list-group-item-action{if $sAction == 'downloads'} active{/if}"
                                                   title="{s name="AccountLinkDownloads"}Meine Sofortdownloads{/s}"
                                                   rel="nofollow">
                                                    {s name="AccountLinkDownloads"}{/s}
                                                </a>
                                            {/if}
                                        {/block}

                                        {* Link to the user product notes *}
                                        {block name="frontend_account_menu_link_notes"}
                                            <a href="{url module='frontend' controller='note'}"
                                               class="list-group-item list-group-item-action{if $Controller == 'note'} active{/if}"
                                               title="{s name="AccountLinkNotepad"}Merkzettel{/s}" 
                                               rel="nofollow">
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
                                                       class="account-logout list-group-item {if $inHeader} text-center{/if}">
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
                                                           class="account-logout btn btn-danger btn-block mb-3"
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
    {/block}
{/if}
