{extends file="parent:frontend/listing/filter/_includes/filter-multi-selection.tpl"}

{block name="frontend_listing_filter_facet_multi_selection_content"}
    <div class="dropdown-menu" aria-labelledby="facet_{$facet->getFacetName()}_{$index}">
        {block name="frontend_listing_filter_facet_media_list_content"}
            <ul class="list-inline">
                {block name="frontend_listing_filter_facet_media_list_list"}
                    {foreach $facet->getValues() as $option}
                        {block name="frontend_listing_filter_facet_media_list_option"}
                            <li>
                                {block name="frontend_listing_filter_facet_media_list_option_container"}
                                    <div class="card card-body">
                                        {block name="frontend_listing_filter_facet_media_list_input"}

                                            {$name = "__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"}
                                            {if $singleSelection}
                                                {$name = {$facet->getFieldName()|escape:'htmlall'} }
                                            {/if}

                                            <input type="{$inputType}"
                                                   id="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                                   name="{$name}"
                                                   title="{$option->getLabel()|escape:'htmlall'}"
                                                   value="{$option->getId()|escape:'htmlall'}"
                                                   {if $option->isActive()}checked="checked" {/if}/>

                                        {/block}

                                        {block name="frontend_listing_filter_facet_media_list_label"}
                                            {$mediaFile = {link file='frontend/_public/src/img/no-picture.png'}}
                                            {if $option->getMedia()}
                                                {$mediaFile = $option->getMedia()->getFile()}
                                            {/if}

                                            <label for="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}">
                                                <img class="img-fluid img-center"
                                                     src="{$mediaFile}"
                                                     alt="{$option->getLabel()|escape:'htmlall'}" />
                                            </label>
                                        {/block}
                                    </div>
                                {/block}
                            </li>
                        {/block}
                    {/foreach}
                {/block}
            </ul>
        {/block}
    </div>
{/block}
