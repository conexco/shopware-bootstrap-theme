{if $wishlistArticles|@count && !empty({config name=alsoListShow})}
    <div class="viewed-content">
        <div class="cart-wishlists-containing">
            {block name="frontend_detail_index_lists_containing_title"}
                <div class="wishlists-containing-title page-header">
                    <h3>{s name="DetailAlsoWishlistSlider" namespace='frontend/plugins/swag_advanced_cart/article_detail'}Wunschlisten, die diesen Artikel enthalten, enthalten ebenfalls{/s}</h3>
                </div>
            {/block}
            <div class="wishlist-content product-slider">
                {include file="frontend/_includes/product_slider.tpl" articles=$wishlistArticles equalHeight="true"}
            </div>
        </div>
    </div>
{/if}
