{* Top bar main *}
{block name="frontend_index_top_bar_main"}
    <div class="top-bar mb-3">
        {block name="frontend_index_top_bar_main_container"}
            {block name="frontend_index_top_bar_nav"}
                <div class="top-bar-navigation text-right">

                    {* Language and Currency bar *}
                    {block name='frontend_index_top_bar_currency_language'}
                        <div class="btn-group curr-lang-group">
                            {action module=widgets controller=index action=shopMenu}
                        </div>
                    {/block}

                    {* Article Compare *}
                    {block name='frontend_index_navigation_inline'}
                        {if {config name="compareShow"}}
                            <div class="btn-group compare-show sw5-plugin d-none">
                                {block name='frontend_index_navigation_compare'}    
                                    {action module=widgets controller=compare}
                                {/block}
                            </div>
                        {/if}
                    {/block}

                    {* Service / Support drop down *}
                    {block name="frontend_index_checkout_actions_service_menu"}
                        <div class="btn-group">
                            <a class="btn btn-light btn-sm dropdown-toggle" 
                               data-toggle="dropdown" 
                               href="#" 
                               role="button" 
                               title="{s name='IndexLinkService' namespace='frontend/index/checkout_actions'}Service/Hilfe{/s}"
                               aria-haspopup="true" 
                               aria-expanded="false">
                                {s name='IndexLinkService' namespace='frontend/index/checkout_actions'}{/s}
                            </a>

                            {block name="frontend_index_checkout_actions_service_menu_include"}
                                {include file="widgets/index/menu.tpl" sGroup=gLeft}
                            {/block}
                        </div>
                    {/block}
                </div>
            {/block}
        {/block}
    </div>
{/block}