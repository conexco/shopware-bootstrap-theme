{block name="frontend_index_navigation_default_menu"}
    {function name=categories_top level=0}
        <ul class="{if $level == 0}wsmenu-submenu{elseif $level == 1}wsmenu-submenu-sub{elseif $level > 1}wsmenu-submenu-sub-sub{/if}">
            {foreach from=$categories item=category}
                {if !$category.hidetop}
                    <li>
                        <a href="{$category.link}" title="{$category.name}" {if !empty($category.flag)}class="active"{/if}>
                            {$category.name}
                            {if $category.sub}
                                <i class="fa fa-angle-down mls"></i>
                            {/if}
                        </a>
                        {if $category.sub}
                            {call name=categories_top categories=$category.sub level=$level+1}
                        {/if}
                    </li>
                {/if}
            {/foreach}
        </ul>
    {/function}
{/block}
