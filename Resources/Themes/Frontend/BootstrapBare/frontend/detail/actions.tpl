<ul class="list-unstyled">
    {block name='frontend_detail_actions_review'}
        {if !{config name=VoteDisable} && ($sArticle.sVoteAverange.count > 0)}
            <li>
                <a href="#tabcomments" class="showtabcomments" rel="nofollow" title="{s name='DetailLinkReview' namespace='frontend/detail/actions'}Bewertung schreiben{/s}">
                    <i class="fa fa-star mrs"></i>
                    {s name="DetailLinkReview"}{/s}
                </a>
            </li>
        {/if}
    {/block}

    {block name='frontend_detail_actions_contact'}
        {if $sInquiry}
            <li>
                <a href="{$sInquiry}" rel="nofollow" title="{s name='DetailLinkContact'}{/s}">
                    <i class="fa fa-question mrm"></i>
                    {s name="DetailLinkContact"}{/s}
                </a>
            </li>
        {/if}
    {/block}

    {block name='frontend_detail_actions_notepad'}
        <li>
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post">
                <button type="submit"
                   class="link-notepad sw5-plugin btn btn-link pan"
                   title="{"{s name='DetailLinkNotepad'}{/s}"|escape}"
                   data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="fa fa-heart mrs"></i>
                    {s name="DetailLinkNotepad"}{/s}
                    <span class="text-info mlm"><i class="action-icon sw5-plugin"></i><span class="action-text mls"></span></span>
                </button>
            </form>
        </li>
    {/block}

    {block name='frontend_detail_actions_voucher'}
        {if {config name=showTellAFriend}}
            <li>
                <a href="{$sArticle.linkTellAFriend}" rel="nofollow" title="{s name='DetailLinkVoucher'}{/s}">
                    <i class="fa fa-user mrs"></i>
                    {s name="DetailLinkVoucher"}{/s}
                </a>
            </li>
        {/if}
    {/block}

    {block name='frontend_detail_actions_compare'}
        {if {config name="compareShow"}}
            <li class="d-none d-md-block">
                <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID}" method="post">
                    <button type="submit" data-product-compare-add="true" title="{"{s name='DetailActionLinkCompare'}{/s}"|escape}" class="btn btn-link pan">
                        <i class="fa fa-exchange mrs"></i> {s name="DetailActionLinkCompare"}{/s}
                    </button>
                </form>
            </li>
        {/if}
    {/block}
</ul>
