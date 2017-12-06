{extends file="parent:frontend/ticket/listing_header.tpl"}


{block name='frontend_ticketsystem_table_head_date'}
    <div class="col-md-4 col-4">
        {s namespace='frontend/ticket/listing_header' name='TicketInfoDate'}{/s}
    </div>
{/block}


{block name='frontend_ticketsystem_table_head_id'}
    <div class="col-md-2 col-4">
        {s namespace='frontend/ticket/listing_header' name='TicketInfoId'}{/s}
    </div>
{/block}


{block name='frontend_ticketsystem_table_head_status'}
    <div class="col-md-2 col-4">
        {s namespace='frontend/ticket/listing_header' name='TicketInfoStatus'}{/s}
    </div>
{/block}


{block name='frontend_ticketsystem_table_head_actions'}
    <div class="col-md-4 col-6"></div>
{/block}