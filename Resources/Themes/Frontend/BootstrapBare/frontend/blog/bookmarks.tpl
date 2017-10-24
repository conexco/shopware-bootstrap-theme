{if !$sArticle.sBookmarks}
    {block name='frontend_blog_bookmarks_bookmarks'}
        <div class="text-right mtm">
            {* Twitter *}
            {block name='frontend_blog_bookmarks_twitter'}
                <a href="http://twitter.com/home?status={$sArticle.title|escape:'url'}+-+{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                   title="{"{s name='BookmarkTwitterShare'}{/s}"|escape}"
                   class="btn btn-primary btn-xs"
                   rel="nofollow"
                   target="_blank"><i class="fa fa-twitter mrs"></i>
                    {s name="BookmarkTwitter"}{/s}
                </a>
            {/block}

            {* Facebook *}
            {block name='frontend_blog_bookmarks_facebook'}
                <a href="http://www.facebook.com/share.php?v=4&amp;src=bm&amp;u={url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}&amp;t={$sArticle.title|escape:'url'}"
                   title="{"{s name='BookmarkFacebookShare'}{/s}"|escape}"
                   class="btn btn-primary btn-xs"
                   rel="nofollow"
                   target="_blank"><i class="fa fa-facebook mrs"></i>
                    {s name="BookmarkFacebook"}{/s}
                </a>
            {/block}

            {* Del.icio.us *}
            {block name='frontend_blog_bookmarks_delicious'}
                <a href="http://del.icio.us/post?url={url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}&amp;title={$sArticle.title|escape:'url'}"
                   title="{"{s name='BookmarkDeliciousShare'}{/s}"|escape}"
                   class="btn btn-primary btn-xs"
                   rel="nofollow"
                   target="_blank"><i class="fa fa-delicious mrs"></i>
                    {s name="BookmarkDelicious"}{/s}
                </a>
            {/block}

            {* Digg *}
            {block name='frontend_blog_bookmarks_digg'}
                <a href="http://digg.com/submit?phase=2&amp;url={url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}&amp;title={$sArticle.title|escape:'url'}"
                   title="{"{s name='BookmarkDiggitShare'}{/s}"|escape}"
                   class="btn btn-primary btn-xs"
                   rel="nofollow"
                   target="_blank"><i class="fa fa-digg mrs"></i>
                    {s name="BookmarkDiggit"}{/s}
                </a>
            {/block}
        </div>
    {/block}
{/if}