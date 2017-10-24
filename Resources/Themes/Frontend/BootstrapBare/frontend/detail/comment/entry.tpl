{namespace name="frontend/detail/comment"}

{block name="frontend_detail_comment_block_entry"}
    <blockquote itemprop="review" itemscope itemtype="http://schema.org/Review">
        {* Name of the reviewed product *}
        {block name="frontend_detail_comment_rich_snippets_name"}
            <meta itemprop="itemReviewed" content="{$sArticle.articleName|htmlentities}"/>
        {/block}

        {block name='frontend_detail_comment_text'}
            {* Star rating *}
            {block name="frontend_detail_comment_star_rating"}
                <div class="mbl">
                    {include file="frontend/_includes/rating.tpl" points=$vote.points}
                </div>
            {/block}

            {* Headline *}
            {block name='frontend_detail_comment_headline'}
                <h4 itemprop="name">{$vote.headline}</h4>
            {/block}

            {* Review text *}
            {block name='frontend_detail_comment_content'}
                <meta itemprop="reviewBody" content="{$vote.comment|nl2br}"/>
                <p>{$vote.comment|nl2br}</p>
            {/block}
        {/block}

        {block name='frontend_detail_comment_header'}
            <small>
                {block name='frontend_detail_comment_header_inner'}
                    {* Author *}
                    {block name='frontend_detail_comment_author'}
                        <meta itemprop="author" content="{$vote.name|htmlentities}"/>
                        {$vote.name}
                    {/block}
                    -
                    {* Date *}
                    {block name='frontend_detail_comment_date'}
                        <meta itemprop="datePublished" content="{$vote.datum|date_format:'%Y-%m-%d'}">
                        {$vote.datum}
                    {/block}
                {/block}
            </small>
        {/block}
    </blockquote>
{/block}
