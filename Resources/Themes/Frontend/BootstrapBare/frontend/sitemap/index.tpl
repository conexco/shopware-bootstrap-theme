{extends file="frontend/index/index.tpl"}

{* Breadcrumb *}
{block name="frontend_index_start"}
    {$sBreadcrumb = [['name'=>"{s name='SitemapTitle'}{/s}", 'link'=>{url controller=sitemap}]]}
    {$smarty.block.parent}
{/block}

{block name="frontend_index_content"}
    {block name="frontend_sitemap_headline"}
        <h1>{s name='SitemapHeader'}Sitemap - Alle Kategorien auf einen Blick{/s}</h1>
    {/block}

    {block name="frontend_sitemap_content"}
        {foreach $sCategoryTree as $categoryTree}
            {if ($categoryTree.name == 'SitemapStaticPages' || $categoryTree.name == 'SitemapSupplierPages' || $categoryTree.name == 'SitemapLandingPages') && !$categoryTree.sub}
                {continue}
            {/if}

            {block name="frontend_sitemap_category"}
                <div class="sitemap-category">

                    {block name="frontend_sitemap_navigation"}
                        <ul class="sitemap-navigation">

                            {block name="frontend_sitemap_navigation_headline"}
                                <li class="sitemap-navigation-head">

                                    {if $categoryTree.name == 'SitemapStaticPages'}
                                        {block name="frontend_sitemap_navigation_staticpages"}
                                            <a href="{$categoryTree.link}" title="{"{s name='SitemapStaticPages'}{/s}"|escape}" class="sitemap-navigation-head-link active">
                                                {s name='SitemapStaticPages'}{/s}
                                            </a>
                                        {/block}
                                    {elseif $categoryTree.name == 'SitemapSupplierPages'}
                                        {block name="frontend_sitemap_navigation_supplierpages"}
                                            <a href="{$categoryTree.link}" title="{"{s name='SitemapSupplierPages'}{/s}"|escape}" class="sitemap-navigation-head-link active">
                                                {s name='SitemapSupplierPages'}{/s}
                                            </a>
                                        {/block}
                                    {elseif $categoryTree.name == 'SitemapLandingPages'}
                                        {block name="frontend_sitemap_navigation_landingpages"}
                                            <a href="{$categoryTree.link}" title="{"{s name='SitemapLandingPages'}{/s}"|escape}" class="sitemap-navigation-head-link active">
                                                {s name='SitemapLandingPages'}{/s}
                                            </a>
                                        {/block}
                                    {else}
                                        {block name="frontend_sitemap_navigation_defaultpages"}
                                            <a href="{$categoryTree.link}" title="{$categoryTree.name|escape}" class="sitemap-navigation-head-link active"{if $categoryTree.external && $categoryTree.externalTarget} target="{$categoryTree.externalTarget}"{/if}>
                                                {$categoryTree.name}
                                            </a>
                                        {/block}
                                    {/if}

                                </li>
                            {/block}

                            {if $categoryTree.sub}
                                {include file="frontend/sitemap/recurse.tpl" sCategoryTree=$categoryTree.sub depth=1}
                            {/if}
                        </ul>
                    {/block}

                </div>
            {/block}
        {/foreach}
    {/block}
{/block}
