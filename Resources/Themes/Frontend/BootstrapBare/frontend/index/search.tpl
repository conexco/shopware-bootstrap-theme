{block name='frontend_index_search_container'}
    <form action="{url controller='search' fullPath=false}" method="get" class="ajax-search-form">
        {block name="frontend_index_search_innerform"}{/block}

        <div class="input-group">
            {block name='frontend_index_search_field'}
                <input class="form-control ajax-search" 
                       data-ajax-search="true" 
                       name="sSearch" 
                       type="text"
                       placeholder="{s name='IndexSearchFieldValue'}Suchbegriff eingeben...{/s}"
                       aria-label="{s name='IndexSearchFieldValue'}{/s}" 
                       autocomplete="off">
            {/block}

            {block name='frontend_index_search_field_submit'}
                <span class="input-group-btn">
                    <button class="btn btn-outline-secondary ajax-search-button" 
                            type="submit" 
                            aria-label="{s name='IndexSearchFieldSubmit'}{/s}">
                        {block name='frontend_index_search_icon'}
                            <i class="fa fa-search fa-lg"></i>
                        {/block}
                    </button>
                </span>
            {/block}
        </div>
    </form>
{/block}