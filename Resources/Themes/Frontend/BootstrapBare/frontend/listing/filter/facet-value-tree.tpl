{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_filter_facet_value_tree"}
    {$type = 'value-tree'}
    {$listingMode = {config name="listingMode"}}
    {if $listingMode == 'filter_ajax_reload'}
        {$type = 'value-tree-single'}
    {/if}

    <div class="filter-col{if !$theme.sidebarFilter} col-sm-6 col-md-4{/if}">
        <div class="filter-panel filter-panel--input sw5-plugin filter-property facet-{$facet->getFacetName()|escape:'htmlall'} dropdown"
             data-filter-type="{$type}"
             data-facet-name="{$facet->getFacetName()}"
             data-field-name="{$facet->getFieldName()|escape:'htmlall'}">

            <a id="facet_{$facet->getFacetName()}_{$index}" 
               href="#"
               class="btn btn-outline-secondary d-flex justify-content-between align-items-center" 
               role="button" 
               data-toggle="dropdown" 
               aria-haspopup="true" aria-expanded="false">
                {block name="frontend_listing_filter_facet_value_tree_title"}
                    <span class="filter-panel-title sw5-plugin">
                        {$facet->getLabel()|escape}
                    </span>
                {/block}
                <i class="fa fa-angle-down"></i>
            </a>

            {block name="frontend_listing_filter_facet_value_tree_flyout"}
                <div class="dropdown-menu" aria-labelledby="facet_{$facet->getFacetName()}_{$index}">
                    {block name="frontend_listing_filter_facet_value_tree_content"}
                        {block name="frontend_listing_filter_facet_value_tree_list"}
                            {function name=valueTree level=0}
                                <ul class="list-unstyled{if $level > 0} pl-3 sub-level level-{$level}{/if}">
                                    {foreach $options as $option}

                                        {block name="frontend_listing_filter_facet_value_tree_option"}
                                            <li class="filter-panel-option sw5-plugin">
                                                {block name="frontend_listing_filter_facet_value_tree_option_container"}

                                                    {$disabled = !$option->isActive() && $facet->isActive()}

                                                    <div class="filter-panel--input sw5-plugin">
                                                        {block name="frontend_listing_filter_facet_value_tree_label"}
                                                            <input type="checkbox"
                                                                    data-parent-id="{$parent}"
                                                                    id="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                                                    name="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                                                    value="{$option->getId()|escape:'htmlall'}"
                                                                    {if $option->isActive()}checked="checked"{elseif $disabled}disabled="disabled"{/if}/>
                                                            <label class="filter-panel-label value-tree-label"
                                                                   for="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}">
                                                                {block name="frontend_listing_filter_facet_value_tree_input"}{/block}
                                                                {$option->getLabel()}
                                                            </label>
                                                        {/block}
                                                    </div>
                                                {/block}

                                                {if !empty($option->getValues())}
                                                    {valueTree options=$option->getValues() level=$level+1 parent=$option->getId()}
                                                {/if}
                                            </li>
                                        {/block}
                                    {/foreach}
                                </ul>
                            {/function}

                            {valueTree options=$facet->getValues() parent=null}
                        {/block}
                    {/block}
                </div>
            {/block}
        </div>
    </div>
{/block}
