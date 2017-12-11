{* Maincategories left *}
{block name='frontend_index_left_categories_function'}
    {function name=categories level=0}
        <div class="list-group list-group-flush{if !$level} categories{else} submenu{/if} level{$level}">
            {block name="frontend_index_categories_left_before"}{/block}

            {foreach from=$categories item=category}
                {block name="frontend_index_categories_left_entry"}
                    <a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center{if $category.flag || $category.subcategories}{if !$level} active{else} text-primary{/if}{/if}{if $category.subcategories} sub{/if}{if $category.childrenCount} sub-children{/if}"
                       href="{$category.link}"
                       data-categoryId="{$category.id}"
                       title="{$category.description|escape}"
                       {if $category.external && $category.externalTarget}target="{$category.externalTarget}"{/if}>
                        
                        <span class="pl-{$level}">{$category.description}</span>
                        
                        {if $category.childrenCount}
                            <i class="fa fa-angle-{if $category.subcategories}down{else}right{/if} fa-lg"></i>
                        {/if}
                    </a>

                    {block name="frontend_index_categories_left_entry_subcategories"}
                        {if $category.subcategories}
                            {call name=categories categories=$category.subcategories level=$level+1}
                        {/if}
                    {/block}    
                {/block}
            {/foreach}

            {block name="frontend_index_categories_left_after"}{/block}
        </div>
    {/function}
{/block}

{block name='frontend_index_left_categories_content'}
    <div id="categoriesLeft" class="d-none d-md-block mb-3">
        <div class="card">
            <h4 class="card-header">
                {s name='CategoriesLeftHeading'}Kategorien{/s}
            </h4>

            {if $sCategories}
                {call name=categories categories=$sCategories}
            {elseif $sMainCategories}
                {call name=categories categories=$sMainCategories}
            {/if}
        </div>
    </div>
{/block}
