{if $facet->getLabel()}
    <h3>{$facet->getLabel()}</h3>
{/if}
{include file="frontend/listing/actions/action-filter-facets.tpl" facets=$facet->getFacetResults()}