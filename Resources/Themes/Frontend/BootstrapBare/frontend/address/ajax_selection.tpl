{block name='frontend_address_selection_modal'}
    <div class="modal-dialog">
        <div class="modal-content">
            {block name="frontend_address_selection_modal_title"}
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    {block name='checkout_ajax_add_title'}
                        <h4 class="modal-title">{s name="ModalTitle"}{/s}</h4>
                    {/block}
                </div>
            {/block}

            {block name="frontend_address_selection_modal_body"}
                <div class="modal-body">

                    {block name="frontend_address_selection_modal_create_text"}
                    <p class="mbl">
                        {s name="CreateNewAddressText"}{/s}
                        <a href="{url controller=address action=create}"
                           title="{s name="CreateNewAddressTitle"}{/s}"
                           class="text-primary" 
                           data-address-editor="true"
                           data-showSelectionOnClose="true">{s name="CreateNewAddressLinkText"}{/s}</a>.
                    </p>
                    {/block}

                    {if count($addresses) > 0}
                        {block name="frontend_address_selection_modal_container"}
                            <div class="row" data-equalheight="true">
                                {foreach $addresses as $address}
                                    {block name='frontend_address_selection_modal_container_item'}
                                        <div class="col-12 col-hd-6">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    {block name='frontend_address_selection_modal_container_item_body'}
                                                        <address data-equal="addressModal">
                                                            <strong>{$address.firstname|escapeHtml} {$address.lastname|escapeHtml}</strong><br />
                                                            {if $address.company}{$address.company|escapeHtml}<br/>{/if}
                                                            {$address.street|escapeHtml}<br />
                                                            {if $address.additionalAddressLine1}{$address.additionalAddressLine1|escapeHtml}<br />{/if}
                                                            {if $address.additionalAddressLine2}{$address.additionalAddressLine2|escapeHtml}<br />{/if}
                                                            {if {config name=showZipBeforeCity}}{$address.zipcode|escapeHtml} {$address.city|escapeHtml}{else}{$address.city} {$address.zipcode|escapeHtml}{/if}<br />
                                                            {$address.country.name|escapeHtml}
                                                        </address>
                                                    {/block}

                                                    {block name='frontend_address_selection_modal_container_item_actions'}
                                                        <form class="address-manager-selection-form sw5-plugin" action="{url controller=address action=handleExtra}" method="post">
                                                            <input type="hidden" name="id" value="{$address.id}" />

                                                            {block name="frontend_address_selection_modal_container_item_extra_data"}
                                                                {foreach $extraData as $key => $val}
                                                                    <input type="hidden" name="extraData[{$key}]" value="{$val}" />
                                                                {/foreach}
                                                            {/block}

                                                            {block name="frontend_address_selection_modal_container_item_select_button"}
                                                                <button class="btn btn-sm btn-default"
                                                                        type="submit"
                                                                        data-checkFormIsValid="false">
                                                                    {s name="SelectAddressButton"}Use this address{/s}
                                                                </button>
                                                            {/block}
                                                        </form>
                                                    {/block}
                                                </div>    
                                            </div>
                                        </div>
                                    {/block}
                                {/foreach}
                            </div>
                        {/block}
                    {else}
                        {block name="frontend_address_select_address_modal_empty_addresses"}
                            {include file='frontend/_includes/messages.tpl' type="info" content="{s name='EmptyAddressesText'}{/s}"}
                        {/block}
                    {/if}
                </div>
            {/block}
        </div>
    </div>    
{/block}