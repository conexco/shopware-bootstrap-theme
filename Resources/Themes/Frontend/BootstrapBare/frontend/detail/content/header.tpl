{block name='frontend_detail_index_header'}
    <div class="row">
        {block name='frontend_detail_index_header_inner'}
            {* Product name *}
            {block name='frontend_detail_index_name'}
                <div class="col-12{if $sArticle.supplierImg} col-sm-9{/if}">
                    <h1 itemprop="name">
                        {$sArticle.articleName}
                    </h1>
                </div>
            {/block}
            {* Product - Supplier information *}
            {block name='frontend_detail_supplier_info'}
                {if $sArticle.supplierImg}
                    <div class="d-none d-sm-block col-sm-3">
                        <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}" title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}">
                            <img src="{$sArticle.supplierImg}" alt="{$sArticle.supplierName|escape}" class="img-fluid mtl mbl">
                        </a>
                    </div>
                {/if}
            {/block}
        {/block}
    </div>
{/block}
