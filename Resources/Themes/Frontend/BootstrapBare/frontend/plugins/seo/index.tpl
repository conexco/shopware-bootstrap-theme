{block name='frontend_index_header_meta_robots'}
    {if $SeoMetaRobots}
        {$SeoMetaRobots}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
{block name='frontend_index_header_meta_description'}
    {if $SeoMetaDescription}
        {$SeoMetaDescription|truncate:150:"...":true}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
{block name='frontend_index_header_meta_description_og'}
    {if $SeoMetaDescription}
        {$SeoMetaDescription|truncate:150:"...":true}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
{block name='frontend_index_header_meta_description_twitter'}
    {if $SeoMetaDescription}
        {$SeoMetaDescription|truncate:150:"...":true}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
