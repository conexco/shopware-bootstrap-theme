{block name='frontend_custom_ajax_modal_box'}
    <div class="modal-dialog">
        <div class="modal-content">
            {block name='frontend_custom_ajax_modal_box_inner'}
                {block name='frontend_custom_ajax_action_buttons'}
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">
                            {$sCustomPage.description}
                        </h4>
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
