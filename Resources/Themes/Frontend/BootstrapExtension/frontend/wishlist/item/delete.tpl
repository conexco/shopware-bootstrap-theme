{if !$hideDelete}
	<div class="col-4 text-right">
		<a href="{url controller='wishlist' action='removeOne' cartItemId=$item.id}" title="{s name='Delete' namespace='frontend/plugins/swag_advanced_cart/plugin'}Löschen{/s}" class="note-delete sw5-plugin btn btn-danger">
	        <i class="fa fa-trash-o"></i>
	    </a>
	</div>
{/if}