{block name="frontend_index_main_navigation"}
    {include file="frontend/plugins/menu/mega-menu.tpl"}

    {block name='frontend_index_main_navigation_categories_top_menu'}
        {block name='frontend_index_main_navigation_categories_subcategory_configuration'}
            {$subCategoryNav = $theme['sub-category-ajax-nav']}

            {if $subCategoryNav}
                {* if sCategoryContent is not available use sArticle.categoryID *}
                {if isset($sCategoryContent) && $sCategoryContent.id}
                    {$subCategoryId = $sCategoryContent.id}
                {elseif isset($sArticle) && $sArticle.categoryID}
                    {$subCategoryId = $sArticle.categoryID}
                {else}
                    {$subCategoryId = 0}
                {/if}
            {/if}
        {/block}

        <nav id="mainNavigation"
             class="main-nav"
             data-main-nav="true"
             role="navigation"
             {if $theme['fixed-navbar']} data-fixed-navbar="true"{/if}>

            {block name='frontend_index_main_navigation_offcanvas_close'}
                {include file="frontend/_includes/close-offcanvas.tpl" class="main-nav-close"}
            {/block}

            <ul class="main-nav-list"
                {if $subCategoryNav}
                data-subcategory-nav="true"
                data-mainCategoryId="{$sCategoryStart}"
                data-categoryId="{$subCategoryId}"
                data-fetchUrl="{if $subCategoryId}{url module=widgets controller=listing action=getCategory categoryId={$subCategoryId}}{/if}"
                {/if}>

                {block name='frontend_index_navigation_categories_top_link_home'}
                    <li class="main-nav-home main-nav-category">
                        <a href="{url controller='index'}"
                           class="main-nav-link{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}"
                           title="{s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}">
                            <span itemprop="name">{s name='IndexLinkHome' namespace='frontend/index/categories_top'}{/s}</span>
                        </a>
                    </li>
                {/block}

                {foreach from=$swfMegaMenu item=sCategory}
                    {block name="frontend_index_main_navigation_main_container"}
                        {if !$sCategory.hideTop}
                            <li class="main-nav-category{if !empty($sCategory.flag)} active{/if}">
                                {block name="frontend_index_main_navigation_arrow"}
                                    {if $sCategory.sub && !$subCategoryNav}
                                        <span class="main-nav-arrow visible-xs visible-sm{if !empty($sCategory.flag)} active{/if}">
                                            <i class="fa fa-angle-down"></i>
                                        </span>
                                    {/if}
                                {/block}

                                {block name="frontend_index_main_navigation_button_category"}
                                    <a href="{$sCategory.link}"
                                       title="{$sCategory.name}"
                                       class="main-nav-link{if !empty($sCategory.flag)} active{/if}{if $subCategoryNav && $sCategory.childrenCount} link-go-forward sw5-plugin{/if}"
                                       {if $subCategoryNav}
                                       data-categoryId="{$sCategory.id}"
                                       data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$sCategory.id}}"
                                       {/if}
                                       itemprop="url">
                                        <span itemprop="name">{$sCategory.name}</span>
                                        {if $subCategoryNav && $sCategory.childrenCount}
                                            <span class="is-icon-right pull-right visible-xs visible-sm">
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        {/if}
                                        {if $sCategory.sub}
                                            <i class="fa fa-angle-down mls hidden-xs hidden-sm"></i>
                                        {/if}
                                    </a>
                                {/block}

                                {block name="frontend_index_main_navigation_sub_categories"}
                                    {if $sCategory.sub}
                                        <div class="megamenu{if !empty($sCategory.flag)} open{/if}{if $subCategoryNav} hidden-xs hidden-sm{/if}">
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
