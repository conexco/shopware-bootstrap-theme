{if $sCompareAddResult|is_bool}
    {include file="frontend/compare/index.tpl"}
{else}
  	<div class="modal-dialog" data-max-reached="true">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                {* Compare modal header title *}
                {block name="product_compare_error_title"}
                    <h4 class="modal-title">{s name="CompareHeaderTitle"}{/s}</h4>
                {/block}
			</div>
			<div class="modal-body">
                {* Compare modal error message *}
                {block name="product_compare_error_title"}
                    {include file="frontend/_includes/messages.tpl" type="info" content="{s name='CompareInfoMaxReached'}{/s}"}
                {/block}
			</div>
			<div class="modal-footer">
	        	<button type="button" class="btn btn-outline-secondary modal-close" data-dismiss="modal">{s name="CompareModalClose"}Schließen{/s}</button>
			</div>
		</div>
	</div>
{/if}