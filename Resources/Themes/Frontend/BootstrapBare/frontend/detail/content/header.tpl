{block name='frontend_detail_index_header'}
    <div class="row align-items-center mb-3">
        {block name='frontend_detail_index_header_inner'}
            {block name='frontend_detail_index_product_info'}
                {* Product name *}
                {block name='frontend_detail_index_name'}
                    <div class="col">
                        <h1 class="h2" itemprop="name">
                            {$sArticle.articleName}
                        </h1>
                    </div>
                {/block}

                {* Product - Supplier information *}
                {block name='frontend_detail_supplier_info'}
                    {if $sArticle.supplierImg}
                        <div class="d-none d-sm-block col-sm-2">
                            <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}" 
                               title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}">
                                <img src="{$sArticle.supplierImg}" 
                                     alt="{$sArticle.supplierName|escape}" 
                                     class="img-fluid">
                            </a>
                        </div>
                    {/if}
                {/block}
            {/block}
        {/block}
    </div>
{/block}
