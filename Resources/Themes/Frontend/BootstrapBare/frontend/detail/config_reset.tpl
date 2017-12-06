{block name='frontend_detail_configurator_reset'}
    {foreach $sArticle.sConfigurator as $sConfigurator}
        {if $sConfigurator.user_selected}
            {block name='frontend_detail_configurator_reset_button'}
                <a class="btn btn-outline-secondary btn-xs mbm reset--configuration sw5-plugin" href="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}">
                    {s name="DetailConfiguratorReset" namespace="frontend/detail/index"}Reset selection{/s}
                </a>
            {/block}
            {break}
        {/if}
    {/foreach}
{/block}