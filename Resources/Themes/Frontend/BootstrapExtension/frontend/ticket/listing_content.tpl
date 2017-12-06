{extends file="parent:frontend/ticket/listing_content.tpl"}


{block name='frontend_ticket_entry'}
    <div class="table-row">
        <div class="row">
            {* date *}
            {block name='frontend_ticketsystem_entry_date'}
                <div class="col-md-4 col-4">
                    {block name='frontend_ticketsystem_entry_date_label'}{/block}

                    {block name='frontend_ticketsystem_entry_date_value'}
                        {$ticketItem.receipt|date:DATETIME_MEDIUM}
                    {/block}
                </div>
            {/block}

            {* id *}
            {block name='frontend_ticketsystem_entry_id'}
                <div class="col-md-2 col-4">
                    {block name='frontend_ticketsystem_entry_id_label'}{/block}

                    {block name='frontend_ticketsystem_entry_id_value'}
                        #{$ticketItem.id}
                    {/block}
                </div>
            {/block}

            {* status *}
            {block name='frontend_ticketsystem_entry_status'}
                <div class="col-md-2 col-4">
                    {block name='frontend_ticketsystem_entry_status_label'}{/block}

                    {block name='frontend_ticketsystem_entry_status_value'}
                        <div class="ticket-status-{$ticketItem.statusId}">
                            {$ticketItem.status}
                        </div>
                    {/block}
                </div>
            {/block}

            {* actions *}
            {block name='frontend_ticketsystem_entry_actions'}
                <div class="col-md-4 col-12">
                    <a href="{url controller='ticket' action='detail' tid=$ticketItem.uniqueId}" class="btn btn-primary">
                        {s namespace='frontend/ticket/listing_content' name='TicketLinkDetails'}{/s}
                    </a>
                </div>
            {/block}
        </div>
    </div>
{/block}