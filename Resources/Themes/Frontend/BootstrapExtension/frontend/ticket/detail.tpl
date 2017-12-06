{extends file='parent:frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {block name="frontend_index_swag_ticket_system_breadcrumb"}
        {assign var='sBreadcrumb' value=[['name'=>"{s namespace="frontend/account/index" name='AccountTitle'}{/s}", 'link' => {url controller='account' action='index'}]]}
        {$sBreadcrumb[] = ['name' => "{s namespace="frontend/account/sidebar" name="TicketsystemAccountLinkListing"}{/s}", 'link' => {url controller='ticket' action='listing'}]}
        {$sBreadcrumb[] = ['name'=>"{s name='TicketDetailInfoTicket'}{/s} #{$ticketDetails.id}", 'link' => {url controller='ticket' action='detail' tid=$ticketDetails.uniqueId}]}
    {/block}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {block name="frontend_index_swag_ticket_system_content"}
        {* ticket not found *}
        {if !$ticketDetails.id}
            {block name='ticketsystem_alert'}
                {block name='ticketsyste_alert_message'}
                    {include file="frontend/_includes/messages.tpl" type="error" content="{s name='TicketDetailInfoEmpty'}{/s}"}
                {/block}
            {/block}
        {else}
            {* ticket headline *}
            {block name='ticketsystem_headline'}
                <h1>{s name='TicketDetailInfoTicket'}{/s} #{$ticketDetails.id}</h1>
            {/block}

            {* ticket error box *}
            {block name='ticketsystem_panel_error_box_custom'}
                {if $error != ""}
                    {block name='ticketsystem_panel_error_box'}
                        {include file="frontend/_includes/messages.tpl" type="error" content="{$error}"}
                    {/block}
                {/if}
            {/block}

            {* ticket success box *}
            {block name='ticketsystem_panel_success_box_custom'}
                {if $accept != ""}
                    {block name='ticketsystem_panel_success_box'}
                        {include file="frontend/_includes/messages.tpl" type="success" content="{$accept}"}
                    {/block}
                {/if}
            {/block}

            {block name="ticketsystem_attachments_table_custom"}
                {if $userAttachments}
                    {block name="ticketsystem_attachments_table"}
                        <div class="table-wrapper mbl">
                            {block name="ticketsystem_attachments_table_header"}
                                <div class="table-head">
                                    <div class="row">
                                        <div class="col-4">
                                            {s namespace='frontend/ticket/detail' name='TicketAttachment'}Attachment{/s}
                                        </div>
                                        <div class="col-4">
                                            {s namespace='frontend/ticket/detail' name='TicketAttachmentDate'}Attachment date{/s}
                                        </div>
                                        <div class="col-4">
                                            {s namespace='frontend/ticket/detail' name='TicketAttachmentAction'}Action{/s}
                                        </div>
                                    </div>
                                </div>
                            {/block}
                            {foreach from=$userAttachments item=userAttachment}
                                {block name="ticketsystem_attachment_item"}
                                    <div class="table-row">
                                        <div class="row">
                                            <div class="col-4">
                                                {$userAttachment.filename}
                                            </div>
                                            <div class="col-4">
                                                {$userAttachment.date|date_format:"%d.%m.%Y %H:%M:%S"}
                                            </div>
                                            <div class="col-4 text-right">
                                                <a href="{url controller=ticket action=download attachment=$userAttachment.hash}" title="" class="btn btn-primary btn-xs">{s namespace='frontend/ticket/detail' name="TicketDetailAttachmentDownload"}Download{/s}</a>
                                                <a href="{url controller=ticket action=delete attachment=$userAttachment.hash}" title="" class="btn btn-outline-secondary btn-xs">{s namespace='frontend/ticket/detail' name="TicketDetailAttachmentDelete"}Delete{/s}</a>
                                            </div>
                                        </div>
                                    </div>
                                {/block}
                            {/foreach}
                        </div>
                    {/block}
                {/if}
            {/block}

            {* Ticket info box *}
            {block name='ticketsystem_panel_info_box_custom'}
                {if !$ticketDetails.responsible}
                    {block name='ticketsystem_panel_info_box'}
                        {* Ticket in process *}
                        {block name='ticketsystem_panel_body_ticket_progress'}
                            {if !$ticketDetails.responsible && !$ticketDetails.closed}
                                {include file="frontend/_includes/messages.tpl" type="info" content="{s name='TicketDetailInfoStatusProgress'}{/s}"}
                            {/if}
                        {/block}

                        {* Ticket closed *}
                        {block name='ticketsystem_panel_body_ticket_closed'}
                            {if $ticketDetails.closed}
                                {include file="frontend/_includes/messages.tpl" type="success" content="{s name='TicketDetailInfoStatusClose'}{/s}"}
                            {/if}
                        {/block}
                    {/block}
                {/if}
            {/block}

            {* Ticket answer *}
            {block name='frontend_index_content_ticketsystem_answer_panel_custom'}
                {if $ticketDetails.responsible || $ticketDetails.showAnswer}
                    {block name='frontend_index_content_ticketsystem_answer_panel'}
                        {block name='frontend_index_content_ticketsystem_answer_panel_headline'}
                            <h2>{s name='TicketDetailInfoAnswer'}{/s}:</h2>
                        {/block}
                        {block name='frontend_index_content_ticketsystem_answer_panel_body'}
                            {block name='frontend_index_content_ticketsystem_answer_panel_body_form'}
                                {block name='frontend_index_content_ticketsystem_answer_panel_body_form_custom'}
                                    <form action="" method="POST">
                                        {block name='frontend_index_content_ticketsystem_answer_panel_body_form_textarea'}
                                            <div class="form-group">
                                                <textarea class="form-control" rows="5" name="sAnswer" placeholder="{s namespace='frontend/ticket/detail' name='TicketTextareaPlaceholder'}{/s}"></textarea>
                                            </div>
                                        {/block}
                                        {block name='frontend_index_content_ticketsystem_answer_panel_body_form_panel_action'}
                                            <div class="form-group">
                                                {block name='frontend_index_content_ticketsystem_answer_panel_body_form_panel_action_submit'}
                                                    <input class="btn btn-success" type="submit" value="{s namespace='frontend/ticket/detail' name='TicketDetailSubmitButton'}{/s}" name="sSubmit"/>
                                                {/block}
                                            </div>
                                        {/block}
                                    </form>
                                {/block}
                                {block name='frontend_ticket_answer_upload'}
                                    {if {config name=allowUploads}}
                                        <form name="fileuploadOption" method="post" action="{url controller=ticket action=upload forceSecure}" class="answerUpload">
                                            <div class="option_values option_values_upload_file_custom btn btn-primary mbl">
                                                <input type="hidden" name="ticket" value="{$ticketDetails.id}"/>
                                                <input type="hidden" name="answer" value="-1"/>
                                                <span>{s namespace='frontend/ticket/detail' name='TicketDetailUploadButton'}Datei Upload{/s}</span>
                                                <input type="file" id="option" class="fileupload-input mtl mbl" name="fileupload" multiple="multiple"/>
                                            </div>
                                        </form>
                                    {/if}
                                {/block}
                            {/block}
                        {/block}
                    {/block}
                {/if}
            {/block}

            {* ticket history *}
            {block name='ticketsystem_panel_history_box'}
                {block name='ticketsystem_panel_history_box_conversation'}
                    {foreach $ticketHistoryDetails as $historyItem}
                        <blockquote>
                            {block name='ticketsystem_panel_history_box_label'}
                                <small>
                                    {$historyItem.receipt|date:DATETIME_MEDIUM} | {if $historyItem.direction == "OUT"} {s name='TicketDetailInfoShopAnswer'} {/s} {else} {s name='TicketDetailInfoAnswer'}{/s}{/if}:
                                </small>
                            {/block}

                            {* Your message *}
                            {block name='ticketsystem_panel_history_box_message'}
                                <p>{$historyItem.message}</p>
                                {block name='frontend_ticket_history_attachments'}
                                    {if $historyItem.attachment}
                                        {foreach $historyItem.attachment as $key => $attachment}
                                            <a href="{url controller=ticket action=download attachment=$attachment.hash}" class="btn btn-primary btn-sm" target="_blank">{s namespace='frontend/ticket/detail' name="TicketDetailAttachment"}Download attachment{/s}</a>
                                        {/foreach}
                                    {/if}
                                {/block}
                            {/block}
                        </blockquote>
                    {/foreach}
                {/block}

                {* Ticket meta data *}
                {block name='ticketsystem_panel_history_box_meta_data'}
                    {block name="ticketsystem_panel_history_original_msg"}
                        <blockquote>
                            {block name='ticketsystem_panel_history_box_meta_data_label'}
                                <small>{$ticketDetails.receipt|date:DATETIME_MEDIUM} | {s name='TicketDetailInfoQuestion'}{/s}</small>
                            {/block}

                            {block name='ticketsystem_panel_history_box_meta_data_message'}
                                <p>{$ticketDetails.message}</p>
                            {/block}
                        </blockquote>
                    {/block}
                    {block name='meta_data_additional_info_header'}
                        <h2>{s namespace='frontend/ticket/detail' name='TicketDetailAdditionalData'}{/s}</h2>
                    {/block}

                    {block name="meta_data_additional_ingo_content"}
                        <div class="row">
                            {foreach $ticketDetails.additional as $additionalData}
                                {if $additionalData.value}
                                    <div class="col-3">
                                        {if $additionalData.value}
                                            <strong>{$additionalData.label}:</strong>
                                            <p>{$additionalData.value}</p>
                                        {/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/block}
                {/block}
            {/block}
        {/if}

        {block name='ticketsystem_back_button'}
            <a href="{url controller='ticket' action='listing'}" class="btn btn-outline-secondary mbm">{s name='TicketDetailLinkBack'}{/s}</a>
        {/block}
    {/block}
{/block}