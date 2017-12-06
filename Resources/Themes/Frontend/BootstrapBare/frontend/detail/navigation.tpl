{* Breadcrumb / Article navigation *}
{block name='frontend_detail_menu_top'}
    <div class="hidden-sm hidden-xs">
        {block name="frontend_detail_breadcrumb_overview"}
            <ul class="breadcrumb">
                {$breadCrumbBackLink = $sBreadcrumb[count($sBreadcrumb) - 1]['link']}
                <a href="{if $breadCrumbBackLink}{$breadCrumbBackLink}{else}#{/if}" title="{s name='DetailNavIndex'}{/s}" class="breadcrumb-back-btn sw5-plugin"><strong>&laquo; {s name='DetailNavIndex'}{/s}</strong></a> &nbsp;&nbsp;|&nbsp;&nbsp;
                {if $sShopname}
                    <li><a href="{url controller='index'}">{$sShopname}</a></li>
                {/if}
                {foreach name=breadcrumb from=$sBreadcrumb item=breadcrumb}
                    {if $breadcrumb.name}
                        {if $smarty.foreach.breadcrumb.last}
                            <li class="active">{$breadcrumb.name}</li>
                        {else}
                            <li>
                                <a href="{if $breadcrumb.link}{$breadcrumb.link}{else}#{/if}" title="{$breadcrumb.name}">{$breadcrumb.name}</a>
                            </li>
                        {/if}
                    {/if}
                {/foreach}
                {* Product navigation - Previous and next arrow button *}
                {block name="frontend_detail_index_navigation"}
                    {if !{config name=disableArticleNavigation}}
                        <li class="article-navigation pull-right">
                            <ul class="list-inline">
                                {* Previous product *}
                                {block name='frontend_detail_article_back'}
                                    <li>
                                        <a href="#" class="btn pan product-navigation-prev sw5-plugin" data-trigger="hover" data-popoverclass="product-navigation">
                                            <i class="fa fa-long-arrow-left mrs"></i>
                                            <small class="d-none d-md-inline">{s name="DetailPreviousArticleLinkText"}Vorheriger{/s}</small>
                                        </a>
                                    </li>
                                {/block}
                                {* Next product *}
                                {block name='frontend_detail_article_next'}
                                    <li>
                                        <a href="#" class="btn pan product-navigation-next sw5-plugin" data-trigger="hover" data-popoverclass="product-navigation">
                                            <small class="d-none d-md-inline">{s name="DetailNextArticleLinkText"}Nächster{/s}</small>
                                            <i class="fa fa-long-arrow-right mls"></i>
                                        </a>
                                    </li>
                                {/block}
                            </ul>
                        </li>
                    {/if}
                {/block}
            </ul>
        {/block}
    </div>
{/block}