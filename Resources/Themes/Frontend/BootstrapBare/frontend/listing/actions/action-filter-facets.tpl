{**
 * Iteration for the different filter facets.
 * The file is called recursive for deeper structured facet groups.
 *}
{foreach from=$facets item=facet key=index}
    {if $facet->getTemplate() !== null}
        {include file=$facet->getTemplate() facet=$facet index=$index}
    {/if}
{/foreach}
