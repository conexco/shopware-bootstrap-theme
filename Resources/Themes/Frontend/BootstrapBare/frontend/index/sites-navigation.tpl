{namespace name="frontend/index/menu_left"}

{* Static sites *}
{block name="frontend_index_left_menu_container_function"}
    {* TODO: find mobile solution *}
    {function name=customPages level=0}
        {block name='frontend_index_left_menu_inner'}
            {block name='frontend_index_left_menu_before'}{/block}
            
            {block name='frontend_index_left_menu_content'}
                <ul class="list-group list-group-flush">
                    {block name='frontend_index_left_menu_entries'}
                        {foreach $customPages as $page}
                            {block name='frontend_index_left_menu_entry'}
                                <a href="{if $page.link}{$page.link}{else}{url controller='custom' sCustom=$page.id title=$page.description}{/if}"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-center{if $page.active}{if !$level} active{else} text-primary{/if}{/if}"
                                   title="{$page.description|escape}"
                                   data-categoryId="{$page.id}"
                                   {if $page.target}target="{$page.target}"{/if}>
                                    
                                    {$padding = $level + 1}
                                    <span {if $level != 0}class="pl-{$padding}"{/if}>{$page.description}</span>

                                    {if $page.childrenCount}
                                        <i class="fa fa-angle-{if $page.subPages}down{else}right{/if} fa-lg"></i>
                                    {/if}
                                </a>

                                {if $page.active && $page.subPages}
                                    {call name=customPages customPages=$page.subPages level=$level+1}
                                {/if}
                            {/block}
                        {/foreach}
                    {/block}
                </ul>
            {/block}
            
            {block name='frontend_index_left_menu_after'}{/block}
        {/block}
    {/function}    
{/block}

{if $sMenu.gLeft}
    {block name="frontend_index_left_menu_container"}
        <div class="shop-sites card d-none d-md-block">
            {block name='frontend_index_left_menu_headline'}
                <div class="card-header">
                    {s name="MenuLeftHeadingInformation"}{/s}
                </div>
            {/block}

            {call name=customPages customPages=$sMenu.gLeft}
        </div>
    {/block}
{/if}
