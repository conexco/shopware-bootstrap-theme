{block name="frontend_index_main_navigation"}
    {* chooses which categories_top function is needed *}
    {if $theme['mega-menu']}
        {include file="frontend/plugins/menu/mega-menu.tpl"}
    {else}
        {include file="frontend/plugins/menu/default-menu.tpl"}
    {/if}

    {block name='frontend_index_main_navigation_categories_top_menu'}
        <nav class="wsmenu slideLeft clearfix" role="navigation"{if $theme['fixed-navbar']} data-fixed-navbar="true"{/if}>
            <ul class="mobile-sub wsmenu-list" data-wsmenu="true">
                {block name='frontend_index_navigation_categories_top_link_home'}
                    <li>
                        <a href="{url controller='index'}"{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} class="active"{/if} title="{s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}">
                            <span itemprop="name">{s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}</span>
                        </a>
                    </li>
                {/block}
                {foreach from=$swfMegaMenu item=sCategory}
                    {block name="frontend_index_main_navigation_main_container"}
                        {if !$sCategory.hideTop}
                            <li {if !empty($sCategory.flag)}class="active-menu-category"{/if}>
                                {block name="frontend_index_main_navigation_button_category"}
                                    <a href="{$sCategory.link}" title="{$sCategory.name}" {if !empty($sCategory.flag)}class="active"{/if} itemprop="url">
                                        <span itemprop="name">{$sCategory.name}</span>
                                        {if $sCategory.sub}
                                            <i class="fa fa-angle-down mls"></i>
                                        {/if}
                                    </a>
                                {/block}
                                {block name="frontend_index_main_navigation_sub_categories"}
                                    {if $sCategory.sub}
                                        {if $theme['mega-menu']}
                                            <div class="megamenu clearfix">
                                        {/if}
                                        {call name=categories_top categories=$sCategory.sub}
                                        {if $theme['mega-menu']}
                                            </div>
                                        {/if}
                                    {/if}
                                {/block}
                            </li>
                        {/if}
                    {/block}
                {/foreach}
            </ul>
        </nav>
    {/block}
{/block}
