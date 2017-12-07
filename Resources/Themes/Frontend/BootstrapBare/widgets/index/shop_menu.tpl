{* Currency changer *}
{block name='frontend_index_actions_currency'}
    {if $currencies|count > 1}
        <div class="btn-group currency-changer" role="group">
            <button class="btn btn-outline-secondary btn-sm dropdown-toggle"
                    type="button"
                    data-toggle="dropdown"
                    aria-haspopup="true" 
                    aria-expanded="false">
                {foreach from=$currencies item=currency}
                    {if $currency->getId() === $shop->getCurrency()->getId()}
                        {if $currency->getSymbol() != $currency->getCurrency()}{$currency->getSymbol()} {/if}{$currency->getCurrency()}
                        {break}
                    {/if}
                {/foreach}
            </button>

            <ul class="dropdown-menu">
                <form method="post" class="currency-form">
                    {foreach from=$currencies item=currency}
                        <li class="dropdown-item">
                            <label class="m-0">
                                <input class="d-none" 
                                       type="checkbox" 
                                       name="__currency" 
                                       value="{$currency->getId()}" 
                                       data-auto-submit="true">
                                {if $currency->getSymbol() != $currency->getCurrency()}{$currency->getSymbol()} {/if}{$currency->getCurrency()}
                            </label>
                        </li>
                    {/foreach}
                </form>
            </ul>
        </div>
    {/if}
{/block}

{* Language switcher *}
{block name='frontend_index_actions_active_shop'}
    {if {config name=SwfBootstrapTheme_shopselector_active}}
        {block name='frontend_index_actions_active_shop_top_bar_language_shop_selector'}
            {action module=widgets controller=ShopSelector position=$position}
        {/block}
    {elseif $shop && $languages|count > 1}
        {block name='frontend_index_actions_active_shop_top_bar_language'}
            <div class="btn-group language-changer" role="group">
                <button class="btn btn-outline-secondary btn-sm dropdown-toggle"
                        type="button"
                        data-toggle="dropdown"
                        aria-haspopup="true" 
                        aria-expanded="false">
                    <div class="language-flag {$shop->getLocale()->toString()}">
                        {$shop->getName()}
                    </div>
                </button>

                <ul class="dropdown-menu">
                    <form method="post" class="language-form">
                        {block name="frontend_index_actions_active_shop_language_form_content"}
                            {block name="frontend_index_actions_active_shop_language_form_select"}
                                {foreach from=$languages item=language}
                                    <li class="dropdown-item">
                                        <label class="m-0">
                                            <input class="d-none" 
                                                   type="checkbox" 
                                                   name="__shop" 
                                                   value="{$language->getId()}" 
                                                   data-auto-submit="true">
                                            {$language->getName()}
                                        </label>
                                    </li>
                                {/foreach}
                            {/block}

                            <input type="hidden" name="__redirect" value="1">

                            {block name="frontend_index_actions_active_shop_inline"}{/block}
                        {/block}
                    </form>
                </ul>
            </div>
        {/block}
    {/if}
{/block}
