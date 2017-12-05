{extends file='frontend/index/index.tpl'}
{block name="gridconfig" prepend}
    {assign "grid" "g110" scope="global"}
{/block}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {assign var='sBreadcrumb' value=[['name'=>"{s name='AccountTitle'}{/s}", 'link' =>{url controller='account' action='index'}]]}
{/block}

{block name='frontend_index_content_left'}
    {block name="frontend_account_sidebar"}
        {include file="frontend/account/sidebar.tpl"}
    {/block}
{/block}

{block name='frontend_index_content'}
    {* Success messages *}
    {block name="frontend_account_index_success_messages"}
        {include file="frontend/account/success_messages.tpl"}
    {/block}

    {* Error messages *}
    {block name='frontend_account_index_error_messages'}
        {if $sErrorMessages}
            {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
        {/if}
    {/block}

    {* Welcome text *}
    {block name="frontend_account_index_welcome"}
        <div class="well">
            {block name="frontend_account_index_welcome_headline"}
                <h1 class="mtn">
                    {s name='AccountHeaderWelcome'}{/s},
                    {if {config name="displayprofiletitle"}}
                        {$sUserData.additional.user.title}
                    {/if}
                    {$sUserData.additional.user.firstname|escapeHtml}
                    {$sUserData.additional.user.lastname|escapeHtml}
                </h1>
            {/block}
            {block name="frontend_account_index_welcome_content"}
                <p>{s name='AccountHeaderInfo'}{/s}</p>
            {/block}
        </div>
    {/block}

    {block name="frontend_account_index_info_payment_row"}
        <div class="row" data-equalheight="true">
            {* General user informations *}
            {block name="frontend_account_index_info"}
                <div class="col-md-6 ">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <fieldset>
                                {block name="frontend_account_index_info_text"}
                                    <div data-equal="accounttext">
                                        {block name="frontend_account_index_info_headline"}
                                            <legend>{s name="AccountHeaderBasic"}{/s}</legend>
                                        {/block}

                                        {block name="frontend_account_index_info_content"}
                                            <address>
                                                {$sUserData.additional.user.salutation|salutation}
                                                {if {config name="displayprofiletitle"}}
                                                    {$sUserData.additional.user.title|escapeHtml}<br/>
                                                {/if}
                                                {$sUserData.additional.user.firstname|escapeHtml} {$sUserData.additional.user.lastname|escapeHtml}<br />
                                                {if $sUserData.additional.user.birthday}
                                                    {$sUserData.additional.user.birthday|date:'dd.MM.y'}<br />
                                                {/if}
                                                {$sUserData.additional.user.email|escapeHtml}
                                            </address>
                                        {/block}
                                    </div>
                                {/block}

                                {block name="frontend_account_index_info_actions"}
                                    <div class="row" data-equal="accountactions">
                                        <div class="col-xs-12">
                                            <a href="{url controller=account action=profile}" class="btn btn-primary mts" title="{s name='AccountLinkChangeProfile'}{/s}">
                                                {s name='AccountLinkChangeProfile'}Profil anpassen{/s}
                                            </a>
                                        </div>
                                    </div>
                                {/block}
                            </fieldset>
                        </div>
                    </div>
                </div>
            {/block}

            {* Payment informations *}
            {block name="frontend_account_index_payment_method"}
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <fieldset>
                                {block name="frontend_account_index_payment_method_text"}
                                    <div data-equal="accounttext">
                                        {block name="frontend_account_index_payment_method_headline"}
                                            <legend>{s name="AccountHeaderPayment"}{/s}</legend>
                                        {/block}

                                        {block name="frontend_account_index_payment_method_content"}
                                            <p>
                                                <strong>{$sUserData.additional.payment.description}</strong><br />
                                                {if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
                                                    {s name="AccountInfoInstantDownloads"}{/s}
                                                {/if}
                                            </p>
                                        {/block}
                                    </div>
                                {/block}

                                {block name="frontend_account_index_payment_method_actions"}
                                    <div class="row" data-equal="accountactions">
                                        <div class="col-xs-12">
                                            <a href="{url controller='account' action='payment'}" title="{s name='AccountLinkChangePayment'}{/s}" class="btn btn-primary mts">{s name='AccountLinkChangePayment'}{/s}</a>
                                        </div>
                                    </div>
                                {/block}
                            </fieldset>
                        </div>
                    </div>
                </div>
            {/block}
        </div>
    {/block}

    {* Newsletter settings *}
    {block name='frontend_account_index_newsletter_settings'}
        <div class="panel panel-default">
            <div class="panel-body">
                <form name="frmRegister" method="post" action="{url action=saveNewsletter}">
                    <fieldset>
                        {block name="frontend_account_index_newsletter_settings_headline"}
                            <legend>{s name="AccountHeaderNewsletter"}{/s}</legend>
                        {/block}
                        {block name="frontend_account_index_newsletter_settings_content"}
                            <div class="checkbox">
                                <label for="newsletter">
                                    <input data-auto-submit="true" type="checkbox" name="newsletter" value="1" id="newsletter" {if $sUserData.additional.user.newsletter}checked="checked"{/if} class="chkbox"/>{s name="AccountLabelWantNewsletter"}{/s}
                                </label>
                            </div>
                        {/block}
                    </fieldset>
                </form>
            </div>
        </div>
    {/block}

    {block name='frontend_account_index_primary_row'}
        <div class="row" data-equalheight="true">
            {* Addresses *}
            {block name="frontend_account_index_addresses"}
                {block name="frontend_account_index_primary_billing"}
                    <div class="col-md-6">
                        <div class="panel panel-default" data-equal="accountAddressWrapper">
                            <div class="panel-body">
                                {block name="frontend_account_index_primary_billing_headline"}
                                    <legend>{s name="AccountHeaderPrimaryBilling"}{/s}</legend>
                                {/block}

                                {block name="frontend_account_index_primary_billing_content"}
                                    <address data-equal="accountAddress">
                                        {if $sUserData.billingaddress.company}
                                            <strong>{$sUserData.billingaddress.company|escapeHtml}{if $sUserData.billingaddress.department} - {$sUserData.billingaddress.department|escapeHtml}{/if}</strong>
                                            <br/>
                                        {/if}
                                        <strong>
                                            {$sUserData.billingaddress.salutation|salutation|escapeHtml}
                                            {if {config name="displayprofiletitle"}}
                                                {$sUserData.billingaddress.title|escapeHtml}<br/>
                                            {/if}
                                            {$sUserData.billingaddress.firstname|escapeHtml} {$sUserData.billingaddress.lastname|escapeHtml}
                                        </strong><br />
                                        {$sUserData.billingaddress.street}<br />
                                        {if $sUserData.billingaddress.additional_address_line1}{$sUserData.billingaddress.additional_address_line1|escapeHtml}<br />{/if}
                                        {if $sUserData.billingaddress.additional_address_line2}{$sUserData.billingaddress.additional_address_line2|escapeHtml}<br />{/if}
                                        {if {config name=showZipBeforeCity}}
                                            {$sUserData.billingaddress.zipcode} {$sUserData.billingaddress.city|escapeHtml}
                                        {else}
                                            {$sUserData.billingaddress.city|escapeHtml} {$sUserData.billingaddress.zipcode|escapeHtml}
                                        {/if}<br />
                                        {if $sUserData.additional.state.statename}{$sUserData.additional.state.statename|escapeHtml}<br />{/if}
                                        {$sUserData.additional.country.countryname|escapeHtml}
                                    </address>
                                {/block}

                                {block name="frontend_account_index_primary_billing_actions"}
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <a href="{url controller=address action=edit id=$sUserData.additional.user.default_billing_address_id sTarget=account}"
                                               title="{s name='AccountLinkChangeBilling'}{/s}"
                                               class="btn btn-primary mbs">
                                                {s name="AccountLinkChangeBilling"}{/s}
                                            </a>
                                        </div>
                                        <div class="col-xs-12">
                                            <a href="{url controller=address}"
                                               data-address-selection="true"
                                               data-setDefaultBillingAddress="1"
                                               data-id="{$sUserData.additional.user.default_billing_address_id}"
                                               class="text-primary"
                                               title="{s name='AccountLinkSelectBilling'}{/s}">
                                                {s name="AccountLinkSelectBilling"}{/s}
                                            </a>
                                        </div>
                                    </div>
                                 {/block}
                            </div>
                        </div>
                    </div>
                {/block}
                {block name="frontend_account_index_primary_shipping"}
                    <div class="col-md-6">
                        <div class="panel panel-default" data-equal="accountAddressWrapper">
                            <div class="panel-body">
                                {block name="frontend_account_index_primary_shipping_headline"}
                                    <legend>{s name="AccountHeaderPrimaryShipping"}{/s}</legend>
                                {/block}

                                {block name="frontend_account_index_primary_shipping_content"}
                                    <address data-equal="accountAddress">
                                        {if $activeBillingAddressId == $activeShippingAddressId}
                                            {block name="frontend_account_index_primary_shipping_content_equality_notice"}
                                                <div class="shipping-equal-info">
                                                    {s name="AccountAddressEqualsBilling"}Equal to the billing address{/s}
                                                </div>
                                            {/block}
                                        {else}
                                            {block name="frontend_account_index_primary_shipping_content_address"}
                                                {if $sUserData.shippingaddress.company}
                                                    <strong>
                                                        <span class="address-company">{$sUserData.shippingaddress.company|escapeHtml}</span>
                                                        {if $sUserData.shippingaddress.department}
                                                            - <span class="address-department">{$sUserData.shippingaddress.department|escapeHtml}</span>
                                                        {/if}
                                                    </strong><br>
                                                {/if}
                                                <strong>
                                                    <span class="address-salutation">{$sUserData.shippingaddress.salutation|salutation}</span>
                                                    {if {config name="displayprofiletitle"}}
                                                        <span class="address-title">{$sUserData.shippingaddress.title|escapeHtml}</span><br/>
                                                    {/if}
                                                    <span class="address-firstname">{$sUserData.shippingaddress.firstname|escapeHtml}</span>
                                                    <span class="address-lastname">{$sUserData.shippingaddress.lastname|escapeHtml}</span><br />
                                                </strong>
                                                <span class="address-street">{$sUserData.shippingaddress.street|escapeHtml}</span><br />
                                                {if $sUserData.shippingaddress.additional_address_line1}
                                                    <span class="address-additional-one">{$sUserData.shippingaddress.additional_address_line1|escapeHtml}</span><br />
                                                {/if}
                                                {if $sUserData.shippingaddress.additional_address_line2}
                                                    <span class="address-additional-two">{$sUserData.shippingaddress.additional_address_line2|escapeHtml}</span><br />
                                                {/if}
                                                {if {config name=showZipBeforeCity}}
                                                    <span class="address-zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span> <span class="address-city">{$sUserData.shippingaddress.city|escapeHtml}</span>
                                                {else}
                                                    <span class="address-city">{$sUserData.shippingaddress.city|escapeHtml}</span> <span class="address-zipcode">{$sUserData.shippingaddress.zipcode|escapeHtml}</span>
                                                {/if}
                                                <br />
                                                {if $sUserData.additional.stateShipping.statename}<span class="address-statename">{$sUserData.additional.stateShipping.statename|escapeHtml}</span><br />{/if}
                                                <span class="address-countryname">{$sUserData.additional.countryShipping.countryname|escapeHtml}</span>
                                            {/block}
                                        {/if}
                                    </address>
                                {/block}

                                {block name="frontend_account_index_primary_shipping_actions"}
                                    {if $activeBillingAddressId == $activeShippingAddressId}
                                        {block name="frontend_account_index_primary_shipping_choose_seperate_address"}
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <a href="{url controller=address}"
                                                       class="btn btn-primary choose-different-address"
                                                       data-address-selection="true"
                                                       data-setDefaultShippingAddress="1"
                                                       data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                                       title="{s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}">
                                                        {s name="ConfirmAddressChooseDifferentShippingAddress" namespace="frontend/checkout/confirm"}{/s}
                                                    </a>
                                                </div>
                                            </div>
                                        {/block}
                                    {else}
                                        {block name="frontend_account_index_primary_shipping_add_select_address"}
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <a href="{url controller=address action=edit id=$sUserData.additional.user.default_shipping_address_id sTarget=account}"
                                                       title="{s name='AccountLinkChangeShipping'}{/s}"
                                                       class="btn btn-primary mbs">
                                                        {s name="AccountLinkChangeShipping"}{/s}
                                                    </a>
                                                    <br/>
                                                    <a href="{url controller=address}"
                                                       data-address-selection="true"
                                                       data-setDefaultShippingAddress="1"
                                                       data-id="{$sUserData.additional.user.default_shipping_address_id}"
                                                       title="{s name='AccountLinkSelectShipping'}{/s}"
                                                       class="text-primary">
                                                        {s name="AccountLinkSelectShipping"}{/s}
                                                    </a>
                                                </div>
                                            </div>
                                        {/block}
                                    {/if}
                                {/block}
                            </div>
                        </div>
                    </div>
                {/block}
            {/block}    
        </div>
    {/block}

    {* Logout on mobile *}
    {block name="frontend_account_index_mobile_actions"}
        <a href="{url controller='account' action='logout'}" class="btn btn-danger btn-block d-block d-sm-none d-md-none mbm">
            <strong>{s name="AccountLinkLogout" namespace="frontend/account/sidebar"}{/s}</strong>
        </a>
    {/block}
{/block}

{block name="frontend_index_content_right"}{/block}
