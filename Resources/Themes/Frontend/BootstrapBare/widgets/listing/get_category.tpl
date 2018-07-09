{namespace name="frontend/listing/get_category"}

{block name="widgets_listing_get_category"}
    <div class="offcanvas-overlay sw5-plugin">

        {block name="widgets_listing_get_category_name"}{/block}

        {block name="widgets_listing_get_category_categories"}
            <ul class="main-nav-list sub-category-navigation sw5-plugin" role="menu">
                {block name="widgets_listing_get_category_mainmenu"}
                    <li class="main-nav-category" role="menuitem">
                        {block name="widgets_listing_get_category_mainmenu_link"}
                            <a class="main-nav-link link-go-main sw5-plugin" href="#" title="{s name="MainMenu"}{/s}">
                                <span class="text-primary">
                                    <i class="fa fa-bars mrs" aria-hidden="true"></i> {s name="MainMenu"}{/s}
                                </span>
                            </a>
                        {/block}
                    </li>
                {/block}

                {* Go back button *}
                {block name="widgets_listing_get_category_categories_back"}
                    <li class="main-nav-category" role="menuitem">
                        {block name="widgets_listing_get_category_categories_back_link"}
                            <a href="{url module=widgets controller=listing action=getCategory categoryId={$category.parentId}}"
                               data-parentId="{$category.parentId}"
                               class="main-nav-link link-go-back sw5-plugin"
                               title="{s name="ButtonBack"}{/s}">
                                {block name="widgets_listing_get_category_categories_back_link_arrow_left"}
                                    <span class="is-icon-left">
                                        <i class="fa fa-angle-left mrs" aria-hidden="true"></i>
                                    </span>
                                {/block}

                                {block name="widgets_listing_get_category_categories_back_link_name"}
                                    {s name="ButtonBack"}{/s}
                                {/block}
                            </a>
                        {/block}
                    </li>
                {/block}

                {* Show this category button *}
                {block name="widgets_listing_get_category_categories_show"}
                    <li class="main-nav-category" role="menuitem">
                        {block name="widgets_listing_get_category_categories_show_link"}

                            {$categoryLink = $category.link}
                            {if $category.external}
                                {$categoryLink = $category.external}
                            {/if}
                            <a href="{$categoryLink}"
                               title="{s name="ButtonShowPrepend"}{/s} {$category.name|escape} {s name="ButtonShowAppend"}{/s}"
                               class="main-nav-link"
                               {if $category.external && $category.externalTarget}target="{$category.externalTarget}"{/if}>
                                {block name="widgets_listing_get_category_categories_show_link_name"}
                                    <span class="text-primary">
                                        {s name="ButtonShowPrepend"}{/s} {$category.name} {s name="ButtonShowAppend"}{/s}
                                    </span>
                                {/block}
                            </a>
                        {/block}
                    </li>
                {/block}

                {* sub categories *}
                {foreach $category.children as $children}
                    {block name="widgets_listing_get_category_categories_item"}
                        {if $children.active}
                            <li class="main-nav-category" role="menuitem">
                                {block name="widgets_listing_get_category_categories_item_link"}

                                    {$link = $children.link}
                                    {if $children.external}
                                        {$link = $children.external}
                                    {/if}
                                    <a href="{$link}"
                                       title="{$children.name|escape}"
                                       class="main-nav-link{if $children.childrenCount} link-go-forward sw5-plugin{/if}"
                                       data-category-id="{$children.id}"
                                       data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$children.id}}"
                                       {if $children.external && $category.externalTarget}target="{$children.externalTarget}"{/if}>

                                        {block name="widgets_listing_get_category_categories_item_link_name"}
                                            {$children.name}
                                        {/block}

                                        {block name="widgets_listing_get_category_categories_item_link_children"}
                                            {if $children.childrenCount}
                                                <span class="is-icon-right pull-right">
                                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                </span>
                                            {/if}
                                        {/block}
                                    </a>
                                {/block}
                            </li>
                        {/if}
                    {/block}
                {/foreach}
            </ul>
        {/block}
    </div>
{/block}
