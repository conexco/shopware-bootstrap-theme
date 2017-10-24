{block name='frontend_blog_detail_comments_inner'}
    <div id="commentcontainer" class="blog-comments">
        {* Detail Comment Form *}
        {block name='frontend_blog_comments_form'}
            {block name='frontend_blog_comments_form_collapse_btn'}
                <div class="text-right">
                    <a class="btn btn-primary mbm" role="button" data-toggle="collapse" href="#commentFormCollapse" aria-expanded="false" aria-controls="commentFormCollapse">{s name="BlogMakeCommentBtn"}Eigene Bewertung schreiben{/s}</a>
                </div>
            {/block}
            {block name='frontend_blog_comments_form_collapse'}
                <div class="collapse{if $sAction == "rating"} in{/if}" id="commentFormCollapse">
                    {include file='frontend/blog/comment/form.tpl'}
                </div>
            {/block}
        {/block}

        {* Comments headline *}
        {if $sArticle.comments}
            {block name='frontend_blog_comments_comments_headline'}
                <legend>{s name="BlogInfoComments" namespace='frontend/blog/box'}{/s}</legend>
            {/block}
        {/if}

        {* List comments *}
        {block name='frontend_blog_comments_entry'}
            {include file='frontend/blog/comment/entry.tpl'}
        {/block}
    </div>
{/block}
