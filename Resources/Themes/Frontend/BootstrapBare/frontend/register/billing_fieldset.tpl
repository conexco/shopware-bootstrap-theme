{block name='frontend_register_billing_fieldset'}
    {block name='frontend_register_billing_fieldset_company'}
        <fieldset id="register-business" class="collapse register-company sw5-plugin">
            {block name='frontend_register_billing_fieldset_headline_company'}
                <legend>{s name='RegisterHeaderCompany'}{/s}</legend>
            {/block}
            {block name='frontend_register_billing_fieldset_company_content'}
                {* Company *}
                {block name='frontend_register_billing_fieldset_input_company'}
                    <div class="form-group{if isset($error_flags.company)} has-error{/if}">
                        <label for="register_billing_company" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderCompany'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing organization"
                                   name="register[billing][company]"
                                   type="text"
                                   id="register_billing_company"
                                   value="{$form_data.company|escape}"
                                   class="form-control is-required"
                                   required="required" aria-required="true" />
                        </div>
                    </div>
                {/block}

                {* Department *}
                {block name='frontend_register_billing_fieldset_input_department'}
                    <div class="form-group">
                        <label for="register_billing_department" class="{$FormLabelSize} control-label">{s name='RegisterLabelDepartment'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing organization-title"
                                   name="register[billing][department]"
                                   type="text"
                                   id="register_billing_department"
                                   value="{$form_data.department|escape}"
                                   class="form-control"/>
                        </div>
                    </div>
                {/block}

                {* VAT Id *}
                {block name='frontend_register_billing_fieldset_input_vatId'}
                    <div class="form-group{if isset($error_flags.vatId)} has-error{/if}">
                        <label for="register_billing_ustid" class="{$FormLabelSize} control-label">{s name='RegisterLabelTaxId'}{/s}{if {config name=vatcheckrequired}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                        <div class="{$FormInputSize}">
                            <input name="register[billing][vatId]"
                                   type="text"
                                   id="register_billing_vatid"
                                   value="{$form_data.vatId|escape}"
                                   {if {config name=vatcheckrequired}} required="required" aria-required="true"{/if}
                                   class="form-control{if {config name=vatcheckrequired}} is-required{/if}"/>
                        </div>
                    </div>
                {/block}
            {/block}
        </fieldset>
    {/block}
    {block name='frontend_register_billing_fieldset_default'}
        <fieldset>
            {block name='frontend_register_billing_fieldset_headline'}
                <legend>{s name='RegisterBillingHeadline'}{/s}</legend>
            {/block}
            {block name='frontend_register_billing_fieldset_content'}
                {* Street *}
                {block name='frontend_register_billing_fieldset_input_street'}
                    <div class="form-group{if isset($error_flags.street) || isset($error_flags.streetnumber)} has-error{/if}">
                        <label for="street" class="{$FormLabelSize} control-label">{s name='RegisterBillingPlaceholderStreet'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-billing billing street-address"
                                   name="register[billing][street]"
                                   type="text"
                                   id="street"
                                   value="{$form_data.street|escape}"
                                   class="form-control is-required"
                                   required="required" aria-required="true" />
                        </div>
                    </div>
                {/block}

                {* Additional Address Line 1 *}
                {block name='frontend_register_billing_fieldset_input_addition_address_line1'}
                    {if {config name=showAdditionAddressLine1}}
                        <div class="form-group{if isset($error_flags.additional_address_line1) && {config name=requireAdditionAddressLine1}} has-error{/if}">
                            <label for="street" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine1'}{/s}</label>

                            <div class="{$FormInputSize}">
                                <input autocomplete="section-billing billing address-line2"
                                       name="register[billing][additional_address_line1]"
                                       type="text"
                                       id="additionalAddressLine1"
                                       value="{$form_data.additional_address_line1|escape}"
                                       class="form-control col-lg-5{if {config name=requireAdditionAddressLine1}} is-required{/if}"
                                       {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                            </div>
                        </div>
                    {/if}
                {/block}

                {* Additional Address Line 2 *}
                {block name='frontend_register_billing_fieldset_input_addition_address_line2'}
                    {if {config name=showAdditionAddressLine2}}
                        <div class="form-group{if isset($error_flags.additional_address_line2) && {config name=requireAdditionAddressLine2}} has-error{/if}">
                            <label for="street" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine2'}{/s}</label>

                            <div class="{$FormInputSize}">
                                <input autocomplete="section-billing billing address-line3"
                                       name="register[billing][additional_address_line2]"
                                       type="text" id="additionalAddressLine2"
                                       value="{$form_data.additional_address_line2|escape}"
                                       class="form-control col-lg-5{if {config name=requireAdditionAddressLine1}} is-required{/if}"
                                       {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                            </div>
                        </div>
                    {/if}
                {/block}

                {* Zip + City *}
                {block name='frontend_register_billing_fieldset_input_zip_and_city'}
                    <div class="form-group{if isset($error_flags.zipcode) || isset($error_flags.city)} has-error{/if}">
                        <label for="zipcode" class="{$FormLabelSize} control-label">
                            {if !{config name=showZipBeforeCity}}
                                {s name='RegisterBillingPlaceholderCity'}{/s}{s name='RegisterBillingPlaceholderCityZipcodeDivider'} / {/s}{s name='RegisterBillingPlaceholderZipcode'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                            {else}
                                {s name='RegisterBillingPlaceholderZipcode'}{/s}{s name='RegisterBillingPlaceholderCityZipcodeDivider'}{/s}{s name='RegisterBillingPlaceholderCity'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                            {/if}
                        </label>

                        <div class="{$FormInputSize}">
                            <div class="row compressed-cols">
                                <div class="col-xs-4{if !{config name=showZipBeforeCity}} col-xs-push-8{/if}">
                                    <input autocomplete="section-billing billing postal-code"
                                           name="register[billing][zipcode]"
                                           type="text"
                                           id="zipcode"
                                           value="{$form_data.zipcode|escape}"
                                           class="form-control is-required"
                                           required="required" aria-required="true" />
                                </div>
                                <div class="col-xs-8{if !{config name=showZipBeforeCity}} col-xs-pull-4{/if}">
                                    <input autocomplete="section-billing billing address-level2"
                                           name="register[billing][city]"
                                           type="text"
                                           id="city"
                                           value="{$form_data.city|escape}"
                                           class="form-control is-required"
                                           required="required" aria-required="true" />
                                </div>
                            </div>
                        </div>
                    </div>
                {/block}

                {* Country *}
                {block name='frontend_register_billing_fieldset_input_country'}
                    <div class="form-group{if isset($error_flags.country)} has-error{/if}">
                        <label for="country" class="{$FormLabelSize} control-label">{s name='RegisterBillingPlaceholderCountry'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <select name="register[billing][country]"
                                data-address-type="billing"
                                id="country"
                                required="required"
                                aria-required="true"
                                class="form-control is-required select-country sw5-plugin select--country is--required{if isset($error_flags.country)} has--error{/if}">

                            <option disabled="disabled"
                                    value=""
                                    selected="selected">
                                {s name='RegisterBillingPlaceholderCountry'}{/s}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}
                            </option>

                            {foreach $country_list as $country}
                                <option value="{$country.id}" {if $country.id eq $form_data.country}selected="selected"{/if} {if $country.states}stateSelector="country_{$country.id}_states"{/if}>
                                    {$country.countryname}
                                </option>
                            {/foreach}
                        </select>
                        </div>
                    </div>
                {/block}

                {* Country state *}
                {block name='frontend_register_billing_fieldset_input_country_states'}
                    <div class="country-area-state-selection">
                        {foreach $country_list as $country}
                            {if $country.states}
                                <div data-country-id="{$country.id}" data-address-type="billing" class="form-group selection{if isset($error_flags.state)} has-error{/if}{if $country.id != $form_data.country} hidden{/if} register-state-selection sw5-plugin">
                                    <label for="country_{$country.id}_states" class="{$FormLabelSize} control-label">{s name='RegisterBillingLabelState'}Bundesstaat{/s}{if $country.force_state_in_registration}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                                    <div class="{$FormInputSize}">
                                        <select {if $country.id != $form_data.country}disabled="disabled"{/if} name="register[billing][country_state_{$country.id}]"{if $country.force_state_in_registration} required="required" aria-required="true"{/if} class="form-control is-required select--state {if $country.force_state_in_registration}is--required{/if}{if isset($error_flags.state)} has--error{/if}">
                                            <option value="" selected="selected"{if $country.force_state_in_registration} disabled="disabled"{/if}>{s name='RegisterBillingLabelState'}{/s}{if $country.force_state_in_registration}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</option>
                                            {assign var="stateID" value="country_state_`$country.id`"}
                                            {foreach $country.states as $state}
                                                <option value="{$state.id}" {if $state.id eq $form_data['state']}selected="selected"{/if}>
                                                    {$state.name}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                {/block}

                {* Alternative *}
                {block name='frontend_register_billing_fieldset_different_shipping'}
                    {if !$update}
                        <div class="form-group register-alt-shipping sw5-plugin">
                            <div class="{$FormInputSize} {$FormLabelOffset}">
                                <label for="register_billing_shippingAddress" class="checkbox-inline">
                                    <input name="register[billing][shippingAddress]" type="checkbox" id="register_billing_shippingAddress" value="1" {if $form_data.shippingAddress}checked="checked"{/if} />{s name='RegisterBillingLabelShipping'}{/s}
                                </label>
                            </div>
                        </div>
                    {/if}
                {/block}
            {/block}
        </fieldset>
    {/block}
{/block}
