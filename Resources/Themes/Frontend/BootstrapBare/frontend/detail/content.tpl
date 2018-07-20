{block name='frontend_index_content_inner'}

    {* The configurator selection is checked at this early point
           to use it in different included files in the detail template. *}
    {block name='frontend_detail_index_configurator_settings'}
        {* Variable for tracking active user variant selection *}
        {$activeConfiguratorSelection = true}

        {if $sArticle.sConfigurator && ($sArticle.sConfiguratorSettings.type == 1 || $sArticle.sConfiguratorSettings.type == 2)}
            {* If user has no selection in this group set it to false *}
            {foreach $sArticle.sConfigurator as $configuratorGroup}
                {if !$configuratorGroup.selected_value}
                    {$activeConfiguratorSelection = false}
                {/if}
            {/foreach}
        {/if}
    {/block}

    {block name='frontend_index_content_detailbox'}
        <div id="detailbox" 
             class="product-details sw5-plugin mb-4"
             itemscope itemtype="http://schema.org/Product"
             data-ajax-wishlist="true" 
             data-compare-ajax="true"
             {if !{config name=disableArticleNavigation}}
             data-product-navigation="{url module="widgets" controller="listing" action="productNavigation"}"
             data-category-id="{$sArticle.categoryID}"
             data-main-ordernumber="{$sArticle.mainVariantNumber}"
             {/if}
             {if $theme.ajaxVariantSwitch} 
             data-ajax-variants-container="true"
             {/if}>
            {block name='frontend_index_content_detailbox_inner'}
                {block name='frontend_detail_index_header'}
                    {include file="frontend/detail/content/header.tpl"}
                {/block}

                <div class="row product-detail-upper sw5-plugin">
                    {block name='frontend_detail_left'}
                        {block name='frontend_detail_left_grid'}
                            <div class="col-md-7">
                        {/block}

                        {block name='frontend_detail_index_left_inner'}
                            {block name='frontend_detail_index_image_container'}
                                {include file="frontend/detail/image.tpl"}
                            {/block}
                        {/block}
                        </div>
                    {/block}

                    {block name='frontend_detail_index_right'}
                        {block name='frontend_detail_right_grid'}
                            <div class="col-md-5">
                        {/block}

                        {block name='frontend_detail_index_right_inner'}
                            {block name='frontend_detail_index_overview'}
                                {include file="frontend/detail/content/buy_container.tpl"}
                            {/block}
                        {/block}
                        </div>
                    {/block}
                </div>
            {/block}
        </div>
    {/block}

    {* Product bundle hook point *}
    {block name="frontend_detail_index_bundle"}{/block}

    {*! Detailinfo *}
    {block name="frontend_detail_index_detail"}
        {block name="frontend_detail_index_detail_inner"}
            {* Tab navigation *}
            {block name="frontend_detail_index_tabs"}
                {include file="frontend/detail/tabs.tpl"}
            {/block}

            {block name="frontend_detail_index_recommendation_tabs_entry_similar_products"}
                {include file="frontend/detail/content/tab_navigation.tpl"}
            {/block}
        {/block}
    {/block}

    {block name="frontend_detail_index_tabs_cross_selling"}
        {* Customer also bought *}
        {block name="frontend_detail_index_tabs_entry_also_bought"}
            {block name="frontend_detail_index_also_bought_slider"}
                {if {config name=alsoBoughtShow}}
                    {action module=widgets controller=recommendation action=bought articleId=$sArticle.articleID}
                {/if}
            {/block}
        {/block}

        {* Customer also viewed *}
        {block name="frontend_detail_index_tabs_entry_also_viewed"}
            {block name="frontend_detail_index_similar_viewed_slider"}
                {if {config name=similarViewedShow}}
                    {action module=widgets controller=recommendation action=viewed articleId=$sArticle.articleID}
                {/if}
            {/block}
        {/block}
    {/block}
{/block}
