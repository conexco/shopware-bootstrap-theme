{block name='frontend_register_billing_fieldset'}
    {block name='frontend_register_billing_fieldset_company'}
        <div id="register-business" class="collapse register-company sw5-plugin">
            {block name='frontend_register_billing_fieldset_headline_company'}
                <h2 class="h4 mt-5">
                    {s name='RegisterHeaderCompany'}{/s}
                </h2>
            {/block}

            {block name='frontend_register_billing_fieldset_company_content'}
                {* Company *}
                {block name='frontend_register_billing_fieldset_input_company'}
                    <div class="form-group">
                        <label for="register_billing_company" 
                               class="col-form-label">
                                {s name='RegisterPlaceholderCompany'}{/s}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                          <input autocomplete="section-billing billing organization"
                                 name="register[billing][company]"
                                 type="text"
                                 id="register_billing_company"
                                 value="{$form_data.company|escape}"
                                 class="form-control is-required
                                 {if isset($error_flags.company)} is-invalid{/if}"
                                 required="required" aria-required="true" />
                    </div>
                {/block}

                {* Department *}
                {block name='frontend_register_billing_fieldset_input_department'}
                    <div class="form-group">
                        <label for="register_billing_department" 
                               class="col-form-label">
                                {s name='RegisterLabelDepartment'}{/s}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                        <input autocomplete="section-billing billing organization-title"
                               name="register[billing][department]"
                               type="text"
                               id="register_billing_department"
                               value="{$form_data.department|escape}"
                               class="form-control"/>
                    </div>
                {/block}

                {* VAT Id *}
                {block name='frontend_register_billing_fieldset_input_vatId'}
                    <div class="form-group">
                        <label for="register_billing_ustid" 
                               class="col-form-label">
                                {s name='RegisterLabelTaxId'}{/s}
                                {if {config name=vatcheckrequired}}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                        <input name="register[billing][vatId]"
                               type="text"
                               id="register_billing_vatid"
                               value="{$form_data.vatId|escape}"
                               {if {config name=vatcheckrequired}} required="required" aria-required="true"{/if}
                               class="form-control{if {config name=vatcheckrequired}} is-required{/if}
                               {if isset($error_flags.vatId)} is-invalid{/if}"/>
                    </div>
                {/block}
            {/block}
        </div>
    {/block}
    {block name='frontend_register_billing_fieldset_default'}
        {block name='frontend_register_billing_fieldset_headline'}
            <h2 class="h4 mt-5">
              {s name='RegisterBillingHeadline'}{/s}
            </h2>
        {/block}

        {block name='frontend_register_billing_fieldset_content'}
            {* Street *}
            {block name='frontend_register_billing_fieldset_input_street'}
                <div class="form-group">
                    <label for="street" 
                           class="col-form-label">
                            {s name='RegisterBillingPlaceholderStreet'}{/s}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                    <input autocomplete="section-billing billing street-address"
                           name="register[billing][street]"
                           type="text"
                           id="street"
                           value="{$form_data.street|escape}"
                           class="form-control is-required
                           {if isset($error_flags.street) || isset($error_flags.streetnumber)} is-invalid{/if}"
                           required="required" aria-required="true" />
                </div>
            {/block}

            {* Additional Address Line 1 *}
            {block name='frontend_register_billing_fieldset_input_addition_address_line1'}
                {if {config name=showAdditionAddressLine1}}
                    <div class="form-group">
                        <label for="street" 
                               class="col-form-label">
                                {s name='RegisterLabelAdditionalAddressLine1'}{/s}</label>

                        <input autocomplete="section-billing billing address-line2"
                               name="register[billing][additional_address_line1]"
                               type="text"
                               id="additionalAddressLine1"
                               value="{$form_data.additional_address_line1|escape}"
                               class="form-control{if {config name=requireAdditionAddressLine1}} is-required{/if}
                               {if isset($error_flags.additional_address_line1) && {config name=requireAdditionAddressLine1}} is-invalid{/if}"
                               {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                    </div>
                {/if}
            {/block}

            {* Additional Address Line 2 *}
            {block name='frontend_register_billing_fieldset_input_addition_address_line2'}
                {if {config name=showAdditionAddressLine2}}
                    <div class="form-group">
                        <label for="street"
                               class="col-form-label">
                                {s name='RegisterLabelAdditionalAddressLine2'}{/s}</label>

                        <input autocomplete="section-billing billing address-line3"
                               name="register[billing][additional_address_line2]"
                               type="text" id="additionalAddressLine2"
                               value="{$form_data.additional_address_line2|escape}"
                               class="form-control{if {config name=requireAdditionAddressLine1}} is-required{/if}
                               {if isset($error_flags.additional_address_line2) && {config name=requireAdditionAddressLine2}} is-invalid{/if}"
                               {if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if} />
                    </div>
                {/if}
            {/block}

            {* Zip + City *}
            {block name='frontend_register_billing_fieldset_input_zip_and_city'}
                <div class="form-row">
                    <div class="form-group col-4{if !{config name=showZipBeforeCity}} order-2{/if}">
                        <label for="zipcode" class="col-form-label">
                            {s name='RegisterBillingPlaceholderZipcode'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                        </label>

                        <input autocomplete="section-billing billing postal-code"
                               name="register[billing][zipcode]"
                               type="text"
                               id="zipcode"
                               value="{$form_data.zipcode|escape}"
                               class="form-control is-required
                               {if isset($error_flags.zipcode)} is-invalid{/if}"
                               required="required" aria-required="true" />
                    </div>
                    <div class="form-group col-8{if !{config name=showZipBeforeCity}} order-1{/if}">
                        <label for="city" class="col-form-label">
                            {s name='RegisterBillingPlaceholderCity'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}
                        </label>

                        <input autocomplete="section-billing billing address-level2"
                               name="register[billing][city]"
                               type="text"
                               id="city"
                               value="{$form_data.city|escape}"
                               class="form-control is-required
                               {if isset($error_flags.city)} is-invalid{/if}"
                               required="required" aria-required="true" />
                    </div>
                </div>
            {/block}

            {* Country *}
            {block name='frontend_register_billing_fieldset_input_country'}
              <div class="form-row">
                  <div class="form-group col-md-12 col-lg-6">
                      <label for="country" 
                             class="col-form-label">
                              {s name='RegisterBillingPlaceholderCountry'}{/s}
                              {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                      <select name="register[billing][country]"
                              id="country"
                              class="form-control is-required select-country sw5-plugin
                              {if isset($error_flags.country)} is-invalid{/if}"
                              required="required" aria-required="true">

                          <option value="" selected="selected">{s name='RegisterBillingPlaceholderCountry'}{/s}</option>
                          {foreach from=$country_list item=country}
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
                <div class="form-row country-area-state-selection">
                    {foreach $country_list as $country}
                        {if $country.states}
                            <div data-country-id="{$country.id}" data-address-type="billing" class="form-group selection col-md-12 col-lg-6
                            {if $country.id != $form_data.country} d-none{/if} register-state-selection sw5-plugin">
                                <label for="country_{$country.id}_states" 
                                       class="col-form-label">
                                        {s name='RegisterBillingLabelState'}Bundesstaat{/s}
                                        {if $country.force_state_in_registration}
                                        {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                                <select {if $country.id != $form_data.country}disabled="disabled"{/if} name="register[billing][country_state_{$country.id}]" id="country_{$country.id}_states" 
                                class="form-control{if $country.force_state_in_registration} is-required{/if}
                                {if isset($error_flags.state)} is-invalid{/if}"
                                {if $country.force_state_in_registration} required="required" aria-required="true"{/if}>
                                    <option value="" selected="selected">{s name='RegisterBillingLabelSelect'}{/s}</option>
                                    {assign var="stateID" value="country_state_`$country.id`"}
                                    {foreach from=$country.states item=state}
                                        <option value="{$state.id}" {if $state.id eq $form_data[$stateID]}selected="selected"{/if}>{$state.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/block}

            {* Alternative *}
            {block name='frontend_register_billing_fieldset_different_shipping'}
                {if !$update}
                    <div class="form-group register-alt-shipping sw5-plugin">
                        <div class="form-check">
                          <input name="register[billing][shippingAddress]" 
                                 type="checkbox" 
                                 id="register_billing_shippingAddress"
                                 class="form-check-input" 
                                 value="1" 
                                 {if $form_data.shippingAddress}checked="checked"{/if} />
                                 
                          <label for="register_billing_shippingAddress" 
                                 class="form-check-label">
                              {s name='RegisterBillingLabelShipping'}{/s}
                          </label>
                        </div>
                    </div>
                {/if}
            {/block}
        {/block}
    {/block}
{/block}