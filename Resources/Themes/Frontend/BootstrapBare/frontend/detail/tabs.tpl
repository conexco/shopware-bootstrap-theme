{* Tab navigation for the product detail page *}
{block name="frontend_detail_tabs"}
    {block name="frontend_detail_tabs_inner"}
        {* Tabsnavigation *}
        {block name="frontend_detail_tabs_navigation"}
            <ul class="nav nav-tabs mb-3 d-none d-sm-flex">
                {block name="frontend_detail_tabs_navigation_inner"}
                    {* Description tab *}
                    {block name="frontend_detail_tabs_description"}
                        <li class="nav-item">
                            <a href="#description"
                               data-toggle="tab"
                               class="nav-link {if $sAction != "ratingAction"}active{/if}">
                                {s name='DetailTabsDescription'}{/s}</a>
                        </li>
                    {/block}

                    {* Rating tab *}
                    {block name="frontend_detail_tabs_rating"}
                        {if !{config name=VoteDisable}}
                            <li class="nav-item">
                                <a href="#comments"
                                   data-toggle="tab" 
                                   id="tabcomments"
                                   class="nav-link {if $sAction == "ratingAction"}active{/if}">
                                    {s name='DetailTabsRating'}{/s}
                                    {block name="frontend_detail_tabs_navigation_rating_count"}
                                        <span class="badge badge-secondary">{$sArticle.sVoteAverange.count}</span>
                                    {/block}
                                </a>
                            </li>
                        {/if}
                    {/block}
                {/block}
            </ul>

            {* Offcanvas Tabs *} 
            {block name="frontend_detail_tabs_navigation_offcanvas"}
                <div class="off-canvas-tabs d-sm-none mb-4">
                    {* Description offcanvas tab *}
                    {block name="frontend_detail_tabs_description_offcanvas"}
                        <div class="card">
                            <div class="card-body">
                                <a href="#description" 
                                   data-offcanvas="true" data-offCanvasSelector="#description" data-fullscreen="true"
                                   title="{s name='DetailTabsDescription'}{/s}"
                                   class="btn-link btn-block">
                                    {s name='DetailTabsDescription'}{/s}
                                    <i class="fa fa-angle-right float-right"></i>
                                </a>
                            </div>
                        </div>
                    {/block}
                    {* Rating offcanvas tab *}
                    {block name="frontend_detail_tabs_rating_offcanvas"}
                        {if !{config name=VoteDisable}}
                            <div class="card">
                                <div class="card-body">
                                    <a href="#comments"
                                       data-offcanvas="true" data-offCanvasSelector="#comments" data-fullscreen="true"
                                       title="{s name='DetailTabsRating'}{/s}"
                                       class="btn-link btn-block {if $sErrorFlag}is-invalid{/if}" >
                                        {s name='DetailTabsRating'}{/s}
                                        <span class="badge badge-secondary">{$sArticle.sVoteAverange.count}</span>
                                        <i class="fa fa-angle-right float-right"></i>
                                    </a>
                                </div>
                            </div>
                        {/if}
                    {/block}
                </div>
            {/block}
        {/block}

        {* Content Tabs *} 
        {block name="frontend_detail_tabs_content"}
            <div class="tab-content container mb-5">
                {block name="frontend_detail_tabs_content_inner"}
                    {* Description container *}
                    {block name="frontend_detail_tabs_content_description"}
                        <div class="tab-pane{if $sAction != "ratingAction"} active{/if} pam" id="description">
                            {* Description content *}
                            <div class="tab-content-description">
                                {block name="frontend_detail_tabs_description_inner"}
                                    {include file="frontend/detail/tabs/description.tpl"}
                                {/block}
                            </div>
                        </div>
                    {/block}
                    
                    {* Rating container *}
                    {block name="frontend_detail_tabs_content_rating"}
                        {if !{config name=VoteDisable}}
                            <div class="tab-pane{if $sAction == "ratingAction"} active{/if} pam" id="comments">
                                {* Rating content *}
                                {block name="frontend_detail_tabs_content_rating_inner"}
                                    <div class="row">
                                        <div class="col-md-6">    
                                            {include file="frontend/detail/tabs/comment.tpl"}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/if}
                    {/block}
                {/block}
            </div>
        {/block}
    {/block}
{/block}
