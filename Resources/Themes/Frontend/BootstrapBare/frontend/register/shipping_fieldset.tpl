{block name='frontend_register_shipping_fieldset'}
    <div id="shippingAddress" class="collapse register-shipping sw5-plugin">
        <fieldset>
            {block name='frontend_register_shipping_fieldset_headline'}
                <legend>{s name='RegisterShippingHeadline'}{/s}</legend>
            {/block}
            {block name='frontend_register_shipping_fieldset_content'}
                {*! Salutation *}
                {block name='frontend_register_shipping_fieldset_input_salutation'}
                    {getSalutations variable="salutations"}

                    <div class="form-group{if isset($error_flags.salutation)} has-error{/if}">
                        <label for="salutation2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderSalutation'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <select name="register[shipping][salutation]"
                                    id="salutation2"
                                    class="form-control is-required"
                                    required="required" aria-required="true">

                                {foreach $salutations as $key => $label}
                                    <option value="{$key}"{if $form_data.salutation eq $key} selected="selected"{/if}>{$label}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                {/block}

                {*! Company *}
                {block name="frontend_register_shipping_fieldset_input_company"}
                    <div class="form-group{if isset($error_flags.company)} has-error{/if}">
                        <label for="company2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderCompany'}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-shipping shipping organization"
                                   name="register[shipping][company]"
                                   type="text"
                                   id="company2"
                                   value="{$form_data.company|escape}"
                                   class="form-control"/>
                        </div>
                    </div>
                {/block}

                {*! Department *}
                {block name='frontend_register_shipping_fieldset_input_department'}
                    <div class="form-group">
                        <label for="department2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderDepartment'}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-shipping shipping organization-title"
                                   name="register[shipping][department]"
                                   type="text"
                                   id="department2"
                                   value="{$form_data.department|escape}"
                                   class="form-control"/>
                        </div>
                    </div>
                {/block}

                {*! Firstname *}
                {block name='frontend_register_shipping_fieldset_input_firstname'}
                    <div class="form-group{if isset($error_flags.firstname)} has-error{/if}">
                        <label for="firstname2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderFirstname'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-shipping shipping given-name"
                                   name="register[shipping][firstname]"
                                   type="text"
                                   id="firstname2"
                                   value="{$form_data.firstname|escape}"
                                   class="form-control is-required"
                                   required="required" aria-required="true" />
                        </div>
                    </div>
                {/block}

                {*! Lastname *}
                {block name='frontend_register_shipping_fieldset_input_lastname'}
                    <div class="form-group{if isset($error_flags.lastname)} has-error{/if}">
                        <label for="lastname2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderLastname'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-shipping shipping family-name"
                                   name="register[shipping][lastname]"
                                   type="text"
                                   id="lastname2"
                                   value="{$form_data.lastname|escape}"
                                   class="form-control is-required"
                                   required="required" aria-required="true" />
                        </div>
                    </div>
                {/block}

                {*! Street *}
                {block name='frontend_register_shipping_fieldset_input_street'}
                    <div class="form-group{if isset($error_flags.street) || isset($error_flags.streetnumber)} has-error{/if}">
                        <label for="street2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderStreet'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <div class="{$FormInputSize}">
                            <input autocomplete="section-shipping shipping street-address"
                                   name="register[shipping][street]"
                                   type="text"
                                   id="street2"
                                   value="{$form_data.street|escape}"
                                   class="form-control is-required"
                                   required="required" aria-required="true" />
                        </div>
                    </div>
                {/block}

                {* Additional Address Line 1 *}
                {block name='frontend_register_shipping_fieldset_input_addition_address_line1'}
                    {if {config name=showAdditionAddressLine1}}
                        <div class="form-group{if isset($error_flags.additional_address_line1) && {config name=requireAdditionAddressLine1}} has-error{/if}">
                            <label for="lastname2" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine1'}{/s}</label>

                            <div class="{$FormInputSize}">
                                <input autocomplete="section-shipping shipping address-line2"
                                       name="register[shipping][additional_address_line1]"
                                       type="text"
                                       id="additionalAddressLine21"
                                       value="{$form_data.additional_address_line1|escape}"
                                       class="form-control{if {config name=requireAdditionAddressLine1}} is-required{/if}"
                                       {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                            </div>
                        </div>
                    {/if}
                {/block}

                {* Additional Address Line 2 *}
                {block name='frontend_register_shipping_fieldset_input_addition_address_line2'}
                    {if {config name=showAdditionAddressLine2}}
                        <div class="form-group{if isset($error_flags.additional_address_line2) && {config name=requireAdditionAddressLine2}} has-error{/if}">
                            <label for="lastname2" class="{$FormLabelSize} control-label">{s name='RegisterLabelAdditionalAddressLine2'}{/s}</label>

                            <div class="{$FormInputSize}">
                                <input autocomplete="section-shipping shipping address-line3"
                                       name="register[shipping][additional_address_line2]"
                                       type="text"
                                       id="additionalAddressLine22"
                                       value="{$form_data.additional_address_line2|escape}"
                                       class="form-control{if {config name=requireAdditionAddressLine2}} is-required{/if}"
                                       {if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if} />
                            </div>
                        </div>
                    {/if}
                {/block}

                {*! Zip + City *}
                {block name='frontend_register_shipping_fieldset_input_zip_and_city'}
                    <div class="form-group{if isset($error_flags.zipcode) || isset($error_flags.city)} has-error{/if}">
                        <label for="zipcode2" class="{$FormLabelSize} control-label">
                          {if !{config name=showZipBeforeCity}}
                              {s name='RegisterShippingPlaceholderCity'}{/s}{s name='RegisterShippingPlaceholderCityZipcodeDivider'} / {/s}{s name='RegisterShippingPlaceholderZipcode'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                          {else}
                              {s name='RegisterShippingPlaceholderZipcode'}{/s}{s name='RegisterShippingPlaceholderCityZipcodeDivider'}{/s}{s name='RegisterShippingPlaceholderCity'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                          {/if}
                        </label>

                        <div class="{$FormInputSize}">
                            <div class="row compressed-cols">
                                <div class="col-xs-4{if !{config name=showZipBeforeCity}} col-xs-push-8{/if}">
                                    <input autocomplete="section-shipping shipping postal-code"
                                           name="register[shipping][zipcode]"
                                           type="text"
                                           id="zipcode2"
                                           value="{$form_data.zipcode|escape}"
                                           class="form-control is-required"
                                           required="required" aria-required="true" />
                                </div>
                                <div class="col-xs-8{if !{config name=showZipBeforeCity}} col-xs-pull-4{/if}">
                                    <input autocomplete="section-shipping shipping address-level2"
                                           name="register[shipping][city]"
                                           type="text"
                                           id="city2"
                                           value="{$form_data.city|escape}"
                                           size="25"
                                           class="form-control is-required"
                                           required="required" aria-required="true" />
                                </div>
                            </div>
                        </div>
                    </div>
                {/block}

                {* Country and state fields *}
                {if {config name=CountryShipping}}
                    {block name='frontend_register_shipping_fieldset_input_country'}
                        <div class="form-group{if isset($error_flags.country)} has-error{/if}">
                            <label for="country2" class="{$FormLabelSize} control-label">{s name='RegisterShippingPlaceholderCountry'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                            <div class="{$FormInputSize}">
                                <select name="register[shipping][country]"
                                        id="country2"
                                        class="form-control is-required select-country sw5-plugin"
                                        required="required" aria-required="true">

                                    <option value="" selected="selected">{s name='RegisterShippingPlaceholderCountry'}{/s}</option>
                                    {foreach from=$country_list item=country}
                                        <option value="{$country.id}"{if $country.id eq $form_data.country} selected="selected"{/if}>
                                            {$country.countryname}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    {/block}

                    {*! Country state *}
                    {block name='frontend_register_shipping_fieldset_input_country_states'}
                        <div class="country-area-state-selection2">
                            {foreach $country_list as $country}
                                {if $country.states}
                                    <div class="form-group selection{if isset($error_flags.state)} has-error{/if}{if $country.id != $form_data.country} hidden{/if} register-state-selection sw5-plugin">
                                        <label for="country_{$country.id}_states" class="{$FormLabelSize} control-label">{s name='RegisterShippingLabelState'}Bundesstaat{/s}{if $country.force_state_in_registration}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                                        <div class="{$FormInputSize}">
                                            <select {if $country.id != $form_data.country}disabled="disabled"{/if} name="register[shipping][country_shipping_state_{$country.id}]" id="country_{$country.id}_states" class="form-control{if $country.force_state_in_registration} is-required{/if}"{if $country.force_state_in_registration} required="required" aria-required="true"{/if}>
                                                <option value="" selected="selected">{s name='RegisterShippingLabelSelect'}{/s}</option>
                                                {assign var="stateID" value="country_shipping_state_`$country.id`"}
                                                {foreach from=$country.states item=state}
                                                    <option value="{$state.id}" {if $state.id eq $form_data[$stateID]}selected="selected"{/if}>{$state.name}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/block}
                {/if}
            {/block}
        </fieldset>
    </div>
{/block}