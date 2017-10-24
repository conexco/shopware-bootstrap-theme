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

{*! General detailbox *}
{block name='frontend_index_content_detailbox'}
    <div id="detailbox" class="product-details sw5-plugin mbl" itemscope itemtype="http://schema.org/Product" data-ajax-wishlist="true" data-compare-ajax="true"{if !{config name=disableArticleNavigation}} data-product-navigation="{url module="widgets" controller="listing" action="productNavigation"}" data-category-id="{$sArticle.categoryID}" data-main-ordernumber="{$sArticle.mainVariantNumber}"{/if} {if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if}>
        {block name='frontend_index_content_detailbox_inner'}
            <div class="row product-detail-upper sw5-plugin">
                {block name='frontend_detail_left'}
                    {*! Detailbox left *}
                    {block name='frontend_detail_left_grid'}
                        <div class="col-md-5">
                    {/block}
                    {block name='frontend_detail_index_left_inner'}
                        {* Product image *}
                        {block name='frontend_detail_index_image_container'}
                            {include file="frontend/detail/image.tpl"}
                        {/block}
                    {/block}
                    </div>
                {/block}
                {block name='frontend_detail_index_right'}
                    {block name='frontend_detail_right_grid'}
                        <div class="col-md-7">
                    {/block}
                    {block name='frontend_detail_index_right_inner'}
                        {* Product header *}
                        {block name='frontend_detail_index_header'}
                            <div class="row">
                                {block name='frontend_detail_index_header_inner'}
                                    {* Product name *}
                                    {block name='frontend_detail_index_name'}
                                        <div class="col-xs-12{if $sArticle.supplierImg} col-sm-9{/if}">
                                            <h1 itemprop="name">
                                                {$sArticle.articleName}
                                            </h1>
                                        </div>
                                    {/block}
                                    {* Product - Supplier information *}
                                    {block name='frontend_detail_supplier_info'}
                                        {if $sArticle.supplierImg}
                                            <div class="hidden-xs col-sm-3">
                                                <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}" title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}">
                                                    <img src="{$sArticle.supplierImg}" alt="{$sArticle.supplierName|escape}" class="img-responsive mtl mbl">
                                                </a>
                                            </div>
                                        {/if}
                                    {/block}
                                {/block}
                            </div>
                        {/block}
                        {block name='frontend_detail_index_overview'}
                            {*! Detailbox middle *}
                            {include file="frontend/detail/content/buy_container.tpl"}
                        {/block} <!-- //frontend_detail_index_overview -->
                    {/block} <!-- //frontend_detail_index_right_inner -->
                    </div>
                {/block} <!-- //frontend_detail_index_right -->
            </div>
        {/block}<!-- // frontend_index_content_detailbox_inner-->
    </div>
{/block}<!-- // frontend_index_content_detailbox-->

{* Product bundle hook point *}
{block name="frontend_detail_index_bundle"}{/block}

{*! Detailinfo *}
{block name="frontend_detail_index_detail"}
    <div class="row">
        {block name="frontend_detail_index_detail_inner"}
            {* Tab navigation *}
            {block name="frontend_detail_index_tabs"}
                {include file="frontend/detail/tabs.tpl"}
            {/block}
            {* Similar products *}
            {block name="frontend_detail_index_recommendation_tabs_entry_similar_products"}
                {block name="frontend_detail_index_similar"}
                    <div class="col-md-4" id="similar">
                        {block name="frontend_detail_index_similar_inner"}
                            {*! Similar articles *}
                            {include file='frontend/detail/tabs/similar.tpl'}
                        {/block}
                    </div>
                {/block}
            {/block}
        {/block}
    </div>
{/block}

{block name="frontend_detail_index_hr"}
    <hr class="hr-large hr-brand">
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

{* Related product streams *}
{foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
    {block name="frontend_detail_index_tabs_related_product_streams"}
        {block name="frontend_detail_index_tabs_related_product_streams_inner"}
            {include file='frontend/detail/tabs/product_streams.tpl' index=$key}
        {/block}
    {/block}
{/foreach}

{/block}