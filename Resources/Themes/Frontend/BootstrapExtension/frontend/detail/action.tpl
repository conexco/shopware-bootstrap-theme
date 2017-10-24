{extends file="parent:frontend/detail/actions.tpl"}

{block name="frontend_detail_actions_compare"}
    {if !$minimalView}
        {$smarty.block.parent}
    {/if}
{/block}

{block name="frontend_detail_actions_notepad"}
    {if !$minimalView}
        {$smarty.block.parent}
    {/if}
{/block}