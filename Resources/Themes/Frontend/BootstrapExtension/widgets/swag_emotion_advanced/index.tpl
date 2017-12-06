{block name="emotion_advanced_quick_view"}
    <div class="modal-dialog modal-lg">
        {block name="emotion_adcanved_quick_view_content"}
            <div class="modal-content">
                {block name="emotion_advanced_quick_view_header"}
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        {block name="emotion_advanced_quick_view_name"}
                            <h4 class="modal-title">
                                {$sArticle.articleName}
                            </h4>
                        {/block}
                    </div>
                {/block}

                {block name="emotion_advanced_quick_view_container"}    
                    <div class="modal-body pll prl">
                        <div class="row">
                            {block name="emotion_advanced_quick_view_image_container"}
                                <div class="col-xs-12 col-hd-7">
                                    <div class="quickview-image-slider mbm">
                                        {include file="frontend/detail/image.tpl"}
                                    </div>
                                </div>
                            {/block}    
                            {block name="emotion_advanced_quick_view_buy_button_container"}
                                <div class="col-xs-12 col-hd-5">
                                    {block name="emotion_advanced_quick_view_container_inner"}
                                        <div class="row">
                                            {block name="emotion_advanced_quick_view_rating_content"}
                                                <div class="col-xs-8">
                                                    {if !{config name=VoteDisable}}
                                                        <div class="product-rating-container">
                                                            <a href="{url controller='detail' sArticle=$sArticle.articleID}"
                                                               class="product-rating-link"
                                                               title="{"{s name='DetailLinkReview'}{/s}"|escape}">
                                                                {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                                            </a>
                                                        </div>
                                                    {/if}
                                                </div>
                                            {/block}
                                            {block name="emotion_advanced_quick_view_supplier_info"}
                                                <div class="col-xs-4">
                                                    {if $sArticle.supplierImg}
                                                        <div class="product-supplier mbm">
                                                            <a href="{url controller='supplier' sSupplier=$sArticle.supplierID}"
                                                               title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}">
                                                                <img src="{$sArticle.supplierImg}" class="img-fluid" alt="{$sArticle.supplierName|escape}">
                                                            </a>
                                                        </div>
                                                    {/if}
                                                </div>
                                            {/block}    
                                            {block name="emotion_advanced_quick_view_data"}    
                                                <div class="col-xs-12">
                                                    <div class="product-data">
                                                        {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
                                                    </div>
                                                </div>
                                            {/block}
                                            {block name="emotion_advanced_quick_view_description"}
                                                <div class="col-xs-12">
                                                    <div class="product-short-description mbl">
                                                        {$sArticle.description_long|strip_tags|truncate:240}
                                                    </div>
                                                </div>
                                            {/block}
                                            {block name="emotion_advanced_quick_view_actions_notepad"}
                                                <div class="col-xs-6">
                                                    <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post">
                                                        <button type="submit"
                                                           class="link-notepad sw5-plugin btn btn-link pan"
                                                           title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                                                           data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                                                           data-text="{s name="DetailNotepadMarked" namespace="frontend/detail/actions"}{/s}">
                                                            <i class="fa fa-heart mrs"></i>
                                                            {s name="DetailLinkNotepadShort" namespace="frontend/detail/actions"}{/s}
                                                            <span class="text-info mlm"><i class="action-icon sw5-plugin"></i><span class="action-text mls"></span></span>
                                                        </button>
                                                    </form>
                                                </div>
                                            {/block}
                                            {block name="emotion_advanced_quick_view_buy_button"}
                                                <div class="col-xs-6 text-right">
                                                    <a href="{url controller='detail' sArticle=$sArticle.articleID}" class="btn btn-primary">
                                                        {s name="ListingBoxLinkDetails" namespace="frontend/listing/box_article"}{/s}
                                                    </a>
                                                </div>
                                            {/block}
                                        </div>
                                    {/block}    
                                </div>
                            {/block}    
                        </div>
                    </div>
                {/block}    
            </div>
        {/block}    
    </div>
{/block}