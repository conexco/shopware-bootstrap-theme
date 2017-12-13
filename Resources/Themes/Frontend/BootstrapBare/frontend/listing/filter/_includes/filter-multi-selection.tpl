{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_filter_facet_multi_selection"}
    <div class="filter-col mb-2{if !$theme.sidebarFilter} col-sm-6 col-md-4{/if}">
        {$inputType = 'checkbox'}

        {if $filterType == 'radio'}
            {$inputType = 'radio'}
        {/if}

        {$indicator = $inputType}

        {$isMediaFacet = false}
        {if $facet|is_a:'\Shopware\Bundle\SearchBundle\FacetResult\MediaListFacetResult'}
            {$isMediaFacet = true}
            {$indicator = 'media'}
        {/if}

        <div class="filter-panel filter-panel--input sw5-plugin filter-{$indicator} facet-{$facet->getFacetName()|escape:'htmlall'} dropdown"
             data-filter-type="{$filterType}"
             data-facet-name="{$facet->getFacetName()}"
             data-field-name="{$facet->getFieldName()|escape:'htmlall'}">

            {block name="frontend_listing_filter_facet_multi_selection_flyout"}

                {block name="frontend_listing_filter_facet_multi_selection_title"}
                    <a id="facet_{$facet->getFacetName()}_{$index}" 
                       href="#" 
                       class="btn btn-outline-secondary d-flex justify-content-between align-items-center" 
                       role="button"
                       data-toggle="dropdown" 
                       aria-haspopup="true" aria-expanded="false">
                        {block name="frontend_listing_filter_facet_value_list_title"}
                            <span class="filter-panel-title sw5-plugin">
                                {$facet->getLabel()|escape}
                            </span>
                        {/block}

                        {block name="frontend_listing_filter_facet_multi_selection_icon"}
                            <i class="fa fa-angle-down"></i>
                        {/block}
                    </a>
                {/block}

                {block name="frontend_listing_filter_facet_multi_selection_list"}
                    <div class="dropdown-menu" 
                        aria-labelledby="facet_{$facet->getFacetName()}_{$index}">

                        {foreach $facet->getValues() as $option}
                            {block name="frontend_listing_filter_facet_multi_selection_option"}

                                <div class="dropdown-item filter-panel-option sw5-plugin">
                                    {block name="frontend_listing_filter_facet_multi_selection_option_container"}
                                        <div class="filter-panel--input sw5-plugin">

                                            {block name="frontend_listing_filter_facet_multi_selection_input"}
                                                {$name = "__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"}
                                                {if $filterType == 'radio'}
                                                    {$name = {$facet->getFieldName()|escape:'htmlall'} }
                                                {/if}

                                                <input type="{$inputType}"
                                                       id="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                                       name="{$name}"
                                                       value="{$option->getId()|escape:'htmlall'}"
                                                       {if $option->isActive()}checked="checked" {/if}/>
                                            {/block}

                                            {block name="frontend_listing_filter_facet_multi_selection_label"}
                                                <label class="filter-panel-label"
                                                       for="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}">

                                                    {if $facet|is_a:'\Shopware\Bundle\SearchBundle\FacetResult\MediaListFacetResult'}
                                                        {$mediaFile = {link file='frontend/_public/src/img/no-picture.jpg'}}
                                                        {if $option->getMedia()}
                                                            {$mediaFile = $option->getMedia()->getFile()}
                                                        {/if}
                                                        <img class="filter-panel-media-image"
                                                             src="{$mediaFile}"
                                                             alt="{$option->getLabel()|escape:'htmlall'}"/>
                                                    {else}
                                                        {$option->getLabel()|escape}
                                                    {/if}
                                                </label>
                                            {/block}
                                        </div>
                                    {/block}
                                </div>
                            {/block}
                        {/foreach}
                    </div>
                {/block}
            {/block}
        </div>
    </div>
{/block}
