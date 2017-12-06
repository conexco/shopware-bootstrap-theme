{if $sFilterDate|@count > 1 || $sFilterAuthor|@count > 1 || $sFilterTags|@count > 1}
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-filter mrm"></i>{s name='BlogFilterTitle'}Filtern nach{/s}</h3>
        </div>
        {if $sFilterDate && $sFilterDate|@count > 1}
            {* Filter by date *}
            {if $smarty.get.sFilterDate==$date.dateFormatDate}
                {assign var=filterDateActive value=true}
            {/if}
            {block name='frontend_blog_filter_date'}
                <div class="list-group group">
                    {* Filter headline *}
                    {block name="frontend_blog_filter_date_headline"}
                        <a class="list-group-item{if !$filterDateActive} active{/if}"{if $filterDateActive} data-toggle="collapse" href="#filterDate"{/if}><i class="fa fa-calendar mrs"></i> {s name="BlogHeaderFilterDate"}{/s}{if $filterDateActive}<i class="fa fa-lg fa-angle-down float-right"></i>{/if}</a>
                    {/block}

                    {* Filter content *}
                    {block name="frontend_blog_filter_date_content"}
                        <div class="list-group collapse{if !$filterDateActive} in{/if}" id="filterDate">
                            {foreach name=filter from=$sFilterDate item=date}
                                {if !$date.removeProperty}
                                    {if $smarty.get.sFilterDate==$date.dateFormatDate}
                                        <a class="list-group-item" href="{$sFilterDate[1].link}" title="{s name='DeleteFilter' namespace='frontend/listing/filter_properties'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-check-square-o mrs"></i>
                                            {$date.dateFormatDate}
                                            <i class="fa fa-trash-o float-right"></i>
                                        </a>
                                    {else}
                                        <a class="list-group-item" href="{$date.link}" title="{$date.dateFormatDate}">
                                            <i class="fa fa-square-o mrs"></i>
                                            {$date.dateFormatDate}
                                            <span class="badge">{$date.dateCount}</span>
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        </div>
                    {/block}
                </div>
            {/block}
        {/if}

        {if $sFilterAuthor && $sFilterAuthor|@count > 1}
            {* Filter by author *}
            {if $smarty.get.sFilterAuthor==$author.name|urlencode}
                {assign var=filterAuthorActive value=true}
            {/if}
            {block name='frontend_blog_filter_author'}
                <div class="list-group group">
                    {* Filter headline *}
                    {block name="frontend_blog_filter_author_headline"}
                        <a class="list-group-item{if !$filterAuthorActive} active{/if}"{if $filterAuthorActive} data-toggle="collapse" href="#filterAuthor"{/if}><i class="fa fa-user mrs"></i> {s name="BlogHeaderFilterAuthor"}Author{/s}{if $filterAuthorActive}<i class="fa fa-lg fa-angle-down float-right"></i>{/if}</a>
                    {/block}

                    {* Filter content *}
                    {block name="frontend_blog_filter_author_content"}
                        <div class="list-group collapse{if !$filterAuthorActive} in{/if}" id="filterAuthor">
                            {foreach name=filterAuthor from=$sFilterAuthor item=author}
                                {if !$author.removeProperty}
                                    {if $smarty.get.sFilterAuthor==$author.name|urlencode}
                                        <a class="list-group-item" href="{$sFilterAuthor[1].link}" title="{s name='DeleteFilter'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-check-square-o mrs"></i>
                                            {$author.name}
                                            <i class="fa fa-trash-o float-right"></i>
                                        </a>
                                    {else}
                                        <a class="list-group-item" href="{$author.link}" title="{$author.name}">
                                            <i class="fa fa-square-o mrs"></i>
                                            {$author.name}
                                            <span class="badge">{$author.authorCount}</span>
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        </div>
                    {/block}
                </div>
            {/block}
        {/if}

        {if $sFilterTags && $sFilterTags|@count > 1}
            {* Filter by tags *}
            {if $smarty.get.sFilterTags==$tag.name|urlencode}
                {assign var=filterTagsActive value=true}
            {/if}
            {block name='frontend_blog_filter_tags'}
                <div class="list-group group">
                    {* Filter headline *}
                    {block name="frontend_blog_filter_tags_headline"}
                        <a class="list-group-item{if !$filterTagsActive} active{/if}"{if $filterTagsActive} data-toggle="collapse" href="#filterTags"{/if}><i class="fa fa-tag mrs"></i> {s name="BlogHeaderFilterTags"}Schlagwörtern{/s}{if $filterTagsActive}<i class="fa fa-lg fa-angle-down float-right"></i>{/if}</a>
                    {/block}
                    {* Filter content *}
                    {block name="frontend_blog_filter_tags_content"}
                        <div class="list-group collapse{if !$filterTagsActive} in{/if}" id="filterTags">
                            {foreach name=filterTags from=$sFilterTags item=tag}
                                {if !$tag.removeProperty}
                                    {if $smarty.get.sFilterTags==$tag.name|urlencode}
                                        <a class="list-group-item" href="{$sFilterTags[1].link}" title="{s name='DeleteFilter'}Filter l&ouml;schen{/s}">
                                            <i class="fa fa-check-square-o mrs"></i>
                                            {$tag.name}
                                            <i class="fa fa-trash-o float-right"></i>
                                        </a>
                                    {else}
                                        <a class="list-group-item" href="{$tag.link}" title="{$tag.name}">
                                            <i class="fa fa-square-o mrs"></i>
                                            {$tag.name}
                                            <span class="badge">{$tag.tagsCount}</span>
                                        </a>
                                    {/if}
                                {/if}
                            {/foreach}
                        </div>
                     {/block}
                </div>
            {/block}
        {/if}
    </div>
{/if}		
