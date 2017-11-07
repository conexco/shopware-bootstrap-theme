{block name="frontend_index_navigation_mega_menu"}
    {function name=categories_top level=0}
        {if $level == 0}
            {block name="frontend_index_navigation_mega_menu_main_settings"}   
                {foreach from=$categories item=category}
                    {if !$category.hidetop}
                        {assign "has_under" "yes"}
                    {/if}
                {/foreach}

                {$imageMenu=$theme['mega-menu-category-img']}
                {$categoriesPerColumn=$theme['mega-menu-new-col']}
                {$columnWidth=$theme['mega-menu-col-width']}
            {/block}

            {if $has_under eq "yes"}
                {if $imageMenu}
                    {$categoriesPerColumn=1}
                    <div class="row mbm">
                {else}
                    <div class="row">
                {/if}
                <div class="col-xs-12 col-hd-{$columnWidth}">
            {/if}

            {block name="frontend_index_navigation_mega_menu_main_categories"}
                {foreach from=$categories item=category name=categoryloop}
                    {block name="frontend_index_navigation_mega_menu_main_category"}
                        {if !$category.hidetop}
                            <div class="main-nav-sub-head{if $category.sub} subs-active{/if}">
                                <a {if !empty($category.flag)} class="active"{/if} href="{$category.link}">{$category.name}</a>
                            </div>
                            
                            {if $category.sub}
                                {call name=categories_top categories=$category.sub level=$level+1}
                            {/if}

                            {if $imageMenu}
                                    </div>
                                    {if $columnWidth < 12}
                                        {$imageColumnWidth=12-$columnWidth}
                                    {else}
                                        {$imageColumnWidth=$columnWidth}
                                    {/if}
                                    <div class="col-xs-12 col-hd-{$imageColumnWidth}">
                                        {block name="frontend_index_navigation_mega_menu_main_category_teaser"}
                                            {if $category.media.thumbnails[0]}
                                                <a href="{$category.link}" title="{$category.name|escape}">
                                                    <img srcset="{$category.media.thumbnails[0].sourceSet}" alt="{$category.description|escape}" class="img-responsive" />
                                                </a>
                                            {/if}
                                        {/block}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-hd-{$columnWidth}">
                            {else}
                                {if $smarty.foreach.categoryloop.iteration % $categoriesPerColumn == 0}
                                    {assign var=columnCounter value=$columnCounter + $columnWidth}
                                    {* start new row *}
                                    {if ($columnCounter + $columnWidth) >= 13 }
                                        {assign columnCounter 0}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-hd-{$columnWidth}">
                                    {else}
                                            </div>
                                        <div class="col-xs-12 col-hd-{$columnWidth}">
                                    {/if}
                                {/if}
                            {/if}
                        {/if}
                    {/block}    
                {/foreach}
            {/block}    

            {if $has_under eq "yes"}
                    </div>
                </div>
            {/if}
        {elseif $level == 1}
            {if !$category.hidetop}
                <ul class="main-nav-sub-list">
                    {foreach from=$categories item=category}
                        {if !$category.hidetop}
                            <li {if !empty($category.flag)} class="active"{/if}>
                                <a href="{$category.link}">
                                    <small>{$category.name}</small>
                                </a>
                            </li>
                        {/if}
                    {/foreach}
                </ul>
            {/if}
        {/if}
    {/function}
{/block}