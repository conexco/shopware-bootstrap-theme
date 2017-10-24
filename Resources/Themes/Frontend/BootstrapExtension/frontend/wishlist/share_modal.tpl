{namespace name="frontend/plugins/swag_advanced_cart/modal_share"}

{block name="frontend_wishlist_index_modal_share"}
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				{s name='ShareTitle' namespace="frontend/plugins/swag_advanced_cart/modal_share"}Freunden mitteilen{/s}
			</div>
			<div class="modal-body">
				<div class="cart-wishlist-modal">
					{block name="frontend_checkout_cart_modal_share_inner"}
						<div class="wishlist-modal-inner">

							{* Error & Success Alert Box *}
							{block name="frontend_checkout_cart_modal_share_inner_alert"}
								<div class="cart--share-alert sw5-plugin">
									{include file="frontend/_includes/messages.tpl" type="success" content="{s name="listShared" namespace="frontend/plugins/swag_advanced_cart/controller_messages"}{/s}"}
								</div>
							{/block}

							{block name="frontend_checkout_cart_modal_share_inner_form"}
								<form action="{url controller=wishlist action=share}" method="post" id="inner--cart-share">
									{* E-Mail Message *}
									{block name="frontend_checkout_cart_modal_share_form_from"}
										<div class="share mbm">
											<strong>{s name='From'}Von{/s}: &nbsp;</strong> {$name} ({$eMail})
										</div>
									{/block}
									{block name="frontend_checkout_cart_modal_share_form_to"}
										<div class="cart-modal-share-container mbm">
											<label class="cart-label" for="name">{s name='To'}An{/s}:</label>
											<textarea name="to" class="cart-textarea pas form-control" placeholder="{s name='ToPlaceholder'}Trennen Sie mehrere Empfänger durch ein Komma z.B tina@example.de, jan@example.de{/s}"></textarea>
										</div>
									{/block}

									{block name="frontend_checkout_cart_modal_share_form_message"}
										<div class="cart-modal-share-container mbm">
											<label class="cart-label" for="name">{s name='Message'}Nachricht{/s}:</label>
											<textarea name="message" class="cart-textarea cart-mail-message pas form-control" rows="5" placeholder="{s name='ShareMessage'}Wunschlisten anzulegen ist eine tolle Funktion! Sie können Ihre Wunschlisten einfach verwalten, erweitern oder mit Ihren Freunden und Kollegen via E-Mail, Facebook, Google+ oder Twitter teilen.{/s}"></textarea>
										</div>
									{/block}

									{block name="frontend_checkout_cart_modal_share_form_hidden"}
			                            <input type="hidden" id="cart-public-url" name="hash" value="{$hash}">
									{/block}

									{block name="frontend_checkout_cart_modal_share_form_button"}
										<div class="text-right">
											<button class="cart-modal-share-btn sw5-plugin btn btn-primary" type="submit">{s name='Send'}Nachricht senden{/s}</button>
										</div>
									{/block}
								</form>
							{/block}
						</div>
					{/block}
				</div>
			</div>
		</div>
	</div>
{/block}