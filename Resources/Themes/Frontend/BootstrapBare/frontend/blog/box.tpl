{block name='frontend_blog_col_blog_entry'}
    <div class="panel panel-default">
        {* Blog Header *}
        {block name='frontend_blog-col_box_header'}
            <div class="panel-heading">
                {* Article name *}
                {block name='frontend_blog_col_article_name'}
                    <h2>
                        <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                           title="{$sArticle.title}">{$sArticle.title}</a>
                    </h2>
                {/block}
                {* Meta data *}
                {block name='frontend_blog_col_meta_data'}
                    {* Rating *}
                    {block name='frontend_blog_col_meta_data_rating'}
                        {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage type="aggregated" count=$sArticle.numberOfComments}
                    {/block}
                {/block}
            </div>
        {/block}

        {* Blog Box *}
        {block name='frontend_blog_col_box_content'}
            <div class="panel-body">
                {* Article pictures *}
                {if $sArticle.media}
                <div class="row">
                    <div class="col-lg-3">
                        {block name='frontend_blog_col_article_picture'}
                            <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                               title="{$sArticle.title|escape}">
                                {if isset($sArticle.media.thumbnails)}
                                    <img srcset="{$sArticle.media.thumbnails[0].sourceSet}"
                                         alt="{$sArticle.title|escape}"
                                         class="img-fluid mbm"
                                         title="{$sArticle.title|escape|truncate:160:""}" />
                                {else}
                                    <img src="{link file='frontend/_public/src/img/no-picture.png'}"
                                         alt="{$sArticle.title|escape}"
                                         class="img-fluid mbm"
                                         title="{$sArticle.title|escape|truncate:160:""}" />
                                {/if}
                            </a>
                        {/block}
                    </div>
                    <div class="col-lg-9">
                {/if}
                        {* Article Description *}
                        {block name='frontend_blog_col_description'}
                            <p>
                                {block name='frontend_blog_col_description_short'}
                                    {if $sArticle.shortDescription}{$sArticle.shortDescription|nl2br}{else}{$sArticle.shortDescription}{/if}
                                {/block}
                            </p>
                        {/block}
                        {* Tags *}
                        {block name='frontend_blog_col_tags'}
                            {if $sArticle.tags|@count > 1}
                                <p class="text-right">
                                    <strong>{s name='BlogInfoTags' namespace='frontend/blog/box'}Tags:{/s}</strong>
                                    {foreach $sArticle.tags as $tag}
                                        <a href="{$tag.link}" title="{$tag.name}" class="btn btn-default btn-xs">
                                            <i class="fa fa-tag mrs"></i>{$tag.name}</a>
                                    {/foreach}
                                </p>
                            {/if}
                        {/block}

                {if $sArticle.media}
                    </div>
                </div>
                {/if}

                {block name='frontend_blog_col_bottom_row'}
                    <div class="row">
                        {block name='frontend_blog_col_meta_data_col'}
                            <div class="col-xs-12 col-hd-9 col-hd-push-3 text-right">
                                <p class="mtm">
                                    {* Author *}
                                    {block name='frontend_blog_col_meta_data_name'}
                                        {if $sArticle.author.name}
                                            {s name="BlogInfoFrom" namespace='frontend/blog/box'}von{/s} {$sArticle.author.name}
                                            {block name='frontend_blog_col_meta_data_separator_one'}
                                                {s name="BlogInfoSeparator" namespace='frontend/blog/box'} | {/s}
                                            {/block}
                                        {/if}
                                    {/block}

                                    {* Date *}
                                    {block name='frontend_blog_col_meta_data_date'}
                                        {if $sArticle.displayDate}
                                            {$sArticle.displayDate|date_format:"%d.%m.%Y %H:%M"}
                                            {block name='frontend_blog_col_meta_data_separator_two'}
                                                {s name="BlogInfoSeparator" namespace='frontend/blog/box'} | {/s}
                                            {/block}
                                        {/if}
                                    {/block}

                                    {block name='frontend_blog_col_meta_data_description'}{/block}

                                    {* Comments *}
                                    {block name='frontend_blog_col_meta_data_comments'}
                                        <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}#commentcontainer"
                                           title="{$sArticle.articleName}" class="text-primary">({if $sArticle.numberOfComments}{$sArticle.numberOfComments}{else}0{/if}) <span class="hidden-xs hidden-sm">{s name="BlogInfoComments" namespace='frontend/blog/box'}Kommentare{/s}<span></span></a>
                                    {/block}
                                </p>
                            </div>
                        {/block}
                        {block name='frontend_blog_col_read_more_col'}
                            <div class="col-xs-12 col-hd-3 col-hd-pull-9">
                                {* Read more button *}
                                {block name='frontend_blog_col_read_more'}
                                    <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                                       title="{$sArticle.title}"
                                       class="btn btn-primary btn-xs mtm-hd mtm-md mtm-lg">{s name="BlogLinkMore"}{/s}</a>
                                {/block}
                            </div>
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}