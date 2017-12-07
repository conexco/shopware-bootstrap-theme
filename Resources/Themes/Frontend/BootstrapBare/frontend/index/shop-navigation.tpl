{block name='frontend_index_header_row_right_inner'}
    {block name='frontend_index_shop_navigation'}
        <div class="row shop-navigation-row mb-3">
            {block name='frontend_index_shop_navigation_inner'}
                {* Shop navigation *}
                {block name='frontend_index_checkout_actions'}
                    {action module=widgets controller=checkout action=info}
                {/block}
            {/block}
        </div>
    {/block}

    {block name='frontend_index_search_trusted'}
        <div class="row search-row">
            {block name='frontend_index_search_trusted_inner'}
                {block name='frontend_index_search'}
                    <div class="col-12 col-md-8">
                        {* Search *}
                        {block name='frontend_index_search_inner'}
                            {include file="frontend/index/search.tpl"}
                        {/block}
                    </div>
                {/block}
            {/block}
        </div>
    {/block}
{/block}