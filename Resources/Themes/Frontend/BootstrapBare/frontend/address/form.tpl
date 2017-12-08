{namespace name="frontend/address/index"}

{* Error messages *}
{block name="frontend_address_error_messages"}
    {include file="frontend/register/error_message.tpl" error_messages=$error_messages}
{/block}

{block name="frontend_address_form_input_prefix"}
    {$inputPrefix = "address"}
{/block}

{* Personal form *}
{block name="frontend_address_form_form_inner"}
    <div class="form-horizontal" data-prefix="{$inputPrefix}">
        {block name="frontend_address_form_fieldset_customer_type"}
            <div class="form-group address-customertype sw5-plugin{if $error_flags.customer_type} has-error{/if}">
                {block name="frontend_address_form_fieldset_customer_type_select"}
                    <label for="register_personal_customer_type" class="{$FormLabelSize} control-label">{s name='RegisterPersonalLabelType' namespace='frontend/register/personal_fieldset'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <select name="{$inputPrefix}[additional][customer_type]"
                                id="register_personal_customer_type"
                                required="required"
                                aria-required="true"
                                class="form-control is-required">

                            <option value="private"{if !$formData.additional.customer_type OR $formData.additional.customer_type eq "private"} selected="selected"{/if}>{s name='RegisterPersonalLabelPrivate' namespace='frontend/register/personal_fieldset'}{/s}</option>
                            <option value="business"{if $formData.company || $formData.additional.customer_type eq "business"} selected="selected"{/if}>{s name='RegisterPersonalLabelBusiness' namespace='frontend/register/personal_fieldset'}{/s}</option>
                            {block name="frontend_address_form_fieldset_customer_type_options"}{/block}
                        </select>
                    </div>
                {/block}
            </div>
        {/block}

        {block name="frontend_address_form_fieldset_company"}
            <div class="address-company collapse sw5-plugin">
                {* Company *}
                {block name='frontend_address_form_input_company'}
                    <div class="form-group address-companyname{if $error_flags.company} has-error{/if}">
                        <label for="register_billing_company" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderCompany' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing organization"
                                   name="{$inputPrefix}[company]"
                                   type="text"
                                   required="required"
                                   aria-required="true"
                                   id="register_billing_company"
                                   value="{$formData.company|escape}"
                                   class="form-control address-field-company is-required"/>
                        </div>
                    </div>
                {/block}

                {* Department *}
                {block name='frontend_address_form_input_department'}
                    <div class="form-group address-department{if $error_flags.department} has-error{/if}">
                        <label for="register_billing_department" class="{$FormLabelSize} control-label">{s name='RegisterLabelDepartment' namespace="frontend/register/billing_fieldset"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing organization-title"
                                   name="{$inputPrefix}[department]"
                                   type="text"
                                   id="register_billing_department"
                                   value="{$formData.department|escape}"
                                   class="form-control address-field-department"/>
                        </div>
                    </div>
                {/block}

                {* UST Id *}
                {block name='frontend_address_form_input_vatid'}
                    <div class="form-group address-vatid{if $error_flags.vatId} has-error{/if}">
                        <label for="register_billing_vatid" class="{$FormLabelSize} control-label">{s name='RegisterLabelTaxId' namespace="frontend/register/billing_fieldset"}{/s}{if {config name=vatcheckrequired}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>

                        <div class="{$FormInputSize}">
                            <input name="{$inputPrefix}[vatId]"
                                   type="text"
                                   id="register_billing_vatid"
                                   value="{$formData.vatId|escape}"
                                   {if {config name=vatcheckrequired}} required="required" aria-required="true"{/if}
                                   class="form-control address-field-vatid{if {config name=vatcheckrequired}} is-required{/if}"/>
                        </div>
                    </div>
                {/block}
            </div>
        {/block}

        {block name="frontend_address_form_fieldset_address"}
            {* Salutation *}
            {block name='frontend_address_form_input_salutation'}
                <div class="form-group address-salutation">
                    <label for="salutation" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderSalutation' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    {getSalutations variable="salutations"}
                    <div class="{$FormInputSize}">
                        <select name="{$inputPrefix}[salutation]"
                                id="salutation"
                                required="required"
                                aria-required="true"
                                class="form-control is-required{if $error_flags.salutation} has-error{/if}">

                            {foreach $salutations as $key => $label}
                                <option value="{$key}"{if $formData.salutation eq $key} selected="selected"{/if}>{$label}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            {/block}

            {* Title *}
            {block name='frontend_register_personal_fieldset_input_title'}
                {if {config name="displayprofiletitle"}}
                    <div class="form-group register-title{if $error_flags.title} has-error{/if}">
                        <label for="title" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderTitle' namespace="frontend/register/personal_fieldset"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-personal title"
                                   name="{$inputPrefix}[title]"
                                   type="text"
                                   id="title"
                                   value="{$formData.title|escape}"
                                   class="form-control address-field-title" />
                        </div>
                    </div>
                {/if}
            {/block}

            {* Firstname *}
            {block name='frontend_address_form_input_firstname'}
                <div class="form-group address-firstname{if $error_flags.firstname} has-error{/if}">
                    <label for="firstname2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderFirstname' namespace="frontend/register/shipping_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <input autocomplete="section-billing billing given-name"
                               name="{$inputPrefix}[firstname]"
                               type="text"
                               required="required"
                               aria-required="true"
                               id="firstname2"
                               value="{$formData.firstname|escape}"
                               class="form-control address-field-firstname is-required"/>
                    </div>
                </div>
            {/block}

            {* Lastname *}
            {block name='frontend_address_form_input_lastname'}
                <div class="form-group address-lastname{if $error_flags.lastname} has-error{/if}">
                    <label for="lastname2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderLastname' namespace="frontend/register/shipping_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <input autocomplete="section-billing billing family-name"
                               name="{$inputPrefix}[lastname]"
                               type="text"
                               required="required"
                               aria-required="true"
                               placeholder=""
                               id="lastname2"
                               value="{$formData.lastname|escape}"
                               class="form-control address-field-lastname is-required"/>
                    </div>
                </div>
            {/block}

            {* Street *}
            {block name='frontend_address_form_input_street'}
                <div class="form-group address-street{if $error_flags.street} has-error{/if}">
                    <label for="street" class="{$FormLabelSize} control-label">{s name='RegisterBillingPlaceholderStreet' namespace="frontend/register/billing_fieldset"}}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <input autocomplete="section-billing billing street-address"
                               name="{$inputPrefix}[street]"
                               type="text"
                               required="required"
                               aria-required="true"
                               id="street"
                               value="{$formData.street|escape}"
                               class="form-control address-field-street is-required"/>
                    </div>
                </div>
            {/block}

            {* Additional Address Line 1 *}
            {block name='frontend_address_form_input_addition_address_line1'}
                {if {config name=showAdditionAddressLine1}}
                    <div class="form-group address-additional-line1{if $error_flags.additionalAddressLine1 && {config name=requireAdditionAddressLine1}} has-error{/if}">
                        <label for="additionalAddressLine1" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine1'  namespace='frontend/register/shipping_fieldset'}{/s}{if {config name=requireAdditionAddressLine1}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing address-line2"
                                   name="{$inputPrefix}[additionalAddressLine1]"
                                   type="text"
                                   {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if}
                                   id="additionalAddressLine1"
                                   value="{$formData.additionalAddressLine1|escape}"
                                   class="form-control address--field{if {config name=requireAdditionAddressLine1}} is-required{/if}"/>
                        </div>
                    </div>
                {/if}
            {/block}

            {* Additional Address Line 2 *}
            {block name='frontend_address_form_input_addition_address_line2'}
                {if {config name=showAdditionAddressLine2}}
                    <div class="form-group address-additional-field2{if $error_flags.additionalAddressLine2 && {config name=requireAdditionAddressLine2}} has-error{/if}">
                        <label for="additionalAddressLine2" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine2'  namespace='frontend/register/shipping_fieldset'}{/s}{if {config name=requireAdditionAddressLine2}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing address-line3"
                                   name="{$inputPrefix}[additionalAddressLine2]"
                                   type="text"
                                   {if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if}
                                   id="additionalAddressLine2"
                                   value="{$formData.additionalAddressLine2|escape}"
                                   class="form-control {if {config name=requireAdditionAddressLine2}} is-required{/if}"/>
                        </div>
                    </div>
                {/if}
            {/block}

            {* Zip + City *}
            {block name='frontend_address_form_input_zip_and_city'}
              <div class="address-zip-city form-group{if $error_flags.zipcode || $error_flags.city} has-error{/if}">
                  <label for="zipcode" class="{$FormLabelSize} control-label">{s name='RegisterBillingPlaceholderZipcode' namespace='frontend/register/billing_fieldset'}{/s}{s name='RegisterBillingPlaceholderCityZipcodeDivider' namespace='frontend/register/billing_fieldset'}{/s}{s name='RegisterBillingPlaceholderCity' namespace='frontend/register/billing_fieldset'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                  <div class="{$FormInputSize}">
                      <div class="row compressed-cols">
                          <div class="col-4{if !{config name=showZipBeforeCity}} col-push-8{/if}">
                              <input autocomplete="section-billing billing postal-code"
                                     name="{$inputPrefix}[zipcode]"
                                     type="text"
                                     required="required"
                                     aria-required="true"
                                     id="zipcode"
                                     value="{$formData.zipcode|escape}"
                                     class="form-control address-field-zipcode is-required"/>
                          </div>
                          <div class="col-8{if !{config name=showZipBeforeCity}} col-pull-4{/if}">
                              <input autocomplete="section-billing billing address-level2"
                                     name="{$inputPrefix}[city]"
                                     type="text"
                                     required="required"
                                     aria-required="true"
                                     id="city"
                                     value="{$formData.city|escape}"
                                     size="25"
                                     class="form-control address-field-city is-required"/>
                          </div>
                      </div>
                  </div>
              </div>
            {/block}

            {* Country *}
            {block name='frontend_address_form_input_country'}
                <div class="form-group address-country{if $error_flags.country} has-error{/if}">
                    <label for="country" class="{$FormLabelSize} control-label">{s name='RegisterBillingPlaceholderCountry' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <select name="{$inputPrefix}[country]"
                                data-address-type="address"
                                id="country"
                                required="required"
                                aria-required="true"
                                class="form-control is-required">
                            {foreach $countryList as $country}
                                {block name="frontend_address_form_input_country_option"}
                                    <option value="{$country.id}" {if $country.id eq $formData.country.id}selected="selected"{/if} {if $country.states}stateSelector="country_{$country.id}_states"{/if}>
                                        {$country.countryname}
                                    </option>
                                {/block}
                            {/foreach}
                        </select>
                    </div>
                </div>
            {/block}

            {* Country state *}
            {block name='frontend_address_form_input_country_states'}
                <div class="country-area-state-selection">
                    {foreach $countryList as $country}
                        {block name="frontend_address_form_input_country_states_item"}
                            {if $country.states}
                                <div data-country-id="{$country.id}"
                                     data-address-type="address"
                                     class="form-group address-state-selection sw5-plugin {if $error_flags.state} has-error{/if}{if $country.id != $formData.country.id} d-none{/if}">

                                    <label for="country_{$country.id}_states" class="{$FormLabelSize} control-label">{s name='RegisterBillingLabelState' namespace="frontend/register/billing_fieldset"}{/s}{if $country.force_state_in_registration}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>

                                    <div class="{$FormInputSize}">
                                        <select {if $country.id != $formData.country.id}disabled="disabled"{/if}
                                                name="{$inputPrefix}[state]"{if $country.force_state_in_registration}
                                                required="required"
                                                id="country_{$country.id}_states"
                                                aria-required="true"{/if}
                                                class="form-control {if $country.force_state_in_registration}is-required{/if}">
                                            {foreach $country.states as $state}
                                                {block name="frontend_address_form_input_country_states_item_option"}
                                                    <option value="{$state.id}" {if $state.id eq $formData.state.id}selected="selected"{/if}>
                                                        {$state.name}
                                                    </option>
                                                {/block}
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            {/if}
                        {/block}
                    {/foreach}
                </div>
            {/block}


            {* Phone *}
            {block name='frontend_address_form_input_phone'}
                {if {config name=showPhoneNumberField}}
                    <div class="address-phone form-group{if $error_flags.phone && {config name=requirePhoneField}} has-error{/if}">
                        <label for="phone" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderPhone' namespace="frontend/register/personal_fieldset"}{/s}{if {config name=requirePhoneField}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-personal tel" name="{$inputPrefix}[phone]"
                                   type="tel"
                                   {if {config name=requirePhoneField}} required="required" aria-required="true"{/if}
                                   id="phone"
                                   value="{$formData.phone|escape}"
                                   class="form-control address-field-phone {if {config name=requirePhoneField}} is-required{/if}"/>
                        </div>
                    </div>
                {/if}
            {/block}

            {block name='frontend_address_form_input_set_default_shipping'}
                {if !$formData.id || $sUserData.additional.user.default_shipping_address_id != $formData.id}
                    <div class="form-group address-default-shipping">
                        <div class="{$FormInputSize} {$FormLabelOffset}">
                            <label for="set_default_shipping" class="checkbox-inline">
                                <input type="checkbox"
                                   id="set_default_shipping"
                                   name="{$inputPrefix}[additional][setDefaultShippingAddress]"
                                   value="1" />
                                {s name="AddressesSetAsDefaultShippingAction"}{/s}
                            </label>
                        </div>
                    </div>
                {/if}
            {/block}

            {block name='frontend_address_form_input_set_default_billing'}
                {if !$formData.id || $sUserData.additional.user.default_billing_address_id != $formData.id}
                    <div class="form-group address-default-billing">
                        <div class="{$FormInputSize} {$FormLabelOffset}">
                            <label for="set_default_billing" class="checkbox-inline">
                                <input type="checkbox"
                                   id="set_default_billing"
                                   name="{$inputPrefix}[additional][setDefaultBillingAddress]"
                                   value="1" />
                                {s name="AddressesSetAsDefaultBillingAction"}{/s}
                            </label>
                        </div>
                    </div>
                {/if}
            {/block}
        {/block}
    </div>
{/block}

{block name='frontend_address_required'}
    {* Required fields hint *}
    <div class="form-group required-info">
        <div class="{$FormInputSize} {$FormLabelOffset}">
            <p class="help-block">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
        </div>
    </div>
{/block}

{* Billing actions *}
{block name="frontend_address_action_buttons"}
    <div class="form-group">
        <div class="{$FormInputSize} {$FormLabelOffset}">
            {block name="frontend_address_action_button_send"}
                <input type="submit" value="{s name="AddressesActionButtonSend"}Adresse speichern{/s}" class="btn btn-primary mbl address-form-submit"/>
            {/block}
        </div>
    </div>
{/block}