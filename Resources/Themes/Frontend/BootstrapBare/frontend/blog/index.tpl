{extends file='frontend/index/index.tpl'}

{block name="gridconfig" prepend}
    {assign "grid" "g110" scope="global"}
{/block}

{* push sidebar to the right on desktop *}
{block name="frontend_index_content_left_wrapper" prepend}
    {if $grid eq 'g110'}
        {assign "gridLeftStart" "&lt;div class=\"col-xs-12 col-hd-push-{math equation="x-y" x=12 y=$theme['amount-left-columns']} col-hd-`$theme['amount-left-columns']`\" id=\"gLeft\"&gt;" scope="global"}
        {assign "gridCenterStart" "&lt;div class=\"col-xs-12 col-hd-pull-{$theme['amount-left-columns']} col-hd-{math equation="x-y" x=12 y=$theme['amount-left-columns']}\" id=\"gCenter\"&gt;" scope="global"}
    {/if}
{/block}

{block name='frontend_index_header'}
    {include file='frontend/blog/header.tpl'}
{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}
    {* Blog Sidebar *}
    {block name='frontend_blog_listing_sidebar'}
        <div class="off-canvas-blog sw5-plugin">
            {block name='frontend_blog_listing_sidebar_offcanvas_open'}
                <a href="#" class="btn btn-default btn-block blog-filter-offcanvas-btn mbl d-md-none" data-offcanvas="true" data-offCanvasSelector="#blogSidebar" title="{s name="BlogOffcanvasButton"}Filter{/s}">
                    <i class="fa fa-filter mrs"></i>
                    {s name="BlogOffcanvasButton"}{/s}
                    <i class="fa fa-angle-right offcanvas-btn-angle"></i>
                </a>
            {/block}
            {block name='frontend_blog_listing_sidebar_offcanvas_active_filter'}
                {if $sFilterDate|@count > 1 || $sFilterAuthor|@count > 1 || $sFilterTags|@count > 1}
                    <div class="d-md-none mbl">
                        {* active date filter *}
                        {if $sFilterDate && $sFilterDate|@count > 1}
                            {if $smarty.get.sFilterDate==$date.dateFormatDate}
                                {assign var=filterDateActive value=true}
                            {/if}
                            {foreach name=filter from=$sFilterDate item=date}
                                {if !$date.removeProperty}
                                    {if $smarty.get.sFilterDate==$date.dateFormatDate}
                                        <a href="{$sFilterDate[1].link}" class="btn btn-xs btn-default mrm" title="{s name='DeleteFilter' namespace='frontend/listing/filter_properties'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-times text-primary"></i>
                                            {$date.dateFormatDate}
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        {/if}
                        {* active author filter *}
                        {if $sFilterAuthor && $sFilterAuthor|@count > 1}
                            {if $smarty.get.sFilterAuthor==$author.name|urlencode}
                                {assign var=filterAuthorActive value=true}
                            {/if}
                            {foreach name=filterAuthor from=$sFilterAuthor item=author}
                                {if !$author.removeProperty}
                                    {if $smarty.get.sFilterAuthor==$author.name|urlencode}
                                        <a href="{$sFilterAuthor[1].link}" class="btn btn-xs btn-default mrm" title="{s name='DeleteFilter' namespace='frontend/listing/filter_properties'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-times text-primary"></i>
                                            {$author.name}
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        {/if}
                        {* active tag filter *}
                        {if $sFilterTags && $sFilterTags|@count > 1}
                            {if $smarty.get.sFilterTags==$tag.name|urlencode}
                                {assign var=filterTagsActive value=true}
                            {/if}
                            {foreach name=filterTags from=$sFilterTags item=tag}
                                {if !$tag.removeProperty}
                                    {if $smarty.get.sFilterTags==$tag.name|urlencode}
                                        <a href="{$sFilterTags[1].link}" class="btn btn-xs btn-default mrm" title="{s name='DeleteFilter' namespace='frontend/listing/filter_properties'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-times text-primary"></i>
                                            {$tag.name}
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        {/if}
                    </div>
                {/if}
            {/block}
            {block name='frontend_blog_listing_sidebar_offcanvas_content'}
                <div id="blogSidebar" class="offcanvas-has-panel">
                    {block name='frontend_blog_listing_sidebar_offcanvas_close'}
                        {include file="frontend/_includes/close-offcanvas.tpl" class="offcanvas-blog"}
                    {/block}
                    {block name='frontend_blog_listing_sidebar_include'}
                        {include file='frontend/blog/listing_sidebar.tpl'}
                    {/block}
                </div>
            {/block}
        </div>
    {/block}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Banner *}
    {block name='frontend_blog_index_banner'}
        {include file="frontend/listing/banner.tpl"}
    {/block}
    {* Blog listing *}
    {block name='frontend_blog_index_listing'}
        {include file="frontend/blog/listing.tpl"}
    {/block}
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}
