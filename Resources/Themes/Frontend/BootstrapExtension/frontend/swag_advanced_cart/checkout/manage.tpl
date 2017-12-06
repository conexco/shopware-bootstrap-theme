{namespace name="frontend/plugins/swag_advanced_cart/manage"}
{if count($wishlists) || !$isEmpty}
	{block name="frontend_wishlist_cart_header"}
		{block name="frontend_wishlist_cart_header_success"}
			<div class="cart-header-alert sw5-plugin">
				<div class="container">
					{include file="frontend/_includes/messages.tpl" type="success" content="{s name='SaveCartSuccess'}Die Wunschliste wurde erfolgreich erstellt{/s}"}
				</div>
			</div>
		{/block}
        {block name="frontend_wishlist_cart_header_error"}
        	<div class="cart-header-error sw5-plugin" data-noName="{s name='SaveErrorEmptyName'}{/s}" data-nameExists="{s name='SaveErrorNameExists'}{/s}">
        		<div class="container">
	        	    {include file="frontend/_includes/messages.tpl" type="error" content="{s name='SaveCartError'}An error has occured while saving the wishlist{/s}"}
				</div>
        	</div>
			{/block}
		{block name="frontend_wishlist_cart_header_swag_bundle_info"}
			<div class="cart-header-info-bundle">
				<div class="container">
	                {include file="frontend/_includes/messages.tpl" type="info" content="{s name='SaveCartBundleMessage'}Bundle advantages are not included in the wish list.{/s}"}
	        	</div>
			</div>
        {/block}
    	{if !$isEmpty}
    		<div class="cart-option-wrapper-container">
    	{/if}
        	<div class="cart-option-wrapper sw5-plugin pam mbl{if $isEmpty} cart-empty-basket{/if}{if !count($wishlists) OR $isEmpty} cart-half-option{/if}">
        		<div class="row row-hd-height">
					<div class="col-12 {if $sUserLoggedIn}col-hd-4 col-lg-4{else}col-hd-6 col-lg-6{/if} col-hd-height col-middle mvl-xs mvl-sm">
						{block name="frontend_wishlist_cart_header_icons"}
							<div class="cart-option-container">
								{block name="frontend_wishlist_cart_header_icons_container"}
									<div class="icon-container text-center text-primary">
										<i class="fa fa-star fa-3x"></i>
										<i class="fa fa-arrows-h fa-3x"></i>
										<i class="fa fa-shopping-cart fa-3x"></i>
									</div>
								{/block}
							</div>
						{/block}
					</div>
					{if $sUserLoggedIn}
						<div class="col-12 col-hd-4 col-lg-4 col-hd-height mbl-xs mbl-sm">
							{block name="frontend_wishlist_cart_header_load"}
								{if count($wishlists)}
									<div class="cart-option-container container-load-wishlist">
										{block name="frontend_wishlist_cart_header_load_headline"}
											<h4 class="option-container-headline">{s name="LoadList"}Load wishlist{/s}</h4>
										{/block}

										{block name="frontend_wishlist_cart_header_load_text"}
											<p>{s name="LoadText"}Simply fill the cart with the contents of a previously saved wishlist - including the previously chosen quantities.{/s}</p>
										{/block}

										{block name="frontend_wishlist_cart_header_load_select"}
											<select class="load-wishlist-select sw5-plugin">
												{block name="frontend_wishlist_cart_header_load_select_default"}
													<option class="load-wishlist-default-option">{s name="SelectEmptyText"}Load saved wishlist{/s}</option>
												{/block}

												{foreach $wishlists as $wishList}
													{block name="frontend_wishlist_cart_header_load_select_option"}
														<option data-wishlist-link="{url controller=wishlist action=restore id=$wishList.id}" class="load-wishlist-option">{$wishList.name}</option>
													{/block}
												{/foreach}
											</select>
										{/block}
									</div>
								{/if}
							{/block}
						</div>
					{/if}
					{if !$isEmpty}
						<div class="col-12 {if $sUserLoggedIn}col-hd-4 col-lg-4{else}col-hd-6 col-lg-6{/if} col-hd-height mbm-xs mbm-sm">
							{block name="frontend_wishlist_cart_header_save"}
									{if $sUserLoggedIn}
										<div class="cart-option-container option-container-save-wishlist">
											{block name="frontend_wishlist_cart_header_save_headline"}
												<h4 class="option-container-headline">{s name="SaveList"}Save as wishlist{/s}</h4>
											{/block}

											{block name="frontend_wishlist_cart_header_save_text"}
												<p>{s name="SaveText"}Save your shopping cart as a wish list, so that you have all your items conveniently in one place. Not only can you add to this wish list later, but also share it with your social network and make purchases with a single click.{/s}</p>
											{/block}

											{block name="frontend_wishlist_cart_header_save_input_container"}
												<div class="save-wishlist-button-container sw5-plugin">
													<div class="row">
														<div class="col-12">
															<div class="input-group">
																{block name="frontend_wishlist_cart_header_save_input_text"}
																	<input name="name" 
																		class="save-wishlist-input sw5-plugin form-control" 
																		type="text" 
																		placeholder="{s name="SavePlaceHolder"}Enter name of the wishlist{/s}" />
																{/block}
																<div class="input-group-btn">
																	{block name="frontend_wishlist_cart_header_save_input_button"}
																		<button type="submit" class="save-wishlist-button sw5-plugin add-product-button btn btn-primary btn-block">
																			<i class="fa fa-angle-right phm"></i>
																		</button>
																	{/block}
																</div>
															</div>
														</div>
													</div>
												</div>
											{/block}
										</div>
									{else}
										{block name="frontend_wishlist_cart_header_login"}
											<div class="login-container-wrapper">
												{block name="frontend_wishlist_cart_header_login_text"}
													<div class="login-container-text mbm">
														{s name='WishlistTeaserText' namespace='frontend/plugins/swag_advanced_cart/checkout_notloggedin'}Eröffnen Sie ein Kundenkonto und nutzen Sie die Wunschlisten Funktion. Mit dieser Funktion können Sie Listen anlegen, einfach erweitern, mit einem Klick bestellen oder mit Freunden und Kollegen via E-Mail, Facebook, Twitter oder Google+ teilen.{/s}
													</div>
												{/block}

												{block name="frontend_wishlist_cart_header_login_button"}
													<a href="{url controller=wishlist action=loginCart}" class="btn btn-primary login-container-button">{s namespace="frontend/plugins/swag_advanced_cart/article_detail" name='RegisterOrLogin'}Kundenkonto erstellen oder anmelden{/s}</a>
												{/block}
											</div>
										{/block}
									{/if}
							{/block}
						</div>
					{/if}
        		</div>
			</div>
	{if !$isEmpty}
		</div>
	{/if}
	{/block}
{/if}