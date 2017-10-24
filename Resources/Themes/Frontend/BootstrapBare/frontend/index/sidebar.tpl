{block name="frontend_index_sidebar"}
    {* Maincategories left *}
    {block name='frontend_index_left_categories'}
        {* Actual include of the categories *}
        {block name='frontend_index_left_categories_inner'}
           {include file='frontend/index/sidebar-categories.tpl'}
        {/block}
    {/block}

    {block name='frontend_index_left_menu'}
        {include file='frontend/index/sites-navigation.tpl'}
    {/block}
{/block}
