<div class="breadcrumb align-items-center d-none d-md-flex p-0">
    <div class="col-md-8 p-0">
        <nav class="breadcrumbs" 
             aria-label="breadcrumb" 
             role="navigation" 
             itemscope 
             itemtype="http://schema.org/BreadcrumbList">
            <ol class="breadcrumb mb-0">
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
                                        {if $breadcrumb.link && !$smarty.foreach.breadcrumb.last}
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
    </div>
    <div class="col-md-4 p-0">
        {block name="frontend_detail_index_navigation"}{/block}
    </div>
</div>

