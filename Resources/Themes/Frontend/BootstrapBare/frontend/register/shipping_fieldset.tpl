{block name='frontend_register_shipping_fieldset'}
    <div id="shippingAddress" class="collapse register-shipping sw5-plugin">
      {block name='frontend_register_shipping_fieldset_headline'}
      <div class="card-title">
          <h2 class="h4">{s name='RegisterShippingHeadline'}{/s}</h2>
      </div>
      {/block}
      {block name='frontend_register_shipping_fieldset_content'}
          {*! Salutation *}
          {block name='frontend_register_shipping_fieldset_input_salutation'}
            <div class="form-row">
                {getSalutations variable="salutations"}

                <div class="form-group col-md-12 col-lg-6">
                    <label for="salutation2" 
                           class="col-form-label">
                            {s name='RegisterShippingPlaceholderSalutation'}{/s}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <select name="register[shipping][salutation]"
                            id="salutation2"
                            class="form-control is-required
                            {if isset($error_flags.salutation)} is-invalid{/if}"
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
              <div class="form-group">
                  <label for="company2" 
                         class="col-form-label">
                          {s name='RegisterShippingPlaceholderCompany'}{/s}</label>

                  <input autocomplete="section-shipping shipping organization"
                         name="register[shipping][company]"
                         type="text"
                         id="company2"
                         value="{$form_data.company|escape}"
                         class="form-control
                         {if isset($error_flags.company)} is-invalid{/if}"/>
              </div>
          {/block}

          {*! Department *}
          {block name='frontend_register_shipping_fieldset_input_department'}
              <div class="form-group">
                  <label for="department2" 
                         class="col-form-label">
                          {s name='RegisterShippingPlaceholderDepartment'}{/s}</label>

                  <input autocomplete="section-shipping shipping organization-title"
                         name="register[shipping][department]"
                         type="text"
                         id="department2"
                         value="{$form_data.department|escape}"
                         class="form-control"/>
              </div>
          {/block}

          {*! Firstname *}
          {block name='frontend_register_shipping_fieldset_input_firstname'}
              <div class="form-group">
                  <label for="firstname2" 
                         class="col-form-label">
                          {s name='RegisterShippingPlaceholderFirstname'}{/s}
                          {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                      <input autocomplete="section-shipping shipping given-name"
                             name="register[shipping][firstname]"
                             type="text"
                             id="firstname2"
                             value="{$form_data.firstname|escape}"
                             class="form-control is-required
                             {if isset($error_flags.firstname)} is-invalid{/if}"
                             required="required" aria-required="true" />
              </div>
          {/block}

          {*! Lastname *}
          {block name='frontend_register_shipping_fieldset_input_lastname'}
              <div class="form-group">
                  <label for="lastname2" 
                         class="col-form-label">
                          {s name='RegisterShippingPlaceholderLastname'}{/s}
                          {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                  <input autocomplete="section-shipping shipping family-name"
                         name="register[shipping][lastname]"
                         type="text"
                         id="lastname2"
                         value="{$form_data.lastname|escape}"
                         class="form-control is-required
                         {if isset($error_flags.lastname)} is-invalid{/if}"
                         required="required" aria-required="true" />
              </div>
          {/block}

          {*! Street *}
          {block name='frontend_register_shipping_fieldset_input_street'}
              <div class="form-group">
                  <label for="street2" 
                         class="col-form-label">
                          {s name='RegisterShippingPlaceholderStreet'}{/s}
                          {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                  <input autocomplete="section-shipping shipping street-address"
                         name="register[shipping][street]"
                         type="text"
                         id="street2"
                         value="{$form_data.street|escape}"
                         class="form-control is-required
                         {if isset($error_flags.street) || isset($error_flags.streetnumber)} is-invalid{/if}"
                         required="required" aria-required="true" />
              </div>
          {/block}

          {* Additional Address Line 1 *}
          {block name='frontend_register_shipping_fieldset_input_addition_address_line1'}
              {if {config name=showAdditionAddressLine1}}
                  <div class="form-group">
                      <label for="lastname2" 
                             class="col-form-label">
                              {s name='RegisterLabelAdditionalAddressLine1'}{/s}</label>

                      <input autocomplete="section-shipping shipping address-line2"
                             name="register[shipping][additional_address_line1]"
                             type="text"
                             id="additionalAddressLine21"
                             value="{$form_data.additional_address_line1|escape}"
                             class="form-control{if {config name=requireAdditionAddressLine1}} is-required{/if}
                             {if isset($error_flags.additional_address_line1) && {config name=requireAdditionAddressLine1}} is-invalid{/if}"
                             {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                  </div>
              {/if}
          {/block}

          {* Additional Address Line 2 *}
          {block name='frontend_register_shipping_fieldset_input_addition_address_line2'}
              {if {config name=showAdditionAddressLine2}}
                  <div class="form-group">
                      <label for="lastname2" 
                             class="col-form-label">
                              {s name='RegisterLabelAdditionalAddressLine2'}{/s}</label>

                      <input autocomplete="section-shipping shipping address-line3"
                             name="register[shipping][additional_address_line2]"
                             type="text"
                             id="additionalAddressLine22"
                             value="{$form_data.additional_address_line2|escape}"
                             class="form-control{if {config name=requireAdditionAddressLine2}} is-required{/if}
                             {if isset($error_flags.additional_address_line2) && {config name=requireAdditionAddressLine2}} is-invalid{/if}"
                             {if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if} />
                  </div>
              {/if}
          {/block}

          {*! Zip + City *}
          {block name='frontend_register_shipping_fieldset_input_zip_and_city'}
            <div class="form-row">
                <div class="form-group col-4">
                    <label for="zipcode2" class="col-form-label">
                        {s name='RegisterShippingPlaceholderZipcode'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                    </label>

                    <input autocomplete="section-shipping shipping postal-code"
                           name="register[shipping][zipcode]"
                           type="text"
                           id="zipcode2"
                           value="{$form_data.zipcode|escape}"
                           class="form-control is-required
                           {if !{config name=showZipBeforeCity}} order-2{/if}{if isset($error_flags.zipcode)} is-invalid{/if}"
                           required="required" aria-required="true" />
                </div>
                <div class="form-group col-8{if !{config name=showZipBeforeCity}} order-1{/if}">
                    <label for="city2" class="col-form-label">
                        {s name='RegisterShippingPlaceholderCity'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                    </label>

                    <input autocomplete="section-shipping shipping address-level2"
                           name="register[shipping][city]"
                           type="text"
                           id="city2"
                           value="{$form_data.city|escape}"
                           class="form-control is-required
                           {if isset($error_flags.city)} is-invalid{/if}"
                           required="required" aria-required="true" />
                </div>
            </div>
          {/block}

          {* Country and state fields *}
          {block name='frontend_register_shipping_fieldset_input_country'}
            <div class="form-row">
                <div class="form-group col-md-12 col-lg-6">
                    <label for="country2" 
                           class="col-form-label">
                            {s name='RegisterShippingPlaceholderCountry'}{/s}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <select name="register[shipping][country]"
                            id="country2"
                            class="form-control is-required select-country sw5-plugin
                            {if isset($error_flags.country)} is-invalid{/if}"
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
              <div class="form-row country-area-state-selection2">
                  {foreach $country_list as $country}
                      {if $country.states}
                          <div class="form-group selection col-md-12 col-lg-6{if $country.id != $form_data.country} d-none{/if} register-state-selection sw5-plugin">
                              <label for="country_{$country.id}_states" 
                                     class="col-form-label">
                                      {s name='RegisterShippingLabelState'}Bundesstaat{/s}
                                      {if $country.force_state_in_registration}
                                      {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                              <select {if $country.id != $form_data.country}disabled="disabled"{/if} name="register[shipping][country_shipping_state_{$country.id}]" id="country_{$country.id}_states" class="form-control{if $country.force_state_in_registration} is-required{/if}
                              {if isset($error_flags.state)} is-invalid{/if}"
                              {if $country.force_state_in_registration} required="required" aria-required="true"{/if}>
                                  <option value="" selected="selected">{s name='RegisterShippingLabelSelect'}{/s}</option>
                                  {assign var="stateID" value="country_shipping_state_`$country.id`"}
                                  {foreach from=$country.states item=state}
                                      <option value="{$state.id}" {if $state.id eq $form_data[$stateID]}selected="selected"{/if}>{$state.name}</option>
                                  {/foreach}
                              </select>
                          </div>
                      {/if}
                  {/foreach}
              </div>
          {/block}
      {/block}
    </div>
{/block}