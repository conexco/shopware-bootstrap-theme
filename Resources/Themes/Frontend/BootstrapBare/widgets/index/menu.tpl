{block name='widgets_index_menu'}
    {if $sMenu[$sGroup]}
        <ul class="dropdown-menu dropdown-menu-right">
            {foreach $sMenu[$sGroup] as $item}
                <li class="dropdown-item">
                    <a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" 
                       title="{$item.description|escape}" 
                       {if $item.target}target="{$item.target}"{/if}>
                        {$item.description}
                    </a>
                </li>
            {/foreach}
        </ul>
    {/if}
{/block}