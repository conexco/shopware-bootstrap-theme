{namespace name="frontend/listing/box_article"}

<div class="button-wrapper" data-equal="button">
    {block name='frontend_listing_box_article_actions_inner'}
        <hr class="mt-3 mb-2"/>

        <div class="row">
            {* Compare button *}
            {block name='frontend_listing_box_article_actions_compare'}
                {if {config name="compareShow"}}
                    <div class="d-none d-md-block col-12 col-lg-6">
                        <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID _seo=false}" 
                              method="post">
                            <button type="submit"
                                    title="{s name='ListingBoxLinkCompare'}{/s}"
                                    class="btn btn-link btn-sm btn-block"
                                    data-product-compare-add="true">
                                <i class="fa fa-exchange mr-2"></i>
                                {s name='ListingBoxLinkCompare'}{/s}
                            </button>
                        </form>
                    </div>
                {/if}
            {/block}

            {* Note button *}
            {block name='frontend_listing_box_article_actions_save'}
                <div class="col-12 col-lg-6">
                    <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" 
                          method="post">
                        <button type="submit"
                                title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                                class="btn btn-link btn-sm btn-block link-notepad sw5-plugin"
                                data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                                data-text="{s name="DetailNotepadMarked"}{/s}">
                                <i class="fa fa-heart mr-2"></i> 
                                <span class="action--text">
                                    {s name="DetailLinkNotepadShort" namespace="frontend/detail/actions"}{/s}
                                </span> 
                                <span class="text-info ml-2">
                                    <i class="action-icon sw5-plugin"></i>
                                </span>
                        </button>
                    </form>
                </div>
            {/block}
        </div>
    {/block}
</div>
