{namespace name="frontend/listing/box_article"}

<div class="button-wrapper" data-equal="button">
    {block name='frontend_listing_box_article_actions_inner'}
        <hr class="mvx"/>
        <div class="row">
            {* Compare button *}
            {block name='frontend_listing_box_article_actions_compare'}
                {if {config name="compareShow"}}
                    <div class="hidden-xs hidden-sm col-sm-12 col-lg-6">
                        <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID _seo=false}" method="post">
                            <button type="submit"
                               title="{s name='ListingBoxLinkCompare'}{/s}"
                               class="btn btn-link btn-block"
                               data-product-compare-add="true">
                                <i class="fa fa-exchange mrs"></i> {s name='ListingBoxLinkCompare'}{/s}
                            </button>
                        </form>
                    </div>
                {/if}
            {/block}

            {* Note button *}
            {block name='frontend_listing_box_article_actions_save'}
                <div class="col-12 col-lg-6">
                    <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post">
                        <button type="submit"
                           title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                           class="product--action action--note btn btn-link btn-block link-notepad sw5-plugin"
                           data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                           data-text="{s name="DetailNotepadMarked"}{/s}">
                            <i class="fa fa-heart mrs"></i> <span class="action--text">{s name="DetailLinkNotepadShort" namespace="frontend/detail/actions"}{/s}</span> <span class="text-info mls"><i class="action-icon sw5-plugin"></i></span>
                        </button>
                    </form>
                </div>
            {/block}

            {* Notification button *}
            {block name="frontend_listing_box_article_actions_notify"}
                {if $theme['notify-modal-in-listing'] && $sArticle.notification && $sArticle.instock <= 0 && $sArticle.laststock && !$sArticle.sConfigurator}
                    <button id='notifyModalButton' type="button" class="btn btn-link btn-block" data-toggle="modal" data-target="#notifyModal-{$sArticle.articleID}">
                        <i class="fa fa-envelope"></i> {s name="NotifyModalNotify"}Benachrichtigen{/s}
                    </button>
                    <div class="modal" id="notifyModal-{$sArticle.articleID}" tabindex="-1" role="dialog" aria-labelledby="notifyModalLabel-{$sArticle.articleID}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="notifyModalLabel-{$sArticle.articleID}">{s name="NotifyModalTitle"}Emailbenachrichtigung für diesen Artikel aktivieren{/s}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="notify-modal-alert"></div>
                                    <form method="post" action="{url controller="detail" action='notify' sArticle=$sArticle.articleID}" id="sendArticleNotification-{$sArticle.articleID}" class="notify-modal-form">
                                        <input type="hidden" name="notifyOrdernumber" value="{$sArticle.ordernumber}" id="variantOrdernumber"/>
                                        <input type="hidden" name="sArticle" value="{$sArticle.articleID}"/>

                                        <div class="input-group mbm">
                                            <input name="sNotificationEmail" type="email" id="txtmail" class="form-control{if $NotifyEmailError == true} has-error{/if}" placeholder="{s name='DetailNotifyLabelMail'}Ihre E-Mail Adresse{/s}"/>

                                            <span class="input-group-btn">
                                                <button type="submit" class="btn btn-primary submit-notify-modal">
                                                    {s name='DetailNotifyActionSubmit'}Eintragen{/s}
                                                </button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/block}

            {block name='frontend_listing_box_article_actions_more'}{/block}
            {block name="frontend_listing_box_article_actions_inline"}{/block}
        </div>
    {/block}
</div>
