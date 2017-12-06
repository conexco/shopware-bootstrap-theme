{extends file='parent:frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {block name="frontend_index_swag_ticket_system_breadcrumb"}
        {$sBreadcrumb[] = ['name' => "{s namespace="frontend/account/sidebar" name="TicketsystemAccountLinkListing"}{/s}", 'link' => {url}]}
    {/block}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {block name="frontend_index_swag_ticket_system_content"}
        {block name='frontend_index_content_ticketsystem'}
            <div class='ticket-system'>
                {block name='frontend_index_content_ticketsystem_headline'}
                    <h1>{s name='TicketHeadline'}{/s}</h1>
                {/block}
                {block name='frontend_index_content_ticketsystem_panel'}
                    {block name='frontend_ticketsystem_table'}
                        {block name='frontend_ticket_table_head'}
                            <div class="table-head">
                                <div class="row">
                                    {include file='frontend/ticket/listing_header.tpl'}
                                </div>
                            </div>
                        {/block}

                        {block name='frontend_ticketsystem_table_content'}
                            {foreach $entries as $ticketItem}
                                {include file='frontend/ticket/listing_content.tpl'}
                            {/foreach}
                        {/block}
                    {/block}

                    {block name="frontend_ticketsystem_actions_paging"}
                        {if $sNumberPages > 1}
                            <div class="row mtl">
                                <div class="col-12 col-sm-6 text-left">
                                    Seite <span class="paging--display"><strong>{$sPage}</strong> von <strong>{$sNumberPages}</strong></span>
                                </div>
                                <div class="col-12 col-sm-6 text-right">
                                    <ul class="pagination man">
                                        <li>
                                            {* link first page *}
                                            <a href="{url controller='ticket' action='listing' sPage="1"}" class="btn btn "><i class="fa fa-step-backward"></i></a>
                                        </li>
                                        <li>
                                            {* link page back *}
                                            <a href="{url controller='ticket' action='listing' sPage="{if $sPage != 1}{$sPage - 1}{else}{$sPage}{/if}"}" class="btn btn "><i class="fa fa-caret-left fa-lg"></i></a>
                                        </li>
                                        <li>
                                            {* link current page *}
                                            <a href="{url controller='ticket' action='listing' sPage="{$sPage}"}" class="btn btn is--active">{$sPage}</a>
                                        </li>
                                        <li>
                                            {* link page forward *}
                                            <a href="{url controller='ticket' action='listing' sPage="{if $sPage != $sNumberPages}{$sPage + 1}{else}{$sPage}{/if}"}" class="btn btn paging--next"><i class="fa fa-caret-right fa-lg"></i></a>
                                        </li>
                                        <li>
                                            {* link last page *}
                                            <a href="{url controller='ticket' action='listing' sPage="{$sNumberPages}"}" class="btn btn paging--next"><i class="fa fa-step-forward"></i></a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        {/if}
                    {/block}
                {/block}
            </div>
        {/block}
    {/block}
{/block}