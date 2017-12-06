{extends file="frontend/address/index.tpl"}
{namespace name="frontend/address/index"}

{* Breadcrumb *}
{block name="frontend_index_start" append}
    {$sBreadcrumb[] = ["name"=>"{s name="AddressesDeleteTitle"}Delete address{/s}", "link"=>{url}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="account-address-delete">

        {* Addresses headline *}
        {block name="frontend_address_headline"}
            <h1>{s name="AddressesDeleteTitle"}{/s}</h1>
        {/block}

        {block name="frontend_address_content"}

            {block name="frontend_address_delete_notice"}
                <p>
                    {s name="AddressesDeleteNotice"}<b>Please note:</b> Deleting this address will not delete any pending orders being shipped to this address.{/s}
                    <br/>
                    {s name="AddressesDeleteConfirmText"}To permanently remove this address from your address book, click Confirm.{/s}
                </p>
            {/block}

            {block name="frontend_address_delete_content"}
                {block name="frontend_address_delete_content_inner"}
                    <address>
                        {if $address.company}
                            <p>{$address.company|escapeHtml}{if $address.department} - {$address.department|escapeHtml}{/if}</p>
                        {/if}   
                        <strong> 
                            {$address.salutation|salutation}
                            {if {config name="displayprofiletitle"}}
                                {$address.title|escapeHtml}<br/>
                            {/if}
                            {$address.firstname|escapeHtml} {$address.lastname|escapeHtml}
                        </strong><br />
                        {$address.street|escapeHtml}<br />
                        {if $address.additionalAddressLine1}{$address.additionalAddressLine1|escapeHtml}<br />{/if}
                        {if $address.additionalAddressLine2}{$address.additionalAddressLine2|escapeHtml}<br />{/if}
                        {if {config name=showZipBeforeCity}}{$address.zipCode|escapeHtml} {$address.city|escapeHtml}{else}{$address.city|escapeHtml} {$address.zipCode|escapeHtml}{/if}<br />
                        {if $address.state.name}{$address.state.name|escapeHtml}<br />{/if}
                        {$address.country.name|escapeHtml}
                    </address>
                {/block}
            {/block}

            {block name="frontend_address_delete_actions"}
                <form action="{url controller=address action=delete id=$address.id}" method="post" class="mtl">

                    {block name="frontend_address_delete_actions_cancel"}
                        <a href="{url controller=address action=index}" title="{s name="AddressesDeleteCancelText"}Cancel{/s}" class="btn btn-secondary">
                            {s name="AddressesDeleteCancelText"}Cancel{/s}
                        </a>
                    {/block}

                    {block name="frontend_address_delete_actions_confirm"}
                        <button type="submit" title="{s name="AddressesDeleteButtonText"}Confirm{/s}" class="btn btn-primary">
                            {s name="AddressesDeleteButtonText"}Confirm{/s}
                        </button>
                    {/block}
                </form>
            {/block}
        {/block}
    </div>
{/block}