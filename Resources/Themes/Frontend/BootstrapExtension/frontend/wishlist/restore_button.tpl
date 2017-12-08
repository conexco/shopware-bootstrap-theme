{block name="frontend_wishlist_index_list_main_buttons_add"}
	<a href="{url controller=wishlist action=restore id=$wishList.basketID}" class="manage-buttons-button btn btn-primary btn-block{if $wishList.items|count <= 0} d-none{/if}">
		{s namespace="frontend/plugins/swag_advanced_cart/plugin" name='AllIntoBasket'}Alle Artikel in den Warenkorb{/s}
	</a>
{/block}