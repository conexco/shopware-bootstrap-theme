{namespace name="frontend/plugins/swag_advanced_cart/plugin"}
{block name="frontend_wishlist_index_container"}
	<div class="content account-content">
        {if $storedWishlist}
            {include file="frontend/_includes/messages.tpl" type="warning" content="{s name='WishlistProductWaitingWarning'}You have a product waiting to be added to your wishlist. Create a new wishlist and the product will be added automatically.{/s}"}
        {/if}

        {if $sErrorFlag}
            {include file="frontend/_includes/messages.tpl" type="error" content="{s name='WishlistCreateError'}A wishlist with this name already exists{/s}"}
        {/if}

		{block name="frontend_wishlist_index_container_headline"}
			<div class="account-welcome pbm">
				<h1>{s name='Title'}Wunschlisten{/s}</h1>
				<p>
					{s name='Teaser'}Erstellen Sie eigene Wunschlisten und teilen Sie diese mit Freunden oder Verwandten.{/s}
				</p>
			</div>
		{/block}

		{block name="frontend_wishlist_index_container_body"}
			{block name="frontend_wishlist_index_container_body_title"}
				<h3 class="wishlist-content-table-headline page-header">{s name='CreateWishlist'}Wunschliste erstellen{/s}</h3>
			{/block}

			{block name="frontend_wishlist_index_container_body_table"}
				<div class="wishlist-content-table-content pbm">
					{block name="frontend_wishlist_index_container_body_form"}
						<form action="{url controller=wishlist action=createcart}" method="post">
							<div class="row">
								<div class="col-lg-6">
								    <div class="input-group">
										<input type="text" class="table-content-text-field form-control" name="name" placeholder="{s name='WishlistPlaceholder'}Name für die neue Wunschliste...{/s}">
										<span class="input-group-btn">
											{block name="frontend_wishlist_index_container_body_form_button"}
												<button type="submit" class="table-content-create-button btn btn-default" type="button" title="{s name='CreateWishlist'}Wunschliste erstellen{/s}">
													<i class="fa fa-plus"></i>
												</button>
											{/block}
										</span>
								    </div>
								</div>
							</div>
						</form>
					{/block}
				</div>
			{/block}
		{/block}

		{block name="frontend_wishlist_index_container_info"}
			{block name="frontend_wishlist_index_container_info_text"}
				<h3 class="page-header">{s name='MyWishlists'}Meine Wunschlisten{/s}</h3>
				<p>
					{s name='ControlOwnWishlists'}Behalten Sie den Überblick über Ihre Wunschlisten und deren Privatsphäre-Einstellungen.{/s}
				</p>
			{/block}

			<div class="wishlist-content-saved-lists">
				{foreach from=$savedBaskets item=wishList name=listIteration}
					{block name="frontend_wishlist_index_container_item"}
						{include file="frontend/wishlist/list.tpl" wishList=$wishList first=$smarty.foreach.listIteration.first}
					{/block}
				{/foreach}
			</div>
		{/block}
	</div>
{/block}