{if $sComparisons}
    {block name='frontend_top_navigation_menu_entry'}
        <a data-toggle="popover" href="#" data-contentselector=".compare-list">
            {s name="CompareInfoHeaderItem"}Vergleich{/s}
            <span class="badge badge-pill compare-quantity">{$sComparisons|@count}</span>
        </a>
    {/block}
    {block name='frontend_compare_product_list_dropdown'}
        <div class="hidden compare-popover-original sw5-plugin">
            <div id="compareMenu" class="compare-list sw5-plugin" data-product-compare-menu="true">
                <table class="table table-responsive">
                    {foreach from=$sComparisons item=compare key=index}
                        {block name='frontend_compare_product_dropdown_entry'}
                            <tr class="compare-entry sw5-plugin" data-compare-entry-nr="{$index}">
                                {block name='frontend_compare_product_dropdown_article_name'}
                                    <td nowrap>
                                        <a href="{url controller=detail sArticle=$compare.articleId}" title="{$compare.articlename|escape}">{$compare.articlename|truncate:30}</a>
                                    </td>
                                {/block}
                                {block name='frontend_compare_product_dropdown_article_link'}
                                    <td class="text-right">
                                        <a href="{url controller='compare' action='delete_article' articleID=$compare.articleID}" rel="nofollow" class="compare-delete-item sw5-plugin">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                {/block}
                            </tr>
                        {/block}
                    {/foreach}
                </table>
                {block name='frontend_compare_product_dropdown_action_start'}
                    <a href="{url controller='compare' action='overlay' forceSecure}" rel="nofollow" class="btn btn-primary btn-block btn-sm compare-start sw5-plugin" title="{s name="CompareActionStart"}{/s}">
                        {s name="CompareActionStart"}{/s}
                    </a>
                {/block}
                {block name='frontend_compare_product_dropdown_action_delete'}
                    <a href="{url controller='compare' action='delete_all' forceSecure}" rel="nofollow" class="btn btn-danger btn-block btn-sm compare-delete-all sw5-plugin" title="{s name="CompareActionDelete"}{/s}">
                        {s name="CompareActionDelete"}{/s}
                    </a>
                {/block}
            </div>
       </div>
    {/block}
{/if}
