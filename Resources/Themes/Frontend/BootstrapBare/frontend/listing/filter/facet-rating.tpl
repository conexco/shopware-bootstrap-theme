{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_filter_facet_rating"}
    <div class="filter-col{if !$theme.sidebarFilter} col-hd-6 col-md-4{/if}">
        <div class="filter-panel filter-panel--input sw5-plugin filter--rating facet-{$facet->getFacetName()|escape:'htmlall'} dropdown"
             data-filter-type="rating"
             data-facet-name="{$facet->getFacetName()}"
             data-field-name="{$facet->getFieldName()|escape:'htmlall'}">

            <a id="facet_{$facet->getFacetName()}_{$index}" href="#" class="btn btn-default" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {block name="frontend_listing_filter_facet_rating_title"}
                    <span class="filter-panel-title sw5-plugin">{$facet->getLabel()|escape}</span>
                {/block}
                <i class="fa fa-angle-down"></i>
            </a>

            {block name="frontend_listing_filter_facet_rating_flyout"}
                <div class="dropdown-menu pal" aria-labelledby="facet_{$facet->getFacetName()}_{$index}">
                    {block name="frontend_listing_filter_facet_rating_content"}
                        <div class="filter-panel-star-rating filter-panel--star-rating sw5-plugin">
                            {block name="frontend_listing_filter_facet_rating_stars"}
                                {foreach $facet->getValues() as $value}
                                    {block name="frontend_listing_filter_facet_rating_container"}
                                        <label for="rating_{$value->getId()}" class="rating-star--outer-container sw5-plugin{if $value->isActive()} is--active{/if}">
                                            <input class="hidden" type="checkbox" name="rating" id="rating_{$value->getId()}" value="{$value->getId()}" {if $value->isActive()}checked="checked" {/if}/>

                                            {for $i = 1 to $value->getId()}
                                                <i class="fa fa-star"></i>
                                            {/for}

                                            {for $i = $value->getId() + 1 to 5}
                                                <i class="fa fa-star-o"></i>
                                            {/for}
                                            <span class="rating-star-suffix">{s name="RatingStarSuffix"}& more{/s}</span>
                                        </label>
                                    {/block}
                                {/foreach}
                            {/block}
                        </div>
                    {/block}
                </div>
            {/block}
        </div>
    </div>
{/block}
