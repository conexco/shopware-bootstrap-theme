{namespace name="frontend/blog/comments"}

{if $sArticle.comments}
    {* List comments *}
    {block name='frontend_blog_comments_comment'}
        {foreach name=comments from=$sArticle.comments item=vote}
            {block name='frontend_blog_comments_comment_item'}
                <div itemscope itemtype="http://schema.org/UserComments">
                    {block name='frontend_blog_comments_comment_meta'}
                        {* Stars *}
                        {block name="frontend_blog_comments_comment_rating"}
                            <div class="mbm">
                                {include file='frontend/_includes/rating.tpl' points=$vote.points/2}
                            </div>
                        {/block}

                        {* Headline *}
                        {block name='frontend_blog_comments_comment_headline'}
                            <h4>{$vote.headline|escapeHtml}</h4>
                        {/block}

                        {* Comment *}
                        {block name='frontend_blog_comments_comment_text'}
                            <p>{$vote.comment|escapeHtml|nl2br}</p>
                        {/block}
                        
                        {* Author *}
                        {block name='frontend_blog_comments_comment_author'}
                            <small>
                                {s name="BlogInfoFrom" namespace='frontend/blog/box'}von{/s} {$vote.name}{s name="BlogInfoSeparator" namespace='frontend/blog/box'} | {/s}{$vote.creationDate|date_format:"%d.%m.%Y %H:%M"}
                            </small>
                        {/block}
                    {/block}
                </div>
            {/block}
            {block name='frontend_blog_comments_comment_block_hr'}
                <hr>
            {/block}
        {/foreach}
    {/block}
{/if}