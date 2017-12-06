{if $sMenu[$sGroup]}
    {foreach from=$sMenu[$sGroup] item=item}
        <li class="list-inline-item">
            <a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" 
               title="{$item.description}" 
               {if $item.target}target="{$item.target}"{/if}>
                {$item.description}
            </a>
        </li>
    {/foreach}
{/if}