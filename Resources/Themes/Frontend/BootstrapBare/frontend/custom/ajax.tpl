{block name='frontend_custom_ajax_modal_box'}
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            {block name='frontend_custom_ajax_modal_box_inner'}
                {block name='frontend_custom_ajax_action_buttons'}
                    <div class="modal-header">
                        <h4 class="modal-title">
                            {$sCustomPage.description}
                        </h4>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            &times;
                        </button>
                    </div>
                {/block}
                
                {block name='frontend_custom_ajax_article_content'}
                    <div class="modal-body">
                        {$sContent}
                    </div>
                {/block}
            {/block}
        </div>
    </div>
{/block}
