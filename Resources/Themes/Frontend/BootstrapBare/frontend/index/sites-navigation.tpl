{namespace name="frontend/index/menu_left"}

{* Static sites *}
{if $sMenu.gLeft}
    {block name="frontend_index_left_menu_container"}
        {block name='frontend_index_left_menu_inner'}
            {block name='frontend_index_left_menu_before'}{/block}
            {block name='frontend_index_left_menu_content'}
                <div class="panel panel-default visible-lg visible-md">
                    {block name='frontend_index_left_menu_headline'}
                        <div class="panel-heading">{s name="MenuLeftHeading"}Informationen{/s}</div>
                    {/block}
                    <ul class="list-group">
                        {block name='frontend_index_left_menu_entries'}
                            {foreach from=$sMenu.gLeft item=item}
                                {block name='frontend_index_left_menu_entry'}
                                    <li class="list-group-item">
                                        {if $item.active}<strong>{/if}<a href="{if $item.link}{$item.link}{else}{url controller=custom sCustom=$item.id title=$item.description}{/if}" title="{$item.description}" {if $item.target}target="{$item.target}"{/if}>
                                                {$item.description}
                                            </a> {if $item.active}</strong>{/if}
                                        {if $item.active && $item.subPages}
                                            <ul class="list-unstyled">
                                                {foreach $item.subPages as $subPage}
                                                    <li><a href="{url controller=custom sCustom=$subPage.id}" title="{$subPage.description}"{if $subPage.active} class="active"{/if}>
                                                            <small>{$subPage.description}</small>
                                                        </a></li>
                                                {/foreach}
                                            </ul>
                                        {/if}
                                    </li>
                                {/block}
                            {/foreach}
                        {/block}
                    </ul>
                </div>
            {/block}
            {block name='frontend_index_left_menu_after'}{/block}
            {block name='frontend_index_left_menu_small'}
                {if $Controller != 'listing'}
                    <div class="dropdown text-right mbl hidden-md hidden-lg">
                        <button class="btn btn-default dropdown-toggle" type="button" id="leftMenuGoTo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            {s name="LeftMenuGoto"}Gehe zu{/s}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="leftMenuGoTo">
                            {foreach from=$sMenu.gLeft item=item}
                                <li {if $item.active}class="active"{/if}><a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}" {if $item.target}target="{$item.target}"{/if}>{$item.description}</a></li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            {/block}
        {/block}
    {/block}
{/if}



