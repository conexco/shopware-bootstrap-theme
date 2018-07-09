{block name="frontend_index_checkout_actions_my_options"}
    {block name="frontend_index_checkout_actions_my_options_left"}
        {block name="frontend_index_checkout_actions_my_options_left_div_open"}
            <div class="hidden-xs hidden-sm col-md-8">
        {/block}
        {block name="frontend_index_checkout_actions_my_options_left_inner"}
            <ul class="nav nav-pills pull-right checkout-actions">
                {* Top bar navigation *}
                {block name="frontend_index_top_bar_nav"}
                    {block name='frontend_index_navigation_inline'}
                        {* Article Compare *}
                        {if {config name="compareShow"}}
                            <li class="compare-show sw5-plugin hidden" role="menuitem">
                                {action module=widgets controller=compare}
                            </li>
                        {/if}
                    {/block}
                    {block name="frontend_index_checkout_actions_account"}
                        {if {config name=useSltCookie} || $sOneTimeAccount}
                            <li role="menuitem" class="dropdown sltCookie{if $userInfo} logged-in{/if}">
                                <a id="account-dropdown"
                                    data-target="#"
                                    data-toggle="dropdown"
                                    role="button"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    href="{url controller='account'}"
                                    title="{strip}
                                        {if $userInfo}
                                            {s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}{$userInfo['firstname']|escape}{s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s} -&nbsp;
                                        {/if}
                                        {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"{/strip}
                                >
                                    {if $userInfo}
                                        <span class="account-display navigation-personalized">
                                            <span class="account-display-greeting">
                                                {s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}
                                                {$userInfo['firstname']}
                                                {s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s}
                                            </span>
                                        </span>
                                    {else}
                                        {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                                    {/if}
                                    <i class="caret"></i>
                                </a>

                                <ul class="dropdown-menu account-dropdown-menu pvn" aria-labelledby="account-dropdown">
                                    {block name="frontend_index_checkout_actions_account_navigation"}
                                        <div class="account-dropdown-navigation">

                                            {block name="frontend_index_checkout_actions_account_navigation_smartphone"}
                                                <div class="navigation-smartphone visible-xs visible-sm">
                                                    <div class="entry-close-off-canvas">
                                                        <a href="#close-account-menu"
                                                           class="account-close-off-canvas"
                                                           title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}">
                                                            {s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}
                                                        </a>
                                                    </div>
                                                </div>
                                            {/block}

                                            {block name="frontend_index_checkout_actions_account_menu"}
                                                <div class="move-on xs s" data-move-to="#accountSidebarMobile">
                                                    {include file="frontend/account/sidebar.tpl" showSidebar=true inHeader=true}
                                                </div>
                                            {/block}
                                        </div>
                                    {/block}
                                </ul>
                            </li>
                        {else}
                            <li role="menuitem">
                                <a href="{url controller='account'}"
                                   title="{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}">{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                                </a>
                            </li>
                        {/if}
                    {/block}

                    {block name="frontend_index_checkout_actions_notepad"}
                        <li class="entry-notepad sw5-plugin" role="menuitem">
                            <a href="{url controller='note'}" title="{s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}">
                                {s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}
                                <span class="badge notes-quantity sw5-plugin{if $sNotesQuantity <= 0} hidden{/if}">{$sNotesQuantity}</span>
                            </a>
                        </li>
                    {/block}
                    {block name="frontend_index_checkout_actions_service_menu"}
                        <li class="dropdown" role="menuitem">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">{s name='IndexLinkService'}Service/Hilfe{/s}<b class="caret"></b></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                {action module=widgets controller=index action=menu group=gLeft}
                            </ul>
                        </li>
                    {/block}
                {/block}
            </ul>
        {/block}
        {block name="frontend_index_checkout_actions_my_options_left_div_close"}
            </div>
        {/block}
    {/block}
    {block name="frontend_index_checkout_actions_my_options_right"}
        {block name="frontend_index_checkout_actions_my_options_right_div_open"}
            <div class="col-xs-12 col-md-4 text-right">
        {/block}
        {block name="frontend_index_checkout_actions_my_options_right_inner"}
            <div class="btn-group">
                {* Language and Currency bar *}
                {block name='frontend_index_actions'}
                    {action module=widgets controller=index action=shopMenu}
                {/block}
                {block name='frontend_index_checkout_actions_notepad_xs'}
                    <a href="{url controller='note' action='index'}" class="btn btn-default visible-xs visible-sm" title="{s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}" class="entry-notepad">
                        <i class="fa fa-list fa-lg"></i>
                        {if $sNotesQuantity > 0}<span class="badge notes-quantity mls">{$sNotesQuantity}</span>{/if}
                    </a>
                {/block}
                <div class="btn-group visible-xs visible-sm">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="{s name='IndexLinkService'}Service/Hilfe{/s}">
                        <i class="fa fa-question fa-lg"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        {action module=widgets controller=index action=menu group=gLeft}
                    </ul>
                </div>

                {if {config name=useSltCookie} || $sOneTimeAccount}
                    <div class="btn-group visible-xs visible-sm">
                        <div class="off-canvas-account sw5-plugin">
                            <a href="#"
                                class="btn btn-default visible-xs visible-sm"
                                data-offcanvas="true"
                                data-offCanvasSelector="#accountSidebar"
                                title="{s name='AccountHeaderNavigation' namespace='frontend/account/sidebar'}{/s}">
                                <i class="fa fa-user fa-lg"></i>
                                {if $userInfo}
                                    <i class="fa fa-check text-primary"></i>
                                {/if}
                            </a>
                            <div id="accountSidebarMobile" class="text-left">
                                {* Content inserted via JS move helper *}
                            </div>
                        </div>
                    </div>
                {else}
                    <a href="{url controller='account'}" class="btn btn-default visible-xs visible-sm" title="{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}">
                        <i class="fa fa-user fa-lg"></i>
                    </a>
                {/if}
                {*! Cart / Checkout *}
                {block name="frontend_index_checkout_actions_cart"}
                    <button type="button"
                            class="btn {if $sBasketQuantity}btn-primary{else}btn-default{/if}"
                            id="carty"
                            aria-label="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}"|escape}"
                            data-ajax-cart="true"
                            data-with-quantity="btn-primary"
                            data-without-quantity="btn-default"
                            data-offcanvas="true"
                            data-mode="ajax"
                            data-direction="fromRight"
                            data-ajaxUrl="{url controller='checkout' action='ajaxCart'}"
                            data-popoverclass="cart"
                            data-container="body">
                        <span class="visible-xs visible-sm">
                            <i class="fa fa-shopping-cart fa-lg"></i>
                            {if $sBasketQuantity && $sBasketQuantity < 10}
                                <span class="cart-quantity">{$sBasketQuantity}</span>
                            {/if}
                        </span>
                        <span class="hidden-xs hidden-sm">
                            <i class="fa fa-shopping-cart fa-lg"></i>
                            <span class="cart-quantity mls">{$sBasketQuantity}</span>
                            <span> {s name='IndexTextCart' namespace='frontend/index/checkout_actions'}Artikel{/s}</span>
                            <span class="visible-lg-inline">
                                <span class="cart-amount{if $sBasketAmount>=100} hidden{/if}">({$sBasketAmount|currency}*)</span>
                            </span>
                        </span>
                    </button>
                {/block}
            </div>
        {/block}
        {block name="frontend_index_checkout_actions_my_options_right_div_close"}
            </div>
        {/block}
    {/block}
{/block}

{block name="frontend_index_checkout_actions_inner"}{/block}
