{namespace name="frontend/plugins/swag_advanced_cart/article_detail"}

{block name="frontend_detail_index_modal_wishlist"}
	{block name="frontend_detail_index_modal_alert"}
		{if $customizable}
			<div class="alert is--warning is--rounded">
				<div class="alert--icon">
					<i class="icon--element icon--warning"></i>
				</div>
				<div class="alert--content">
					{s namespace="frontend/swag_advanced_cart/view/main" name="CustomizedWarningContent"}You want to save a customizable item to your wishlist.<br/>Please note that the custom options can not be saved.{/s}
				</div>
			</div>
		{/if}
	{/block}

	<div class="cart-wishlist-modal modal-dialog" role="document">
		<div class="modal-content sw5-plugin">
			{block name="frontend_detail_index_modal_inner"}
				<div class="wishlist-modal-inner">
					{block name="frontend_detail_index_modal_inner_form"}
						<form action="{url controller=wishlist action=addToList}" method="post"
							  class="cart-form-add-article sw5-plugin {if !$userId}cart-is-centered{/if}">
							{if $userId}
								{block name="frontend_detail_index_modal_inner_form_loggedin"}
									{block name="frontend_detail_index_modal_inner_form_loggedin_info"}
										<div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							                {s name='AddToOwnWishlist' namespace="frontend/plugins/swag_advanced_cart/article_detail"}Auf die eigene Wunschliste{/s}
										</div>
									{/block}
									<div class="modal-body">
										{block name="frontend_advanced_cart_alert_min_one"}
											<div class="wishlist-alert-min-one sw5-plugin">
												{include file="frontend/_includes/messages.tpl" type="error" content="{s name='AddListMinOneList'}Bitte wählen Sie mindestens eine Liste aus.{/s}"}
											</div>
										{/block}

										{block name="frontend_advanced_cart_alert_add_error"}
											<div class="wishlist-alert-add-error sw5-plugin">
												{include file="frontend/_includes/messages.tpl" type="error" content="{s name="AddListError"}Der Artikel konnte nicht hinzugefügt werden.{/s}"}
											</div>
										{/block}
										<div class="inner-info-text cart-modal-container mbm">
											{block name="frontend_detail_index_modal_inner_form_loggedin_text"}
												{s name="SaveTheArticle"}Speichern Sie den Artikel{/s}
												<strong>{$sArticle.articleName}</strong>
												{s name='inExistingWishlist'}in einer vorhandenen Wunschliste oder erstellen Sie eine Neue.{/s}
											{/block}
										</div>
										<div class="row">
											<div class="col-12 col-sm-6">
												{block name="frontend_detail_index_modal_inner_form_loggedin_lists"}
													<div class="inner-current-wishlists cart-modal-container">
														<strong>{s name="ExistingList"}Vorhandene Wunschlisten{/s}:</strong>

														{foreach from=$allCartsByUser item=cart}
															{block name="frontend_detail_index_modal_inner_form_loggedin_list"}
																<div class="current-wishlists-item checkbox">
																	<label class="cart-item-label" for="cart-list{$cart.id}">
																		<input class="cart-item-input" id="cart-list{$cart.id}" type="checkbox" name="lists[]" value="{$cart.id}">
																		{$cart.name} ({$cart.cartItems|count} {s name='Article'}Artikel{/s})
																	</label>
																</div>
															{/block}
															{foreachelse}
															{block name="frontend_detail_index_modal_inner_form_loggedin_new"}
																<p class="cart-new-list">{s name='CreateWishlist'}Erstellen Sie jetzt Ihre erste Wunschliste!{/s}</p>
															{/block}
														{/foreach}
													</div>
												{/block}
											</div>
											<div class="col-12 col-sm-6">
												{block name="frontend_detail_index_modal_inner_form_loggedin_create"}
													<div class="inner-add-wishlist cart-modal-container">
														<label class="add-wishlist-label mbm"
															   for="name">{s name='NewWishlist'}Neue Wunschliste anlegen{/s}:</label>
														<input type="text" name="newlist"
															   placeholder="{s name='DefineName'}Namen festlegen{/s}"
															   class="add-wishlist-name sw5-plugin form-control mbm">
														<input type="hidden" name="ordernumber" value="{$sArticle.ordernumber}">
													</div>
												{/block}
												{block name="frontend_detail_index_modal_inner_form_loggedin_quantity"}
													<input type="hidden" name="quantity" value="{$quantity}">
												{/block}
											</div>
										</div>
									</div>
									<div class="modal-footer">
										{block name="frontend_detail_index_modal_inner_form_loggedin_button"}
											<a class="add-wishlist-button sw5-plugin btn btn-primary">{s name='Add'}Hinzufügen{/s}</a>
										{/block}
									</div>
								{/block}
							{else}
								<div class="modal-body">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									{block name="frontend_detail_index_modal_inner_form_notloggedin"}
										<p class="cart--login-text">{s name='WishlistTeaserText' namespace='frontend/plugins/swag_advanced_cart/checkout_notloggedin'}Eröffnen Sie ein Kundenkonto und nutzen Sie die Wunschlisten Funktion. Mit dieser Funktion können Sie Listen anlegen, einfach erweitern, mit einem Klick bestellen oder mit Freunden und Kollegen via E-Mail, Facebook, Twitter oder Google+ teilen.{/s}</p>
										{block name="frontend_detail_index_modal_inner_form_notloggedin_button"}
											<hr>
											<a href="{url controller=wishlist}"
											   class="btn btn-primary">{s name='RegisterOrLogin'}Kundenkonto erstellen oder anmelden{/s}</a>
										{/block}
									{/block}
								</div>
							{/if}
						</form>
					{/block}
				</div>
			{/block}
		</div>
	</div>
{/block}