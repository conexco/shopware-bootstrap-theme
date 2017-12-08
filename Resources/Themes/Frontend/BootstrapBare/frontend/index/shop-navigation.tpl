{block name='frontend_index_header_row_right_inner'}
    {* Search form *}
    {block name='frontend_index_search'}
        <div class="col">
            {block name='frontend_index_search_include'}
                {include file="frontend/index/search.tpl"}
            {/block}
        </div>
    {/block}

    {* Cart entry *}
    {block name='frontend_index_checkout_actions'}
        <div class="col col-sm-auto">
            {block name='frontend_index_checkout_actions_include'}
                {action module=widgets controller=checkout action=info}
            {/block}
        </div>
    {/block}
{/block}