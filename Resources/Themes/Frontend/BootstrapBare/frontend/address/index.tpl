{extends file="frontend/account/index.tpl"}

{* Breadcrumb *}
{block name="frontend_index_start" append}
    {$sBreadcrumb[] = ["name"=>"{s name="AddressesTitle"}My addresses{/s}", "link"=>{url action="index"}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="account-address">

        {* Addresses headline *}
        {block name="frontend_address_headline"}
            <h1>{s name="AddressesTitle"}{/s}</h1>
        {/block}

        {* Success messages *}
        {block name="frontend_address_success_messages"}
            {if $success}
                {include file="frontend/address/success_messages.tpl" type=$success}
            {/if}
        {/block}

        {* Error messages *}
        {block name="frontend_address_error_messages"}
            {if $error}
                {include file="frontend/address/error_messages.tpl" type=$error}
            {/if}
        {/block}

        {block name="frontend_address_content"}
            <div class="row" data-equalheight="true">
                {foreach $addresses as $address}
                    {block name="frontend_address_item_content"}
                        <div class="col-12 col-md-6">
                            {block name="frontend_address_item_content_body"}
                                <div class="panel panel-default address-content-item mtm">
                                    <div class="panel-body">
                                        {block name="frontend_address_item_content_title"}
                                            <div class="text-right">
                                                {block name="frontend_address_item_content_actions_delete"}
                                                    {if $sUserData.additional.user.default_shipping_address_id != $address.id && $sUserData.additional.user.default_billing_address_id != $address.id}
                                                        <a href="{url controller=address action=delete id=$address.id}" class="mrl" title="{s name="AddressesContentItemActionDelete"}Delete{/s}" >
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    {/if}
                                                {/block}

                                                {block name="frontend_address_item_content_actions_change"}
                                                    <a href="{url controller=address action=edit id=$address.id}" title="{s name="AddressesContentItemActionEdit"}Change{/s}">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                {/block}
                                            </div>
                                            <div class="mbm" data-equal="addressHeader">
                                                {if $sUserData.additional.user.default_shipping_address_id == $address.id || $sUserData.additional.user.default_billing_address_id == $address.id}
                                                    <h4 class="mtn">
                                                        {if $sUserData.additional.user.default_shipping_address_id == $address.id}
                                                            <span>{s name="AddressesTitleDefaultShippingAddress"}Default shipping address{/s}</span>
                                                        {/if}
                                                        {if $sUserData.additional.user.default_shipping_address_id == $address.id && $sUserData.additional.user.default_billing_address_id == $address.id}
                                                            {s name="AddressesTitleDefaultShippingBillingAnd"} & {/s}
                                                        {/if}
                                                        {if $sUserData.additional.user.default_billing_address_id == $address.id}
                                                            <span>{s name="AddressesTitleDefaultBillingAddress"}Default billing address{/s}</span>
                                                        {/if}
                                                    </h4>
                                                {/if}
                                            </div>
                                        {/block}

                                        {block name="frontend_address_item_content_inner"}
                                            <address class="mbm" data-equal="address">   
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
                                                {if {config name=showZipBeforeCity}}{$address.zipcode|escapeHtml} {$address.city|escapeHtml}{else}{$address.city|escapeHtml} {$address.zipcode|escapeHtml}{/if}<br />
                                                {if $address.state.name}{$address.state.name|escapeHtml}<br />{/if}
                                                {$address.country.name|escapeHtml}
                                            </address>
                                        {/block}

                                        {block name="frontend_address_item_content_actions"}
                                            <div data-equal="addressActions">
                                                {block name="frontend_address_item_content_set_default"}
                                                    {block name="frontend_address_item_content_set_default_shipping"}
                                                        {if $sUserData.additional.user.default_shipping_address_id != $address.id}
                                                            <form action="{url controller="address" action="setDefaultShippingAddress"}" method="post">
                                                                <input type="hidden" name="addressId" value="{$address.id}" />
                                                                <button type="submit" class="btn btn-secondary btn-sm mtm">{s name="AddressesSetAsDefaultShippingAction"}{/s}</button>
                                                            </form>
                                                        {/if}
                                                    {/block}

                                                    {block name="frontend_address_item_content_set_default_billing"}
                                                        {if $sUserData.additional.user.default_billing_address_id != $address.id}
                                                            <form action="{url controller="address" action="setDefaultBillingAddress"}" method="post">
                                                                <input type="hidden" name="addressId" value="{$address.id}" />
                                                                <button type="submit" class="btn btn-secondary btn-sm mtm">{s name="AddressesSetAsDefaultBillingAction"}{/s}</button>
                                                            </form>
                                                        {/if}
                                                    {/block}
                                                {/block}
                                            </div>       
                                        {/block}
                                    </div>    
                                </div>
                            {/block}
                        </div>    
                    {/block}
                {/foreach}
            </div>    

            {block name="frontend_address_item_content_create"}
                <a href="{url controller=address action=create}" title="{s name="AddressesContentItemActionCreate"}Neue Adresse anlegen{/s}" class="btn btn-primary mbl">
                    {s name="AddressesContentItemActionCreate"}{/s}
                </a>
            {/block}
        {/block}
    </div>
{/block}
