{namespace name="frontend/blog/index"}

{block name='frontend_blog_index_subscribe'}
    <div class="panel panel-default">
        {block name='frontend_blog_index_subscribe_panel_heading'}
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-rss mrm"></i> {s name="BlogSubscribe"}Subscribe{/s}
                </h3>
            </div>
        {/block}
        {block name='frontend_blog_index_subscribe_panel_list'}
            <ul class="list-group">
                {block name='frontend_blog_listing_subscribe_rss'}
                    <li class="list-group-item">
                        <a href="{$sCategoryContent.rssFeed}" target="_blank" title="{$sCategoryContent.description}">
                            <i class="fa fa-rss-square mrs"></i>
                            {s name="BlogLinkRSS"}{/s}
                        </a>
                    </li>
                {/block}
                {block name='frontend_blog_listing_subscribe_atom'}
                    <li class="list-group-item">
                        <a href="{$sCategoryContent.atomFeed}" target="_blank" title="{$sCategoryContent.description}">
                            <i class="fa fa-rss-square mrs"></i>
                            {s name="BlogLinkAtom"}{/s}
                        </a>
                    </li>
                {/block}
                {block name='frontend_blog_listing_bookmarks_twitter'}
                    <li class="list-group-item">
                        <a href="http://twitter.com/home?status={$sCategoryContent.name|escape:'url'}+-+{url controller=blog action=index sCategory=$sCategoryContent.id}"
                           title="{s name="BookmarkTwitterShare" namespace="frontend/blog/bookmarks"}{/s}"
                           rel="nofollow"
                           target="_blank"><i class="fa fa-twitter mrs"></i>
                            {s name="BookmarkTwitterShare" namespace="frontend/blog/bookmarks"}{/s}
                        </a>
                    </li>
                {/block}
                {block name='frontend_blog_listing_bookmarks_facebook'}
                    <li class="list-group-item">
                        <a href="http://www.facebook.com/share.php?v=4&amp;src=bm&amp;u={url controller=blog action=index sCategory=$sCategoryContent.id}&amp;t={$sCategoryContent.name|escape:'url'}"
                           title="{s name="BookmarkFacebookShare" namespace="frontend/blog/bookmarks"}{/s}"
                           rel="nofollow"
                           target="_blank"><i class="fa fa-facebook mrm"></i>
                            {s name="BookmarkFacebookShare" namespace="frontend/blog/bookmarks"}{/s}
                        </a>
                    </li>
                {/block}
                {block name='frontend_blog_listing_bookmarks_delicious'}
                    <li class="list-group-item">
                        <a href="http://del.icio.us/post?url={url controller=blog action=index sCategory=$sCategoryContent.id}&amp;title={$sCategoryContent.name|escape:'url'}"
                           title="{s name="BookmarkDeliciousShare" namespace="frontend/blog/bookmarks"}{/s}"
                           rel="nofollow"
                           target="_blank"><i class="fa fa-delicious mrs"></i>
                            {s name="BookmarkDeliciousShare" namespace="frontend/blog/bookmarks"}{/s}
                        </a>
                    </li>
                {/block}
                {block name='frontend_blog_listing_bookmarks_digg'}
                    <li class="list-group-item">
                        <a href="http://digg.com/submit?phase=2&amp;url={url controller=blog action=index sCategory=$sCategoryContent.id}&amp;title={$sCategoryContent.name|escape:'url'}"
                           title="{s name="BookmarkDiggitShare" namespace="frontend/blog/bookmarks"}{/s}"
                           rel="nofollow"
                           target="_blank"><i class="fa fa-digg mrs"></i>
                            {s name="BookmarkDiggitShare" namespace="frontend/blog/bookmarks"}{/s}
                        </a>
                    </li>
                {/block}
            </ul>
        {/block}
    </div>
{/block}

{* Blog filter *}
{block name='frontend_blog_index_filter'}
    {include file="frontend/blog/filter.tpl"}
{/block}