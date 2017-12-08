{block name="frontend_index_main_navigation"}
    {include file="frontend/plugins/menu/mega-menu.tpl"}

    {block name='frontend_index_main_navigation_categories_top_menu'}
        <nav class="navbar main-nav" 
             data-main-nav="true" 
             role="navigation"
             {if $theme['fixed-navbar']} data-fixed-navbar="true"{/if}>

            {block name='frontend_index_main_navigation_offcanvas_close'}
                {include file="frontend/_includes/close-offcanvas.tpl" class="main-nav-close"}
            {/block}

            <ul class="navbar-nav main-nav-list">
                {block name='frontend_index_navigation_categories_top_link_home'}
                    <li class="nav-item main-nav-home main-nav-category">
                        <a href="{url controller='index'}" 
                           class="nav-link main-nav-link{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}" 
                           title="{s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}">
                            <span itemprop="name">
                                {s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}
                            </span>
                        </a>
                    </li>
                {/block}

                {foreach from=$swfMegaMenu item=sCategory}
                    {block name="frontend_index_main_navigation_main_container"}
                        {if !$sCategory.hideTop}
                            <li class="nav-item main-nav-category{if !empty($sCategory.flag)} active{/if}">
                                {block name="frontend_index_main_navigation_arrow"}
                                    {if $sCategory.sub}
                                        <span class="main-nav-arrow d-sm-none{if !empty($sCategory.flag)} active{/if}">
                                            <i class="fa fa-angle-down"></i>
                                        </span>
                                    {/if}
                                {/block}

                                {block name="frontend_index_main_navigation_button_category"}
                                    <a href="{$sCategory.link}" 
                                       title="{$sCategory.name}" 
                                       class="nav-link main-nav-link{if !empty($sCategory.flag)} active{/if}" 
                                       itemprop="url">
                                        <span itemprop="name">
                                            {$sCategory.name}
                                        </span>
                                        {if $sCategory.sub}
                                            <i class="fa fa-angle-down mls d-none d-md-inline-block"></i>
                                        {/if}
                                    </a>
                                {/block}

                                {block name="frontend_index_main_navigation_sub_categories"}
                                    {if $sCategory.sub}
                                        <div class="megamenu{if !empty($sCategory.flag)} open{/if}">
                                            {call name=categories_top categories=$sCategory.sub}
                                        </div>
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
