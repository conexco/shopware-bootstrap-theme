{namespace name="frontend/detail/index"}

<ul class="article-navigation list-inline text-right mb-0">
    {* Previous product *}
    {block name='frontend_detail_article_back'}
        <li class="list-inline-item">
            <a href="#" 
               class="btn pan product-navigation-prev sw5-plugin" 
               data-trigger="hover" 
               data-popoverclass="product-navigation">
                <i class="fa fa-long-arrow-left mr-2"></i>
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
                <i class="fa fa-long-arrow-right ml-2"></i>
            </a>
        </li>
    {/block}
</ul>