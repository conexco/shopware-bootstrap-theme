{* Maincategories left *}
{block name='frontend_index_left_categories_function'}
    {function name=categories level=0}
        <div class="list-group {if !$level}categories{else}submenu{/if} level{$level}">
            {block name="frontend_index_categories_left_before"}{/block}

            {foreach from=$categories item=category}
                {block name="frontend_index_categories_left_entry"}
                    <a class="list-group-item{if $category.flag or $category.subcategories} active{/if}{if $category.subcategories} sub{/if}"
                        href="{$category.link}"
                        data-categoryId="{$category.id}"
                        data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$category.id}}"
                        title="{$category.description|escape}"
                        {if $category.external && $category.externalTarget}target="{$category.externalTarget}"{/if}>
                        {$category.description}

                        {if $category.childrenCount}
                            <i class="fa fa-angle-{if $category.subcategories}down{else}right{/if} fa-lg mts float-right"></i>
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
    <div class="mbl d-none d-md-block" id="categoriesLeft">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">{s name='CategoriesLeftHeading'}Kategorien{/s}</h4>
            </div>
            {if $sCategories}
                {call name=categories categories=$sCategories}
            {elseif $sMainCategories}
                {call name=categories categories=$sMainCategories}
            {/if}
        </div>
    </div>
{/block}





