{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_filter_facet_range"}
    <div class="filter-col{if !$theme.sidebarFilter} col-sm-6 col-md-4{/if}">
        <div class="filter-panel filter-panel--input sw5-plugin filter-range facet-{$facet->getFacetName()|escape:'htmlall'} dropdown"
             data-filter-type="range"
             data-facet-name="{$facet->getFacetName()}"
             data-field-name="{$facet->getFacetName()|escape:'htmlall'}">

            <a id="facet_{$facet->getFacetName()}_{$index}" href="#" class="btn btn-default" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {block name="frontend_listing_filter_facet_range_title"}
                    <span class="filter-panel-title sw5-plugin">{$facet->getLabel()|escape}</span>
                {/block}
                <i class="fa fa-angle-down"></i>
            </a>

            {block name="frontend_listing_filter_facet_range_flyout"}
                <div class="dropdown-menu pal" aria-labelledby="facet_{$facet->getFacetName()}_{$index}">
                    {block name="frontend_listing_filter_facet_range_content"}
                        {block name="frontend_listing_filter_facet_range_slider"}
                            {block name="frontend_listing_filter_facet_range_slider_config"}
                                {$startMin = $facet->getActiveMin()}
                                {$startMax = $facet->getActiveMax()}
                                {$rangeMin = $facet->getMin()}
                                {$rangeMax = $facet->getMax()}
                                {$roundPretty = 'false'}
                                {$suffix = $facet->getSuffix()}
                                {if $facet->getDigits() >= 0}
                                    {$digits = $facet->getDigits()}
                                {/if}
                                {$format = ''}
                                {$stepCount = 100}
                                {$stepCurve = 'linear'}
                            {/block}

                            <div class="range-slider"
                                 data-range-slider="true"
                                 data-roundPretty="{$roundPretty}"
                                 data-labelFormat="{$format}"
                                 data-suffix="{$suffix}"
                                 data-stepCount="{$stepCount}"
                                 data-stepCurve="{$stepCurve}"
                                 data-startMin="{$startMin}"
                                 data-digits="{$digits}"
                                 data-startMax="{$startMax}"
                                 data-rangeMin="{$rangeMin}"
                                 data-rangeMax="{$rangeMax}">

                                {block name="frontend_listing_filter_facet_range_input_min"}
                                    <input type="hidden"
                                           id="{$facet->getMinFieldName()|escape:'htmlall'}"
                                           name="{$facet->getMinFieldName()|escape:'htmlall'}"
                                           data-range-input="min"
                                           value="{$startMin}" {if !$facet->isActive() || $startMin == 0}disabled="disabled" {/if}/>
                                {/block}

                                {block name="frontend_listing_filter_facet_range_input_max"}
                                    <input type="hidden"
                                           id="{$facet->getMaxFieldName()|escape:'htmlall'}"
                                           name="{$facet->getMaxFieldName()|escape:'htmlall'}"
                                           data-range-input="max"
                                           value="{$startMax}" {if !$facet->isActive() || $startMax == 0}disabled="disabled" {/if}/>
                                {/block}

                                {block name="frontend_listing_filter_facet_range_info"}
                                    <div class="text-center mtl">
                                        {block name="frontend_listing_filter_facet_range_info_min"}
                                            <span>{s name="ListingFilterRangeFrom"}{/s}</span>
                                        {/block}

                                        {block name="frontend_listing_filter_facet_range_label_min"}
                                            <label for="{$facet->getMinFieldName()|escape:'htmlall'}"
                                                   data-range-label="min">
                                                {$startMin}
                                            </label>
                                        {/block}

                                        {block name="frontend_listing_filter_facet_range_info_max"}
                                            <span>{s name="ListingFilterRangeTo"}{/s}</span>
                                        {/block}

                                        {block name="frontend_listing_filter_facet_range_label_max"}
                                            <label for="{$facet->getMaxFieldName()|escape:'htmlall'}"
                                                   data-range-label="max">
                                                {$startMax}
                                            </label>
                                        {/block}
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    {/block}
                </div>
            {/block}
        </div>
    </div>
{/block}
