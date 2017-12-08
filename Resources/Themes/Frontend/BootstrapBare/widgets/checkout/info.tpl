{* Notepad entry *}
{block name="frontend_index_checkout_actions_notepad"}
    <div class="btn-group entry-notepad sw5-plugin">
        <a href="{url controller='note'}" 
           class="btn btn-outline-secondary" 
           title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}"|escape}">

           <i class="fa fa-file-text-o fa-lg"></i>

            <span class="badge badge-secondary notes-quantity sw5-plugin{if $sNotesQuantity <= 0} d-none{/if}">
                {$sNotesQuantity}
            </span>
        </a>
    </div>
{/block}

{* My account entry *}
{block name="frontend_index_checkout_actions_my_options"}
    <div class="btn-group entry-account dropdown{if {config name=useSltCookie}} with-slt{/if}"
        data-offcanvas="true"
        data-offCanvasSelector=".account-dropdown-navigation">

        {block name="frontend_index_checkout_actions_account"}
            <a class="btn btn-outline-secondary dropdown-toggle{if $userInfo} account-user-loggedin{/if}" 
               data-toggle="dropdown"
               role="button"
               aria-haspopup="true"
               aria-expanded="false"
               href="{url controller='account'}"
               title="{"{if $userInfo}{s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}{$userInfo['firstname']}{s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s} - {/if}{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}">
                {if $userInfo}
                    <span class="account-display navigation-personalized">
                        <span class="account-display-greeting small">
                            {s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}
                            {$userInfo['firstname']}
                            {s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s}
                        </span>
                    </span>
                {else}
                    {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                {/if}
            </a>
        {/block}

        {if {config name=useSltCookie}}
            {block name="frontend_index_checkout_actions_account_navigation"}
                <div class="dropdown-menu">
                    <div class="account-dropdown-navigation">
                        {block name="frontend_index_checkout_actions_account_navigation_smartphone"}
                            <div class="navigation-smartphone d-sm-none">
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
                            {include file="frontend/account/sidebar.tpl" showSidebar=true inHeader=true}
                        {/block}
                    </div>
                </div>
            {/block}
        {/if}
    </div>
{/block}    

{* Cart entry *}
{block name="frontend_index_checkout_actions_cart"}
    <button type="button"
            class="btn btn-outline-secondary cart-button"
            aria-label="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}"|escape}"
            data-ajax-cart="true"
            data-offcanvas="true"
            data-mode="ajax"
            data-direction="fromRight"
            data-ajaxUrl="{url controller='checkout' action='ajax_cart'}">
            
            <i class="fa fa-shopping-cart fa-lg mr-1"></i>

            <span class="d-none d-sm-inline">
                <span class="cart-amount small text-primary{if $sBasketAmount >= 100} d-none{/if}">
                    {$sBasketAmount|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                </span>
            </span>

            <span class="badge badge-primary cart-quantity ml-1{if $sBasketQuantity < 1} d-none{/if}">
                {$sBasketQuantity}
            </span>
        </span>
    </button>
{/block}

{block name="frontend_index_checkout_actions_inner"}{/block}
