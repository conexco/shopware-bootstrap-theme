{if $subShops || $languageShops}
    {function insertSubShops}
        <li class="header plm ptm">
            <label><strong>{s name="ShopSelectorSubshop"}Shop wählen{/s}</strong></label>
        </li>
        {foreach from=$subShops item=subshop}
            <li>
                <label>
                    <input class="hidden" type="checkbox" name="__shop" value="{$subshop.id}" data-auto-submit="true">
                    <span>
                        {if $subshop.customTitle}
                            {$subshop.customTitle}
                        {else}
                            {$subshop.name}
                        {/if}
                    </span>

                    {if $subshop.image}
                        <span class="float-right">
                            <img src="{$subshop.image}" alt="{$subshop.name}">
                        </span>
                    {/if}
                </label>
            </li>
        {/foreach}
    {/function}

    {function insertLanguageShops}
        <li class="header plm ptm">
            <strong>{s name="ShopSelectorLanguage"}Sprache wählen{/s}</strong></label>
        </li>
        {foreach from=$languageShops item=languageShop}
            <li>
                <label>
                    <input class="hidden" type="checkbox" name="__shop" value="{$languageShop.id}" data-auto-submit="true">
                    <span{if $shop->getLocale()->getLanguage() === $languageShop.customTitle ||
                             $shop->getLocale()->getLanguage() === $languageShop.language ||
                             $shop->getLocale()->getLanguage() === $languageShop.name} class="text-medium"{/if}>
                        {if $languageShop.customTitle}
                            {$languageShop.customTitle}
                        {elseif $languageShop.language}
                            {$languageShop.language}
                        {else}
                            {$languageShop.name}
                        {/if}
                    </span>
                </label>
            </li>
        {/foreach}
    {/function}

    <div class="btn-group dropdown-lg">
        <button type="button" class="btn btn-outline-secondary dropdown-toggle shop-selector-btn" data-toggle="dropdown">
            <span class="shop-name">{$shop->getCategory()->getName()}</span>
            <i class="fa fa-angle-down pls"></i>
        </button>
        <ul class="dropdown-menu pas pbm shop-selector-dropdown">
            <form method="post" class="language-form">
                {if $subShops}
                    {insertSubShops}
                {/if}

                {if $languageShops}
                    {insertLanguageShops}
                {/if}

                <input type="hidden" name="__redirect" value="1">
            </form>
        </ul>
    </div>
{/if}
