{extends file="frontend/index/index.tpl"}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* #webksde: Added missing block ("PayPal Plus integration") *}
{block name='frontend_index_header_javascript_jquery_lib'}
    {$smarty.block.parent}
{/block}

{* Shop header *}
{block name='frontend_index_navigation'}
    {* makes it possible to override checkout header in custom theme *}
    {block name='frontend_index_navigation_checkout_header_include'}
        {$includeCheckoutHeader = $theme.checkoutHeader}
    {/block}

    {if !$includeCheckoutHeader}
        {$smarty.block.parent}
    {else}
        {include file="frontend/checkout/header.tpl"}
    {/if}
{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Hide shop navigation *}
{block name='frontend_index_shop_navigation'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Step box *}
{block name="frontend_index_content_top"}
    {* Step box *}
    {include file="frontend/register/steps.tpl" sStepActive="finished"}
{/block}

{* Hide top bar *}
{block name='frontend_index_top_bar_container'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Footer *}
{block name="frontend_index_footer"}
    {if !$theme.checkoutFooter}
        {$smarty.block.parent}
    {else}
        {block name='frontend_index_checkout_confirm_footer'}
            {include file="frontend/index/footer_minimal.tpl"}
        {/block}
    {/if}
{/block}

{* Main content *}
{block name="frontend_index_content"}

    {* Error messages *}
    {block name='frontend_checkout_confirm_error_messages'}
        {include file="frontend/checkout/error_messages.tpl"}
    {/block}

    {* Personal information *}
    {block name='frontend_checkout_confirm_personal_information'}
        <h2>{s name="ConfirmHeadlinePersonalInformation"}Ihre pers&ouml;nlichen Informationen{/s}</h2>
        {if {config name=additionalfreetext}}
            <p>{s name="ConfirmInfoChange"}{/s}</p>
        {/if}
    {/block}

    {block name='frontend_checkout_confirm_information_wrapper'}
        {block name='frontend_checkout_confirm_billing_shipping_address_row'}
            <div class="row" data-equalheight="true">
                {block name='frontend_checkout_confirm_information_addresses'}

                    {if $activeBillingAddressId == $activeShippingAddressId}

                        {* Equal Billing & Shipping *}
                        {block name='frontend_checkout_confirm_information_addresses_equal'}
                            <div class="col-lg-12" id="confirm-billing-shipping-address">

                                {block name='frontend_checkout_confirm_information_addresses_equal_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            {block name='frontend_checkout_confirm_information_addresses_equal_panel_title'}
                                                <legend>{s name='ConfirmAddressEqualTitle'}Rechnungsadresse & Lieferadresse{/s}</legend>
                                            {/block}

                                            {block name='frontend_checkout_confirm_information_addresses_equal_panel_body'}
                                                <div class="row">
                                                    {block name='frontend_checkout_confirm_information_addresses_equal_panel_billing'}
                                                        <div class="col-hd-6">
                                                            <address>
                                                                {if $sUserData.billingaddress.company}
                                                                    <strong>{$sUserData.billingaddress.company|escapeHtml}
                                                                        {if $sUserData.billingaddress.department}<br />{$sUserData.billingaddress.department|escapeHtml}{/if}
                                                                    </strong>
                                                                    <br />
                                                                {/if}

                                                                {$sUserData.billingaddress.salutation|salutation}
                                                                {if {config name="displayprofiletitle"}}
                                                                    {$sUserData.billingaddress.title|escapeHtml}<br/>
                                                                {/if}
                                                                {$sUserData.billingaddress.firstname|escapeHtml} {$sUserData.billingaddress.lastname|escapeHtml}<br/>
                                                                {$sUserData.billingaddress.street|escapeHtml}<br />
                                                                {if $sUserData.billingaddress.additional_address_line1}{$sUserData.billingaddress.additional_address_line1|escapeHtml}<br />{/if}
                                                                {if $sUserData.billingaddress.additional_address_line2}{$sUserData.billingaddress.additional_address_line2|escapeHtml}<br />{/if}
                                                                {if {config name=showZipBeforeCity}}{$sUserData.billingaddress.zipcode|escapeHtml} {$sUserData.billingaddress.city|escapeHtml}{else}{$sUserData.billingaddress.city|escapeHtml} {$sUserData.billingaddress.zipcode|escapeHtml}{/if}<br />
                                                                {if $sUserData.additional.state.name}{$sUserData.additional.state.name|escapeHtml}<br />{/if}
                                                                {$sUserData.additional.country.countryname|escapeHtml}
                                                            </address>
                                                            {block name="frontend_checkout_confirm_information_addresses_equal_panel_billing_invalid_data"}
                                                                {if $invalidBillingAddress}
                                                                    {if $invalidShippingCountry}
                                                                        {s namespace="frontend/address/index" name="CountryNotAvailableForShipping" assign="snippetCountryNotAvailableForShipping"}{/s}
                                                                        {include file='frontend/_includes/messages.tpl' type="warning" content=$snippetCountryNotAvailableForShipping}
                                                                    {else}
                                                                        {s name="ConfirmAddressInvalidAddress" assign="snippetConfirmAddressInvalidAddress"}{/s}
                                                                        {include file='frontend/_includes/messages.tpl' type="warning" content=$snippetConfirmAddressInvalidAddress}
                                                                    {/if}
                                                                {else}
                                                                    {block name="frontend_checkout_confirm_information_addresses_equal_panel_billing_set_as_default"}
                                                                        {if $activeBillingAddressId != $sUserData.additional.user.default_billing_address_id || $activeShippingAddressId != $sUserData.additional.user.default_shipping_address_id}
                                                                            <div class="mbm">
                                                                                <label for="set_as_default" class="checkbox-inline">
                                                                                    <input type="checkbox" name="setAsDefaultAddress" id="set_as_default" value="1" />
                                                                                    {s name='ConfirmUseForFutureOrders'}Als Standard verwenden{/s}
                                                                                </label>
                                                                            </div>
                                                                        {/if}
                                                                    {/block}
                                                                {/if}
                                                            {/block}
                                                            {block name='frontend_checkout_confirm_information_addresses_equal_panel_actions'}
                                                                {block name="frontend_checkout_confirm_information_addresses_equal_panel_actions_change"}
                                                                    {block name='frontend_checkout_confirm_information_addresses_equal_panel_shipping_change_address'}
                                                                        <a href="{url controller=address action=edit id=$activeBillingAddressId sTarget=checkout sTargetAction=confirm}"
                                                                           data-address-editor="true"
                                                                           data-id="{$activeBillingAddressId}"
                                                                           data-sessionKey="checkoutBillingAddressId,checkoutShippingAddressId"
                                                                           data-title="{s name="ConfirmAddressSelectButton"}{/s}"
                                                                           title="{s name="ConfirmAddressSelectButton"}{/s}"
                                                                           class="btn btn-primary btn-sm">
                                                                            {s name="ConfirmAddressSelectButton"}{/s}
                                                                        </a>
                                                                    {/block}
                                                                {/block}
                                                                {block name="frontend_checkout_confirm_information_addresses_equal_panel_actions_select_address"}
                                                                    <a href="{url controller=address}"
                                                                       title="{s name="ConfirmAddressSelectLink"}{/s}"
                                                                       data-address-selection="true"
                                                                       data-sessionKey="checkoutBillingAddressId,checkoutShippingAddressId"
                                                                       data-id="{$activeBillingAddressId}"
                                                                       class="btn btn-default btn-sm">
                                                                        {s name="ConfirmAddressSelectLink"}{/s}
                                                                    </a>
                                                                {/block}
                                                            {/block}
                                                        </div>
                                                    {/block}

                                                    {block name='frontend_checkout_confirm_information_addresses_equal_panel_shipping'}
                                                        <div class="col-hd-6">
                                                            {block name='frontend_checkout_confirm_information_addresses_equal_panel_shipping_add_address'}
                                                                <a href="{url controller=address}"
                                                                   class="btn btn-primary btn-sm mtm-xs mtm-sm"
                                                                   data-address-selection="true"
                                                                   data-sessionKey="checkoutShippingAddressId"
                                                                   data-id="{$activeShippingAddressId}"
                                                                   title="{s name="ConfirmAddressChooseDifferentShippingAddress"}Andere Lieferadresse{/s}">
                                                                    {s name="ConfirmAddressChooseDifferentShippingAddress"}{/s}
                                                                </a>
                                                            {/block}
                                                        </div>
                                                    {/block}
                                                </div>
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}

                    {else}

                        {* Separate Billing & Shipping *}
                        {block name='frontend_checkout_confirm_information_addresses_billing'}
                            <div class="col-lg-6" id="confirm-billing-address">
                                {* Billing address *}
                                {block name='frontend_checkout_confirm_information_addresses_billing_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            {* Headline *}
                                            {block name='frontend_checkout_confirm_information_addresses_billing_panel_title'}
                                                <legend>{s name="ConfirmHeaderBilling" namespace="frontend/checkout/confirm"}{/s}</legend>
                                            {/block}

                                            {* Content *}
                                            {block name='frontend_checkout_confirm_information_addresses_billing_panel_body'}
                                                <div data-equal="addressContent" class="mbm">
                                                    <address>
                                                        {if $sUserData.billingaddress.company}
                                                            <strong>{$sUserData.billingaddress.company|escapeHtml}{if $sUserData.billingaddress.department}<br />{$sUserData.billingaddress.department|escapeHtml}{/if}</strong>
                                                            <br />
                                                        {/if}
                                                        {$sUserData.billingaddress.salutation|salutation}
                                                        {if {config name="displayprofiletitle"}}
                                                            {$sUserData.billingaddress.title|escapeHtml}<br/>
                                                        {/if}
                                                        {$sUserData.billingaddress.firstname|escapeHtml} {$sUserData.billingaddress.lastname|escapeHtml}<br />
                                                        {$sUserData.billingaddress.street|escapeHtml}<br />
                                                        {if $sUserData.billingaddress.additional_address_line1}{$sUserData.billingaddress.additional_address_line1|escapeHtml}<br />{/if}
                                                        {if $sUserData.billingaddress.additional_address_line2}{$sUserData.billingaddress.additional_address_line2|escapeHtml}<br />{/if}
                                                        {if {config name=showZipBeforeCity}}{$sUserData.billingaddress.zipcode|escapeHtml} {$sUserData.billingaddress.city|escapeHtml}{else}{$sUserData.billingaddress.city|escapeHtml} {$sUserData.billingaddress.zipcode|escapeHtml}{/if}<br />
                                                        {if $sUserData.additional.state.name}{$sUserData.additional.state.name|escapeHtml}<br />{/if}
                                                        {$sUserData.additional.country.countryname|escapeHtml}
                                                    </address>
                                                    {block name="frontend_checkout_confirm_information_addresses_billing_panel_body_invalid_data"}
                                                        {if $invalidBillingAddress}
                                                            {include file='frontend/_includes/messages.tpl' type="warning" content="{s name='ConfirmAddressInvalidBillingAddress'}{/s}"}
                                                        {else}
                                                            {block name="frontend_checkout_confirm_information_addresses_billing_panel_body_set_as_default"}
                                                                {if $activeBillingAddressId != $sUserData.additional.user.default_billing_address_id}
                                                                    <div>
                                                                        <label for="set_as_default_billing" class="checkbox-inline">
                                                                            <input name="setAsDefaultBillingAddress" type="checkbox" id="set_as_default_billing" value="1" />
                                                                            {s name='ConfirmUseForFutureOrders'}{/s}
                                                                        </label>
                                                                    </div>
                                                                {/if}
                                                            {/block}
                                                        {/if}
                                                    {/block}
                                                </div>
                                            {/block}

                                            {* Action buttons *}
                                            {block name="frontend_checkout_confirm_information_addresses_billing_panel_actions"}
                                                {block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_change"}
                                                    {block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_change_address"}
                                                        <a href="{url controller=address action=edit id=$activeBillingAddressId sTarget=checkout sTargetAction=confirm}"
                                                           data-address-editor="true"
                                                           data-sessionKey="checkoutBillingAddressId"
                                                           data-id="{$activeBillingAddressId}"
                                                           data-title="{s name="ConfirmAddressSelectButton"}Ändern{/s}"
                                                           title="{s name="ConfirmAddressSelectButton"}{/s}"
                                                           class="btn btn-sm btn-primary">
                                                            {s name="ConfirmAddressSelectButton"}{/s}
                                                        </a>
                                                    {/block}
                                                {/block}
                                                {block name="frontend_checkout_confirm_information_addresses_billing_panel_actions_select_address"}
                                                    <a href="{url controller=address}"
                                                       data-address-selection="true"
                                                       data-sessionKey="checkoutBillingAddressId"
                                                       data-id="{$activeBillingAddressId}"
                                                       title="{s name="ConfirmAddressSelectLink"}Andere{/s}"
                                                       class="btn btn-default btn-sm">
                                                        {s name="ConfirmAddressSelectLink"}{/s}
                                                    </a>
                                                {/block}
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}

                        {block name='frontend_checkout_confirm_information_addresses_shipping'}
                            <div class="col-lg-6" id="confirm-shipping-address">
                                {* Shipping address *}
                                {block name='frontend_checkout_confirm_information_addresses_shipping_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            {* Headline *}
                                            {block name='frontend_checkout_confirm_information_addresses_shipping_panel_title'}
                                                <legend>{s name="ConfirmHeaderShipping" namespace="frontend/checkout/confirm"}{/s}</legend>
                                            {/block}

                                            {* Content *}
                                            {block name='frontend_checkout_confirm_information_addresses_shipping_panel_body'}
                                                <div data-equal="addressContent" class="mbm">
                                                    <address>
                                                        {if $sUserData.shippingaddress.company}
                                                            <strong>{$sUserData.shippingaddress.company|escapeHtml}{if $sUserData.shippingaddress.department|escapeHtml}<br />{$sUserData.shippingaddress.department|escapeHtml}{/if}</strong>
                                                            <br />
                                                        {/if}

                                                        {$sUserData.shippingaddress.salutation|salutation}
                                                        {if {config name="displayprofiletitle"}}
                                                            {$sUserData.shippingaddress.title|escapeHtml}<br/>
                                                        {/if}
                                                        {$sUserData.shippingaddress.firstname|escapeHtml} {$sUserData.shippingaddress.lastname|escapeHtml}<br/>
                                                        {$sUserData.shippingaddress.street|escapeHtml}<br />
                                                        {if $sUserData.shippingaddress.additional_address_line1}{$sUserData.shippingaddress.additional_address_line1|escapeHtml}<br />{/if}
                                                        {if $sUserData.shippingaddress.additional_address_line2}{$sUserData.shippingaddress.additional_address_line2|escapeHtml}<br />{/if}
                                                        {if {config name=showZipBeforeCity}}{$sUserData.shippingaddress.zipcode|escapeHtml} {$sUserData.shippingaddress.city|escapeHtml}{else}{$sUserData.shippingaddress.city|escapeHtml} {$sUserData.shippingaddress.zipcode|escapeHtml}{/if}<br />
                                                        {if $sUserData.additional.stateShipping.name}{$sUserData.additional.stateShipping.name|escapeHtml}<br />{/if}
                                                        {$sUserData.additional.countryShipping.countryname|escapeHtml}
                                                    </address>
                                                    {block name="frontend_checkout_confirm_information_addresses_shipping_panel_body_invalid_data"}
                                                        {if $invalidShippingAddress}
                                                            {include file='frontend/_includes/messages.tpl' type="warning" content="{s name='ConfirmAddressInvalidShippingAddress'}{/s}"}
                                                        {else}
                                                            {block name="frontend_checkout_confirm_information_addresses_shipping_panel_body_set_as_default"}
                                                                {if $activeShippingAddressId != $sUserData.additional.user.default_shipping_address_id}
                                                                    <div>
                                                                        <label for="set_as_default_shipping" class="checkbox-inline">
                                                                            <input name="setAsDefaultShippingAddress" type="checkbox" id="set_as_default_shipping" value="1" />
                                                                            {s name='ConfirmUseForFutureOrders'}{/s}
                                                                        </label>
                                                                    </div>
                                                                {/if}
                                                            {/block}
                                                        {/if}
                                                    {/block}
                                                </div>
                                            {/block}

                                            {* Action buttons *}
                                            {block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions"}
                                                {block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_change"}
                                                    {block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_change_address"}
                                                        <a href="{url controller=address action=edit id=$activeShippingAddressId sTarget=checkout sTargetAction=confirm}"
                                                           title="{s name="ConfirmAddressSelectButton"}Ändern{/s}"
                                                           data-title="{s name="ConfirmAddressSelectButton"}{/s}"
                                                           data-address-editor="true"
                                                           data-id="{$activeShippingAddressId}"
                                                           data-sessionKey="checkoutShippingAddressId"
                                                           class="btn btn-sm btn-primary">
                                                            {s name="ConfirmAddressSelectButton"}{/s}
                                                        </a>
                                                    {/block}
                                                {/block}
                                                {block name="frontend_checkout_confirm_information_addresses_shipping_panel_actions_select_address"}
                                                    <a href="{url controller=address}"
                                                       data-address-selection="true"
                                                       data-sessionKey="checkoutShippingAddressId"
                                                       data-id="{$activeShippingAddressId}"
                                                       title="{s name="ConfirmAddressSelectLink"}Andere{/s}"
                                                       class="btn btn-default btn-sm">
                                                        {s name="ConfirmAddressSelectLink"}{/s}
                                                    </a>
                                                {/block}
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    {/if}
                {/block}
            </div>
        {/block}

        {block name='frontend_checkout_confirm_dispatch_payment_method_row'}
            <div class="row" data-equalheight="true">
                {* Dispatch method *}
                {block name='frontend_checkout_confirm_dispatch_method_panel'}
                    <div class="col-lg-6">
                        {include file="frontend/checkout/confirm_dispatch.tpl"}
                    </div>
                {/block}

                {* Payment method *}
                {block name='frontend_checkout_confirm_payment_method_panel'}
                    <div class="col-lg-6" id="confirm-show-payment">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                {block name='frontend_checkout_confirm_left_payment_method_headline'}
                                    <legend>{s name="ConfirmHeaderPaymentShipping" namespace="frontend/checkout/confirm"}{/s}</legend>
                                {/block}
                                <div class="panel-wrapper" data-equal="paymentrow">
                                    {block name='frontend_checkout_confirm_left_payment_method'}
                                        <p>
                                            <strong>{$sUserData.additional.payment.description}</strong>
                                            {if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
                                                <br/>
                                                <small>{s name="ConfirmInfoInstantDownload" namespace="frontend/checkout/confirm_left"}{/s}</small>
                                            {/if}
                                        </p>
                                    {/block}

                                    {* Action buttons *}
                                    {block name='frontend_checkout_confirm_left_payment_method_actions'}
                                        <a href="{url controller=checkout action=shippingPayment sTarget=checkout}" class="btn btn-sm btn-primary">
                                            {s name="ConfirmLinkChangePayment" namespace="frontend/checkout/confirm"}{/s}
                                        </a>
                                    {/block}
                                </div>
                            </div>
                        </div>
                    </div>
                {/block}
            </div>
        {/block}
    {/block}

    {* AGB and Revocation *}
    {block name='frontend_checkout_confirm_form'}
        <form id="confirm--form" method="post" action="{if $sPayment.embediframe || $sPayment.action}{url action='payment'}{else}{url action='finish'}{/if}">

            {block name='frontend_checkout_confirm_tos_panel'}
                <div id="confirm-tos">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {block name='frontend_checkout_confirm_tos_panel_headline'}
                                <legend>{s name="ConfirmHeadlineAGBandRevocation"}AGB und Widerrufsbelehrung{/s}</legend>
                            {/block}

                            {* Right of revocation notice *}
                            {block name='frontend_checkout_confirm_tos_revocation_notice'}
                                {if {config name=revocationnotice}}
                                    <p>{s name="ConfirmTextRightOfRevocationModalLink"}Bitte beachten Sie bei Ihrer Bestellung auch unsere <a href="{url controller=custom sCustom=8}" data-toggle="ajax-modal">Widerrufsbelehrung</a>.{/s}</p>
                                {/if}
                            {/block}

                            {block name='frontend_checkout_confirm_tos_panel_form'}
                                {* Terms of service *}
                                {block name='frontend_checkout_confirm_agb'}
                                    <div class="checkbox">
                                        <label for="sAGB"{if $sAGBError} class="text-danger"{/if}>
                                            {if !{config name='IgnoreAGB'}}
                                                {* Terms of service checkbox *}
                                                {block name='frontend_checkout_confirm_agb_checkbox'}
                                                    <input type="checkbox" class="agb_accept" name="sAGB" id="sAGB" required="required" aria-required="true" {if $sAGBChecked} checked="checked"{/if} />
                                                {/block}
                                            {/if}
                                            {* AGB label *}
                                            {block name='frontend_checkout_confirm_agb_label'}
                                                <span data-toggle="ajax-modal">{s name="ConfirmTerms"}{/s}</span>
                                            {/block}
                                        </label>
                                    </div>
                                {/block}
                                {block name="fontend_checkout_confirm_hiddenSComment"}
                                    <input class="user-comment-hidden" type="hidden" name="sComment" value="">
                                {/block}

                                {* Service articles and ESD articles *}
                                {block name='frontend_checkout_confirm_service_esd'}
                                    {* Service articles*}
                                    {block name='frontend_checkout_confirm_service'}
                                        {if $hasServiceArticles}
                                            <div class="checkbox">
                                                <label for="serviceAgreementChecked"{if $agreementErrors && $agreementErrors.serviceError} class="text-danger"{/if}>
                                                    {* Service articles checkbox*}
                                                    {block name='frontend_checkout_confirm_service_checkbox'}
                                                        <input type="checkbox" required="required" aria-required="true" name="serviceAgreementChecked" id="serviceAgreementChecked"{if $serviceAgreementChecked} checked="checked"{/if} />
                                                        {* Service articles label*}
                                                        {block name='frontend_checkout_confirm_service_label'}
                                                            {s name="AcceptServiceMessage"}{/s}
                                                        {/block}
                                                    {/block}
                                                </label>
                                            </div>
                                        {/if}
                                    {/block}

                                    {* ESD articles*}
                                    {block name='frontend_checkout_confirm_esd'}
                                        {if $hasEsdArticles}
                                            <div class="checkbox">
                                                <label for="esdAgreementChecked"{if $agreementErrors && $agreementErrors.esdError} class="text-danger"{/if}>
                                                    {* ESD articles checkbox*}
                                                    {block name='frontend_checkout_confirm_esd_checkbox'}
                                                        <input type="checkbox" name="esdAgreementChecked" required="required" aria-required="true" id="esdAgreementChecked"{if $esdAgreementChecked} checked="checked"{/if} />
                                                        {* ESD articles label *}
                                                        {block name='frontend_checkout_confirm_esd_label'}
                                                            {s name="AcceptEsdMessage"}{/s}
                                                        {/block}
                                                    {/block}
                                                </label>
                                            </div>
                                        {/if}
                                    {/block}
                                {/block}

                                {* Newsletter sign up checkbox *}
                                {block name='frontend_checkout_confirm_newsletter'}
                                    {if !$sUserData.additional.user.newsletter && {config name=newsletter}}
                                        <div class="checkbox">
                                            <label for="sNewsletter">
                                                {* Newsletter checkbox *}
                                                {block name='frontend_checkout_confirm_newsletter_checkbox'}
                                                    <input type="checkbox" name="sNewsletter" id="sNewsletter" value="1"{if $sNewsletter} checked="checked"{/if} />
                                                    {* Newsletter label *}
                                                    {block name='frontend_checkout_confirm_newsletter_label'}
                                                        {s name="ConfirmLabelNewsletter"}{/s}
                                                    {/block}
                                                {/block}
                                            </label>
                                        </div>
                                    {/if}
                                {/block}
                            {/block}

                            {* Additional custom text field which can be used to display the terms of services *}
                            {block name="frontend_checkout_confirm_additional_free_text_display"}
                                {if {config name=additionalfreetext}}
                                    <p>{s name="ConfirmTextOrderDefault"}{/s}</p>
                                {/if}
                            {/block}

                            {* Additional notice - bank connection *}
                            {block name="frontend_checkout_confirm_bank_connection_notice"}
                                {if {config name=bankConnection}}
                                    <p>{s name="ConfirmInfoPaymentData"}{/s}</p>
                                {/if}
                            {/block}
                        </div>
                    </div>
                </div>
            {/block}
        </form>
    {/block}

    {* Additional feature which can be enabled / disabled in the base configuration *}
    {block name="frontend_checkout_confirm_voucher_comment_row"}
        {if {config name=commentvoucherarticle}||{config name=bonussystem} && {config name=bonus_system_active} && {config name=displaySlider}}
            <div class="row mbl" data-equalheight="true">
                {* Voucher and add article *}
                {if {config name=commentvoucherarticle}}
                    {block name="frontend_checkout_confirm_voucher_addarticle_panel"}
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <legend>{s name="ConfirmHeadlineAdditionalOptions"}Weitere Optionen{/s}</legend>
                                    <div class="panel-wrapper" data-equal="additionalrow">
                                        {* Additional feature - Add voucher *}
                                        {block name="frontend_checkout_confirm_additional_features_add_voucher"}
                                            <form method="post" action="{url action='addVoucher' sTargetAction=$sTargetAction}">
                                                {block name='frontend_checkout_table_footer_left_add_voucher_agb'}
                                                    {if !{config name='IgnoreAGB'}}
                                                        <input type="hidden" class="agb-checkbox" name="sAGB" value="{if $sAGBChecked}1{else}0{/if}"/>
                                                    {/if}
                                                {/block}
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        {block name='frontend_checkout_confirm_add_voucher_field'}
                                                            <input type="text" class="form-control" id="basket_add_voucher" name="sVoucher" placeholder="{"{s name='CheckoutFooterAddVoucherLabelInline' namespace='frontend/checkout/cart_footer'}{/s}"|escape}" />
                                                        {/block}
                                                        {block name='frontend_checkout_confirm_add_voucher_button'}
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="submit">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </span>
                                                        {/block}
                                                    </div>
                                                </div>
                                            </form>
                                        {/block}

                                        {* Additional feature - Add product using the sku *}
                                        {block name="frontend_checkout_confirm_additional_features_add_product"}
                                            <form method="post" action="{url action='addArticle' sTargetAction=$sTargetAction}">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        {block name='frontend_checkout_confirm_add_product_field'}
                                                            <input id="basket_add_article" name="sAdd" type="text" placeholder="{s name='CheckoutFooterAddProductPlaceholder' namespace='frontend/checkout/cart_footer_left'}{/s}" class="form-control" />
                                                        {/block}
                                                        {block name='frontend_checkout_confirm_add_product_button'}
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="submit">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </span>
                                                        {/block}
                                                    </div>
                                                </div>
                                            </form>
                                        {/block}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/block}
                    {* Comment functionality *}
                    {block name="frontend_checkout_confirm_comment_panel"}
                        <div class="col-lg-6">
                            {* Additional customer comment for the order *}
                            {block name='frontend_checkout_confirm_comment'}
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <legend>{s name="CheckoutCommentHeadline"}Kommentar{/s}</legend>
                                        <div class="panel-wrapper" data-equal="additionalrow">
                                            <textarea name="sComment"
                                                        class="form-control user-comment-field"
                                                        data-storage-field="true"
                                                        data-storageKeyName="sComment"
                                                        data-pseudo-text="true"
                                                        data-selector=".user-comment-hidden"
                                                        rows="5">
                                                {$sComment|escape}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                            {/block}
                        </div>
                    {/block}
                {/if}
            </div>
        {/if}
    {/block}

    {* Premiums articles *}
    {block name='frontend_checkout_confirm_premiums'}
        {if $sPremiums && {config name=premiumarticles}}
            {include file='frontend/checkout/premiums.tpl'}
        {/if}
    {/block}

    {* #webksde: Added missing block ("Do not allow deletion of items" *}
    {block name='frontend_checkout_cart_item_delete_article'}
        {$smarty.block.parent}
    {/block}

    {* #webksde: Added missing block ("Disable item quantity selection") *}
    {block name='frontend_checkout_cart_item_quantity_selection'}
        {$smarty.block.parent}
    {/block}

    {block name='frontend_checkout_confirm_product_table'}
        {block name="frontend_checkout_confirm_product_table_content"}
            {* Product table header *}
            {block name='frontend_checkout_confirm_confirm_head'}
                {include file="frontend/checkout/confirm_header.tpl"}
            {/block}

            {block name='frontend_checkout_confirm_item_before'}{/block}

            {* Basket items *}
            {block name='frontend_checkout_confirm_item_outer'}
                {foreach $sBasket.content as $sBasketItem}
                    {block name='frontend_checkout_confirm_item'}
                        {include file='frontend/checkout/confirm_item.tpl'}
                    {/block}
                {/foreach}
            {/block}

            {block name='frontend_checkout_confirm_item_after'}{/block}

            {* Table footer *}
            {block name='frontend_checkout_confirm_confirm_footer'}
                {include file="frontend/checkout/confirm_footer.tpl"}
            {/block}
        {/block}

        {* Table actions *}
        {block name='frontend_checkout_confirm_confirm_table_actions'}
            <div class="table--actions actions--bottom">
                <div class="main--actions">
                    {if $sLaststock.hideBasket}
                        {block name='frontend_checkout_confirm_stockinfo'}
                            {s name="ConfirmErrorStock" assign="snippetConfirmErrorStock"}{/s}
                            {include file="frontend/_includes/messages.tpl" type="danger" content=$snippetConfirmErrorStock}
                        {/block}
                    {elseif ($invalidBillingAddress || $invalidShippingAddress)}
                        {block name='frontend_checkout_confirm_addressinfo'}
                            {s name="ConfirmErrorInvalidAddress" assign="snippetConfirmErrorInvalidAddress"}{/s}
                            {include file="frontend/_includes/messages.tpl" type="danger" content=$snippetConfirmErrorInvalidAddress}
                        {/block}
                    {else}
                        {block name='frontend_checkout_confirm_submit'}
                            <div class="text-right">
                                {* Submit order button *}
                                {if $sPayment.embediframe || $sPayment.action}
                                    <button type="submit" class="btn btn-primary btn-lg mbl confirm-form-submit" form="confirm--form" data-preloader-button="true">
                                        {s name='ConfirmDoPayment'}{/s}<i class="icon--arrow-right"></i>
                                    </button>
                                {else}
                                    <button type="submit" class="btn btn-primary btn-lg mbl confirm-form-submit" form="confirm--form" data-preloader-button="true">
                                        {s name='ConfirmActionSubmit'}{/s}<i class="icon--arrow-right"></i>
                                    </button>
                                {/if}
                            </div>
                        {/block}
                    {/if}
                </div>
            </div>
        {/block}
    {/block}
{/block}
