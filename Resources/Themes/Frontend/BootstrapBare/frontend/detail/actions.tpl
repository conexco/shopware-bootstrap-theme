<ul class="nav mb-3">
    {block name='frontend_detail_actions_compare'}
        {if {config name="compareShow"}}
            <li class="d-none d-md-block nav-item">
                <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID}" method="post">
                    <button type="submit" 
                            data-product-compare-add="true" 
                            title="{"{s name='DetailActionLinkCompare'}{/s}"|escape}" 
                            class="btn btn-link btn-sm pl-0">
                        <i class="fa fa-exchange mr-2"></i> {s name="DetailActionLinkCompare"}{/s}
                    </button>
                </form>
            </li>
        {/if}
    {/block}

    {block name='frontend_detail_actions_notepad'}
        <li class="nav-item">
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post">
                <button type="submit"
                        data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                        data-text="{s name="DetailNotepadMarked"}{/s}"
                        title="{"{s name='DetailLinkNotepad'}{/s}"|escape}"
                        class="link-notepad sw5-plugin btn btn-link btn-sm pl-0">
                    <i class="fa fa-heart mr-2"></i>{s name="DetailLinkNotepad"}{/s}

                    <span class="text-info"><i class="action-icon sw5-plugin"></i><span class="action-text"></span></span>
                </button>
            </form>
        </li>
    {/block}

    {block name='frontend_detail_actions_review'}
        <li class="nav-item">
            <a href="#tabcomments" rel="nofollow" title="{s name='DetailLinkReview' namespace='frontend/detail/actions'}Bewertung schreiben{/s}"
               class="showtabcomments btn btn-link btn-sm pl-0" >
                <i class="fa fa-star mr-2"></i>{s name="DetailLinkReview"}{/s}
            </a>
        </li>
    {/block}

    {block name='frontend_detail_actions_voucher'}
        {if {config name=showTellAFriend}}
            <li class="nav-item">
                <a href="{$sArticle.linkTellAFriend}" rel="nofollow" title="{s name='DetailLinkVoucher'}{/s}"
                   class="btn btn-link btn-sm pl-0">
                    <i class="fa fa-user mr-2"></i>{s name="DetailLinkVoucher"}{/s}
                </a>
            </li>
        {/if}
    {/block}
</ul>