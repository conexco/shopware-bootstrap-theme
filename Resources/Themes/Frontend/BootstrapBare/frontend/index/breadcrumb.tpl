<nav class="breadcrumbs d-none d-md-block" 
     aria-label="breadcrumb" 
     role="navigation" 
     itemscope 
     itemtype="http://schema.org/BreadcrumbList">
    <ol class="breadcrumb">
        {block name="frontend_index_breadcrumb_prefix"}
            {if $sShopname}
                <li class="breadcrumb-item">
                    <a href="{url controller='index'}" title="{$sShopname}">
                        {$sShopname}
                    </a>
                </li>
            {/if}
        {/block}

        {block name="frontend_index_breadcrumb_content"}
            {foreach name=breadcrumb from=$sBreadcrumb item=breadcrumb}
                {block name="frontend_index_breadcrumb_entry"}
                    {if $breadcrumb.name}
                        <li class="breadcrumb-item{if $smarty.foreach.breadcrumb.last} active{/if}" 
                            {if $smarty.foreach.breadcrumb.last}aria-current="page"{/if}
                            itemprop="itemListElement" 
                            itemscope 
                            itemtype="http://schema.org/ListItem">
                            {block name="frontend_index_breadcrumb_entry_inner"}
                                {if $breadcrumb.link}
                                    <a href="{$breadcrumb.link}" title="{$breadcrumb.name}" itemprop="item">
                                        <link itemprop="url" href="{$breadcrumb.link}" />
                                        {$breadcrumb.name}
                                    </a>
                                {else}
                                    <span class="breadcrumb-link" itemprop="item">
                                        <span class="breadcrumb-title" itemprop="name">
                                            {$breadcrumb.name}
                                        </span>
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
    </ol>
</nav>
