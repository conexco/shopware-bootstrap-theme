{extends file="parent:frontend/listing/filter/_includes/filter-multi-selection.tpl"}

{block name="frontend_listing_filter_facet_multi_selection_list"}
    <div class="dropdown-menu" 
         aria-labelledby="facet_{$facet->getFacetName()}_{$index}">
        <ul class="list-inline px-2 mb-0">

            {foreach $facet->getValues() as $option}
                {block name="frontend_listing_filter_facet_multi_selection_option"}
                    <li class="list-inline-item">
                        {block name="frontend_listing_filter_facet_multi_selection_option_container"}
                            {block name="frontend_listing_filter_facet_multi_selection_input"}

                                {$name = "__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"}
                                {if $singleSelection}
                                    {$name = {$facet->getFieldName()|escape:'htmlall'} }
                                {/if}

                                <input type="{$inputType}"
                                       class="d-none"
                                       id="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                       name="{$name}"
                                       title="{$option->getLabel()|escape:'htmlall'}"
                                       value="{$option->getId()|escape:'htmlall'}"
                                       {if $option->isActive()}checked="checked" {/if}/>

                            {/block}

                            {block name="frontend_listing_filter_facet_multi_selection_label"}
                                {$mediaFile = {link file='frontend/_public/src/img/no-picture.png'}}
                                {if $option->getMedia()}
                                    {$mediaFile = $option->getMedia()->getFile()}
                                {/if}

                                <label class="mb-0" for="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}">
                                    <img class="img-thumbnail img-fluid mx-auto d-block"
                                         src="{$mediaFile}"
                                         alt="{$option->getLabel()|escape:'htmlall'}" />
                                </label>
                            {/block}
                        {/block}
                    </li>
                {/block}
            {/foreach}
        </ul>
    </div>
{/block}
