{namespace name="frontend/detail/comment"}

<blockquote>
    {* Answer content *}
    {block name='frontend_detail_answer_content'}
        <p>{$vote.answer}</p>
    {/block}

    {* Author block *}
    {block name="frontend_detail_answer_author_block"}
        <small>
            {* Answer author content *}
            {block name='frontend_detail_answer_author_field'}
                {s name="DetailCommentInfoFromAdmin"}Admin{/s}
            {/block}
            -
            {* Review publish date content *}
            {block name='frontend_detail_answer_date_content'}
                {$vote.answer_date}
            {/block}
        </small>
    {/block}
</blockquote>