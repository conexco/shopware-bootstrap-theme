{* Currency changer *}
{block name='frontend_index_actions_currency'}
    {if $currencies|count > 1}
        {foreach from=$currencies item=currency}
            {if $currency->getId() === $shop->getCurrency()->getId()}
                {assign currencySymbol $currency->getSymbol()}
            {/if}
        {/foreach}
        <div class="btn-group">
            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
                {$currencySymbol}
            </button>
            <ul class="dropdown-menu">
                <form method="post" class="currency-form">
                    {foreach from=$currencies item=currency}
                        <li>
                            <label>
                                <input class="hidden" type="checkbox" name="__currency" value="{$currency->getId()}" data-auto-submit="true">
                                {if $currency->getSymbol() != $currency->getCurrency()}{$currency->getSymbol()} {/if}{$currency->getCurrency()}
                            </label>
                        </li>
                    {/foreach}
                </form>
            </ul>
        </div>
    {/if}
{/block}

{* Active language *}
{block name='frontend_index_actions_active_shop'}
    {if {config name=SwfBootstrapTheme_shopselector_active}}
        {action module=widgets controller=ShopSelector position=$position}
    {elseif $shop && $languages|count > 1}
        {foreach from=$languages item=language}
            {if $language->getId() === $shop->getId()}{assign "currentLanguage" $language->getName() scope="global"}{/if}
        {/foreach}
        <div class="btn-group dropdown-sm">
            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
                <img src="{link file='frontend/_public/src/img/flags/'}{$shop->getLocale()->toString()}.png" class="img-fluid" alt="{$currentLanguage}">
            </button>
            <ul class="dropdown-menu">
                <form method="post" class="language-form">
                    {foreach from=$languages item=language}
                        <li>
                            <label>
                                <input class="hidden" type="checkbox" name="__shop" value="{$language->getId()}" data-auto-submit="true">
                                {$language->getName()}
                            </label>
                        </li>
                    {/foreach}
                    <input type="hidden" name="__redirect" value="1">
                </form>
            </ul>
        </div>
    {/if}
{/block}