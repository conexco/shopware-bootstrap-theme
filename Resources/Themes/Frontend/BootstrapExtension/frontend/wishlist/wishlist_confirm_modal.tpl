{namespace name="frontend/plugins/swag_advanced_cart/modal_confirm"}

{block name="frontend_wishlist_index_modal_confirm"}
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="cart-wishlist-confirm-modal">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					{s name='ConfirmTitle' namespace="frontend/plugins/swag_advanced_cart/modal_confirm"}Sind Sie sicher?{/s}
				</div>
				<div class="modal-body">
					{block name="frontend_wishlist_index_modal_confirm_inner"}
						<div class="wishlist-modal-inner">

							{block name="frontend_wishlist_index_modal_confirm_inner_text"}
								<p>
									{s name='ConfirmDialog'}Möchten Sie die Wunschliste{/s} <strong class="cart--modal-list-name">{$wishListName}</strong> {s name='ConfirmDialogEnd'}wirklich löschen?{/s}
								</p>
							{/block}

							{block name="frontend_wishlist_index_modal_confirm_inner_button"}
								<button href="{$deleteUrl}" class="modal-btn-container-btn sw5-plugin btn btn-danger">
									<i class="fa fa-trash mrs"></i>{s name='Delete'}Löschen{/s}
								</button>
							{/block}
						</div>
					{/block}
				</div>
			</div>
		</div>
	</div>
{/block}