{* Search container *}
{block name='frontend_index_search_container'}
    <form action="{url controller='search' fullPath=false}" method="get" class="ajax-search-form">
        {block name="frontend_index_search_innerform"}{/block}
        <div class="input-group">
            {* Search field *}
            {block name='frontend_index_search_field'}
                <input class="form-control ajax-search" 
                       data-ajax-search="true" 
                       name="sSearch" 
                       type="text" 
                       maxlength="30" 
                       title="{s name='SearchAjaxHeadline' namespace='frontend/search/ajax'}Vorschläge zu Ihrer Suche{/s}" 
                       data-placement="bottom" 
                       data-popoverclass="ajax-search-popover"
                       data-animation="false" 
                       placeholder="{s name="IndexSearchFieldValue"}Suchbegriff eingeben...{/s}" 
                       autocomplete="off">
            {/block}
            {* Search input *}
            {block name='frontend_index_search_field_submit'}
                <span class="input-group-btn">
                    <button class="btn btn-outline-secondary ajax-search-button" type="submit" aria-label="{s name='IndexSearchFieldSubmit'}{/s}">
                        {* Search icon *}
                        {block name='frontend_index_search_icon'}
                            <i class="fa fa-search fa-lg"></i>
                        {/block}
                    </button>
                </span>
            {/block}
        </div>
    </form>
{/block}