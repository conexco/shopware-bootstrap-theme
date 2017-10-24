{namespace name="frontend/detail/comment"}

{* Offcanvas close button *}
{block name="frontend_detail_comment_offcanvas_button"}
    {include file="frontend/_includes/close-offcanvas.tpl"}
{/block}

{* Rating title *}
{block name="frontend_detail_tabs_rating_title"}
    <div class="page-header">
        {block name="frontend_detail_tabs_rating_title_inner"}
            <h3>{s name="DetailCommentHeader"}{/s} "{$sArticle.articleName}"</h3>
        {/block}
    </div>
{/block}

{* Display review *}
{block name="frontend_detail_review"}
    {if $sArticle.sVoteComments}
        {foreach name=comment from=$sArticle.sVoteComments item=vote}
            {* Review entry *}
            {block name="frontend_detail_comment_block"}
                {include file="frontend/detail/comment/entry.tpl"}
            {/block}

            {* Review answer *}
            {block name="frontend_detail_answer_block"}
                {if $vote.answer}
                    {include file="frontend/detail/comment/answer.tpl"}
                {/if}
            {/block}
        {/foreach}
    {/if}
{/block}

{* Publish product review *}
{block name='frontend_detail_comment_post'}
    {include file="frontend/detail/comment/form.tpl"}
{/block}