{* Breadcrumb / Article navigation *}
{block name='frontend_detail_menu_top'}
    <nav class="breadcrumbs d-none d-md-block" 
         aria-label="breadcrumb" 
         role="navigation">
        {block name="frontend_detail_breadcrumb_overview"}
            <ol class="breadcrumb">
                {$breadCrumbBackLink = $sBreadcrumb[count($sBreadcrumb) - 1]['link']}

                <a href="{if $breadCrumbBackLink}{$breadCrumbBackLink}{else}#{/if}" 
                   title="{s name='DetailNavIndex'}{/s}" 
                   class="breadcrumb-back-btn sw5-plugin">
                   &laquo; {s name='DetailNavIndex'}{/s}
                </a> &nbsp;&nbsp;|&nbsp;&nbsp;

                {if $sShopname}
                    <li class="breadcrumb-item">
                        <a href="{url controller='index'}" title="{$sShopname}">
                            {$sShopname}
                        </a>
                    </li>
                {/if}

                {foreach name=breadcrumb from=$sBreadcrumb item=breadcrumb}
                    {if $breadcrumb.name}
                        {if $smarty.foreach.breadcrumb.last}
                            <li class="breadcrumb-item active" aria-current="page">
                                {$breadcrumb.name}
                            </li>
                        {else}
                            <li class="breadcrumb-item">
                                <a href="{if $breadcrumb.link}{$breadcrumb.link}{else}#{/if}" 
                                   title="{$breadcrumb.name}">
                                    {$breadcrumb.name}
                                </a>
                            </li>
                        {/if}
                    {/if}
                {/foreach}

                {* Product navigation - Previous and next arrow button *}
                {block name="frontend_detail_index_navigation"}
                    {if !{config name=disableArticleNavigation}}
                        <li class="article-navigation float-right">
                            <ul class="list-inline">
                                {* Previous product *}
                                {block name='frontend_detail_article_back'}
                                    <li class="list-inline-item">
                                        <a href="#" 
                                           class="btn pan product-navigation-prev sw5-plugin" 
                                           data-trigger="hover" 
                                           data-popoverclass="product-navigation">
                                            <i class="fa fa-long-arrow-left mrs"></i>
                                            <small class="d-none d-md-inline">
                                                {s name="DetailPreviousArticleLinkText"}Vorheriger{/s}
                                            </small>
                                        </a>
                                    </li>
                                {/block}
                                {* Next product *}
                                {block name='frontend_detail_article_next'}
                                    <li class="list-inline-item">
                                        <a href="#" 
                                           class="btn pan product-navigation-next sw5-plugin" 
                                           data-trigger="hover" 
                                           data-popoverclass="product-navigation">
                                            <small class="d-none d-md-inline">
                                                {s name="DetailNextArticleLinkText"}Nächster{/s}
                                            </small>
                                            <i class="fa fa-long-arrow-right mls"></i>
                                        </a>
                                    </li>
                                {/block}
                            </ul>
                        </li>
                    {/if}
                {/block}
            </ol>
        {/block}
    </nav>
{/block}