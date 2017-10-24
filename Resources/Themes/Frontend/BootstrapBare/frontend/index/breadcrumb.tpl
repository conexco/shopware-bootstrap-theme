<ul class="breadcrumb hidden-sm hidden-xs" itemscope itemtype="http://schema.org/BreadcrumbList">
    {block name="frontend_index_breadcrumb_prefix"}
        {if $sShopname}
            <li><a href="{url controller='index'}">{$sShopname}</a></li>
        {/if}
    {/block}
    {block name="frontend_index_breadcrumb_content"}
        {foreach name=breadcrumb from=$sBreadcrumb item=breadcrumb}
            {block name="frontend_index_breadcrumb_entry"}
                {if $breadcrumb.name}
                    <li {if $smarty.foreach.breadcrumb.last}class="active"{/if} itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        {block name="frontend_index_breadcrumb_entry_inner"}
                            {if $breadcrumb.link}
                                <a href="{$breadcrumb.link}" title="{$breadcrumb.name}" itemprop="item">
                                    <link itemprop="url" href="{$breadcrumb.link}" />
                                    {$breadcrumb.name}
                                </a>
                            {else}
                                <span class="breadcrumb-link" itemprop="item">
                                    <span class="breadcrumb-title" itemprop="name">{$breadcrumb.name}</span>
                                </span>
                            {/if}
                            <meta itemprop="position" content="{$breadcrumb@index}" />
                        {/block}
                    </li>
                {/if}
            {/block}
        {/foreach}
    {/block}
    {block name="frontend_index_breadcrumb_suffix"}{/block}
</ul>

