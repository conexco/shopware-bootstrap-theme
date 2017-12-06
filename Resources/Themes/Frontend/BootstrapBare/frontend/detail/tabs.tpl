{* Tab navigation for the product detail page *}
{block name="frontend_detail_tabs"}
    <div class="col-md-8">
        {block name="frontend_detail_tabs_inner"}
            {*! Tabsnavigation *}
            {block name="frontend_detail_tabs_navigation"}
                <ul class="nav nav-tabs d-none d-sm-block">
                    {block name="frontend_detail_tabs_navigation_inner"}
                        {* Description tab *}
                        {block name="frontend_detail_tabs_description"}
                            <li {if $sAction != "ratingAction"}class="active"{/if}>
                                <a href="#description" data-toggle="tab">{s name='DetailTabsDescription'}{/s}</a>
                            </li>
                        {/block}
                        {* Rating tab *}
                        {block name="frontend_detail_tabs_rating"}
                            {if !{config name=VoteDisable}}
                                <li {if $sAction == "ratingAction"}class="active"{/if}>
                                    <a href="#comments" data-toggle="tab" id="tabcomments">
                                        {s name='DetailTabsRating'}{/s}
                                        {block name="frontend_detail_tabs_navigation_rating_count"}
                                            <span class="badge badge-pill">{$sArticle.sVoteAverange.count}</span>
                                        {/block}
                                    </a>
                                </li>
                            {/if}
                        {/block}
                        {* Related tab *}
                        {block name="frontend_detail_tabs_related"}
                            {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                <li>
                                    <a data-toggle="tab" href="#related">
                                        {s name='DetailTabsAccessories'}Zubehör{/s} <span class="badge badge-pill">{$sArticle.sRelatedArticles|@count}</span>
                                    </a>
                                </li>
                            {/if}
                        {/block}
                    {/block}
                </ul>

                {* Offcanvas Tabs *}
                {block name="frontend_detail_tabs_navigation_offcanvas"}
                    <div class="off-canvas-tabs d-sm-none">
                        {* Description offcanvas tab *}
                        {block name="frontend_detail_tabs_description_offcanvas"}
                            <div class="panel panel-default">
                                <a href="#" data-offcanvas="true" data-offCanvasSelector="#description" data-fullscreen="true" title="{s name='DetailTabsDescription'}{/s}">
                                    {s name='DetailTabsDescription'}{/s}
                                    <i class="fa fa-angle-right float-right"></i>
                                </a>
                            </div>
                        {/block}
                        {* Rating offcanvas tab *}
                        {block name="frontend_detail_tabs_rating_offcanvas"}
                            {if !{config name=VoteDisable}}
                                <div class="panel panel-default">
                                    <a class="{if $sErrorFlag}has-error{/if}" href="#" data-offcanvas="true" data-offCanvasSelector="#comments" data-fullscreen="true" title="{s name='DetailTabsRating'}{/s}">
                                        {s name='DetailTabsRating'}{/s}
                                        <span class="badge badge-pill">{$sArticle.sVoteAverange.count}</span>
                                        <i class="fa fa-angle-right float-right"></i>
                                    </a>
                                </div>
                            {/if}
                        {/block}
                        {* Related offcanvas tab *}
                        {block name="frontend_detail_tabs_related_offcanvas"}
                            {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                <div class="panel panel-default">
                                    <a href="#" data-offcanvas="true" data-offCanvasSelector="#related" data-fullscreen="true" title="{s name='DetailTabsAccessories'}{/s}">
                                        {s name='DetailTabsAccessories'}{/s}
                                        <span class="badge badge-pill">{$sArticle.sRelatedArticles|@count}</span>
                                        <i class="fa fa-angle-right float-right"></i>
                                    </a>
                                </div>
                            {/if}
                        {/block}
                    </div>
                {/block}
            {/block}
            {block name="frontend_detail_tabs_content"}
                <div class="tab-content">
                    {block name="frontend_detail_tabs_content_inner"}
                        {* Description container *}
                        {block name="frontend_detail_tabs_content_description"}
                            <div class="tab-pane{if $sAction != "ratingAction"} active{/if} pam" id="description">
                                {*! Article description *}
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
                                    {*! Article rating *}
                                    {block name="frontend_detail_tabs_content_rating_inner"}
                                        {include file="frontend/detail/tabs/comment.tpl"}
                                    {/block}
                                </div>
                            {/if}
                        {/block}
                        {*! Related articles *}
                        {block name="frontend_detail_tabs_content_related"}
                            {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                <div class="tab-pane pam" id="related">
                                    {include file="frontend/detail/tabs/related.tpl"}
                                </div>
                            {/if}
                        {/block}
                    {/block}
                </div>
            {/block}
        {/block}
    </div>
{/block}


