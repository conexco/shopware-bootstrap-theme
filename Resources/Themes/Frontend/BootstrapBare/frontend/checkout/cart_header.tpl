<div class="table-head hidden-xs">
	<div class="row">
	    {block name='frontend_checkout_cart_header_field_labels'}
	    	<div class="col-sm-2">
		        {* Article informations *}
		        {block name='frontend_checkout_cart_header_name'}
			        {s name="CartColumnName" namespace='frontend/checkout/cart_header'}Artikel{/s}
		        {/block}
	    	</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-4 col-md-5"></div>

                    {* Product quantity *}
			        {block name='frontend_checkout_cart_header_quantity'}
			            <div class="col-sm-2">
				            {s name="CartColumnQuantity"}{/s}
				        </div>
			        {/block}

			        {* Unit price *}
			        {block name='frontend_checkout_cart_header_price'}
			            <div class="col-sm-2 text-right">
				            {s name='CartColumnPrice'}St&uuml;ckpreis{/s}
				        </div>
			        {/block}

                    {* Product tax rate *}
			        {block name='frontend_checkout_cart_header_tax'}{/block}

                    {* Accumulated product price *}
			        {block name='frontend_checkout_cart_header_total'}
			            <div class="col-sm-2 text-right">
				            {s name="CartColumnTotal"}{/s}
				        </div>
			        {/block}

                    {* Action column *}
                    {block name='frontend_checkout_cart_header_actions'}
                        {block name='frontend_checkout_cart_header_delete_article'}
                            <div class="col-sm-2 col-md-1"></div>
                        {/block}
                    {/block}
				</div>
	    	</div>
	    {/block}
	</div>
</div>
