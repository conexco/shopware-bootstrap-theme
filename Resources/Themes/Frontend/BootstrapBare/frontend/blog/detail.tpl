{extends file='frontend/index/index.tpl'}

{block name="gridconfig" prepend}
    {assign "grid" "g010" scope="global"}
{/block}

{block name='frontend_index_header'}
    {include file='frontend/blog/header.tpl'}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Content *}
    {block name='frontend_blog_detail_content'}
        <div class="blog-detail-content pbl" itemscope itemtype="https://schema.org/BlogPosting">
            {* Rich snippets *}
            {block name='frontend_blog_detail_rich_snippets'}
                {if $sArticle.author.name}
                    <meta itemprop="author" content="{$sArticle.author.name}">
                {/if}
                <meta itemprop="wordCount" content="{$sArticle.description|strip_tags|count_words}">
            {/block}

            {* Detail Box Header *}
            {block name='frontend_blog_detail_box_header'}
                {* Article name *}
                {block name='frontend_blog_detail_title'}
                    <h1>{$sArticle.title}</h1>
                {/block}

                {* Category *}
                {block name='frontend_blog_detail_category'}{/block}

                {* Rating*}
                {block name='frontend_blog_detail_rating'}
                    <div class="mbl">{include file="frontend/_includes/rating.tpl" points=$sArticle.sVoteAverage|round type="aggregated" count=$sArticle.comments|count}</div>
                {/block}
            {/block}

            {* Detail Box Content *}
            {block name='frontend_blog_detail_box_content'}
                {block name='frontend_blog_detail_box_content_article_main'}
                    {block name='frontend_blog_detail_images'}
                        {include file="frontend/blog/images.tpl"}
                    {/block}
                    {block name='frontend_blog_detail_description'}
                        {$sArticle.description}
                    {/block}
                {/block}

                {* Tags *}
                {block name='frontend_blog_detail_box_content_article_tags'}
                    {if $sArticle.tags}
                        <div class="text-right mtl mbl">
                            <strong>{s name="BlogInfoTags" namespace='frontend/blog/box'}Tags:{/s}</strong>
                            {foreach $sArticle.tags as $tag}
                                <a href="{url controller=blog sCategory=$sArticle.categoryId sFilterTags=$tag.name}" title="{$tag.name}"
                                   class="btn btn-default btn-xs">
                                    <i class="fa fa-tag mrs"></i>{$tag.name}
                                </a>
                            {/foreach}
                        </div>
                    {/if}
                {/block}

                {block name='frontend_blog_detail_box_content_article_footer'}
                    <div class="row">
                        {block name='frontend_blog_detail_box_content_article_footer_info'}
                            <div class="col-md-6">
                                <div class="mtm">
                                    {* Author *}
                                    {block name='frontend_blog_detail_author'}
                                        {if $sArticle.author.name}
                                            &nbsp;{s name="BlogInfoFrom" namespace='frontend/blog/box'}{/s}: {$sArticle.author.name}
                                            {block name='frontend_blog_detail_author_separator'}
                                                {s name="BlogInfoSeparator" namespace='frontend/blog/box'} | {/s}
                                            {/block}
                                        {/if}
                                    {/block}

                                    {* Date *}
                                    {block name='frontend_blog_detail_date'}
                                        {$sArticle.displayDate|date_format:"%d.%m.%Y %H:%M"}
                                    {/block}

                                    {* Comments *}
                                    {block name='frontend_blog_detail_comments_count'}
                                        {* @deprecated - will be removed, use block frontend_blog_detail_comments_list *}
                                        {block name='frontend_blog_detail_comments'}
                                            {if $sArticle.sVoteAverage|round != "0"}
                                                {block name='frontend_blog_detail_date_separator'}
                                                    {s name="BlogInfoSeparator" namespace='frontend/blog/box'} | {/s}
                                                {/block}
                                                <a href="#commentcontainer" class="text-primary" title="{s name="BlogLinkComments"}{/s}">
                                                    ({if $sArticle.comments|count}{$sArticle.comments|count}{else}0 {/if})
                                                    {s name="BlogInfoComments" namespace='frontend/blog/box'}{/s}
                                                </a>
                                            {/if}
                                        {/block}
                                    {/block}
                                </div>
                            </div>
                        {/block}

                        {* Bookmarks *}
                        {block name='frontend_blog_detail_bookmarks'}
                            <div class="col-md-6">
                                {include file="frontend/blog/bookmarks.tpl"}
                            </div>
                        {/block}
                    </div>
                {/block}
            {/block}
        </div>
    {/block}

    {* Cross selling *}
    {block name='frontend_blog_detail_crossselling'}
        {if $sArticle.sRelatedArticles}
            {* Headline *}
            {block name='frontend_blog_detail_crossselling_headline'}
                <h2>{s name="BlogHeaderCrossSelling"}{/s}</h2>
            {/block}
            {* Listing *}
            {block name='frontend_blog_detail_crossselling_listing'}
                <div class="row">
                    <ul class="thumbnails list-unstyled" data-equalheight="true">
                        {foreach from=$sArticle.sRelatedArticles item=related name=relatedarticle}
                            {include file="frontend/listing/box_article.tpl" sArticle=$related productBoxLayout="blog"}
                        {/foreach}
                    </ul>
                </div>
            {/block}
        {/if}
    {/block}

    {* Comments *}
    {block name='frontend_blog_detail_comments_list'}
        {* @deprecated - will be removed, use block frontend_blog_detail_comments_list *}
        {block name='frontend_blog_detail_comments'}
            {include file="frontend/blog/comments.tpl"}
        {/block}
    {/block}
{/block}

{* Empty sidebar right *}
{block name='frontend_index_content_right'}{/block}

{* Empty sidebar left *}
{block name='frontend_index_content_left'}{/block}

