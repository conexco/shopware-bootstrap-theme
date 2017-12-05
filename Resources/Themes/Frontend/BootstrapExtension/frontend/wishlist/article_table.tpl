{block name="frontend_wishlist_index_list_articles"}
    <div class="list-container-article-table sw5-plugin">
        <div class="article-table" data-compare-ajax="true">
            {block name="frontend_wishlist_index_list_articles_header"}
                <div class="article-table-header sw5-plugin row d-block d-xl-none">
                    <div class="col-lg-9">
                        {block name="frontend_wishlist_index_list_articles_header_article"}
                            <div class="column-article page-header">
                                <strong>{s name='Article' namespace='frontend/plugins/swag_advanced_cart/plugin'}Artikel{/s}</strong>
                            </div>
                        {/block}
                    </div>
                    <div class="col-lg-3">
                        {block name="frontend_wishlist_index_list_articles_header_price"}
                            <div class="column-price page-header">
                                <strong>{s name='Price' namespace='frontend/plugins/swag_advanced_cart/plugin'}Preis{/s}</strong>
                            </div>
                        {/block}
                    </div>
                </div>
            {/block}
            {foreach from=$wishList.items item=item name=itemIteration}
                {block name="frontend_wishlist_index_list_articles_item"}
                    {include file="frontend/wishlist/item_form.tpl" item=$item sBasketItem=$item.article}
                {/block}
            {/foreach}
        </div>
    </div>
{/block}