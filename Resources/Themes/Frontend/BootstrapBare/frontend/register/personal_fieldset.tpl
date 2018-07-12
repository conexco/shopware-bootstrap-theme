{block name='frontend_register_personal_fieldset'}
    {block name='frontend_register_personal_fieldset_headline'}
        <div class="card-title">
            <h2 class="h4">
                {if isset($fieldset_title) && !empty($fieldset_title)}
                    {$fieldset_title}
                {else}
                    {s name='RegisterPersonalMarketingHeadline'}{/s}
                {/if}
            </h2>
        </div>
    {/block}

    {block name='frontend_register_personal_fieldset_content'}
        {* Customer type *}
        {block name='frontend_register_personal_fieldset_customer_type'}
          <div class="form-row">
              {if $form_data.sValidation}
                  <input type="hidden" name="register[personal][sValidation]" value="{$form_data.sValidation|escape}"/>
              {else}
                  <div class="form-group col-md-12 col-lg-6 register-customertype sw5-plugin">
                      {if {config name=showCompanySelectField}}
                          <label for="register_personal_customer_type" 
                                 class="col-form-label">
                                  {s name='RegisterPersonalLabelType'}{/s}
                                  {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                            <select id="register_personal_customer_type" 
                                    name="register[personal][customer_type]" 
                                    class="form-control is-required
                                    {if isset($error_flags.customer_type)} is-invalid{/if}" 
                                    required="required" aria-required="true">

                                <option value="private"{if $form_data.customer_type eq "private"} selected="selected"{/if}>
                                    {s name='RegisterPersonalLabelPrivate'}{/s}
                                </option>
                                <option value="business"{if $form_data.customer_type eq "business" or $form_data.company or $form_data.sValidation} selected="selected"{/if}>
                                    {s name='RegisterPersonalLabelBusiness'}{/s}
                                </option>
                            </select>
                      {else}
                          {* Always register as a private customer*}
                          <div class="d-none">
                              <select id="register_personal_customer_type" name="register[personal][customer_type]">
                                  <option value="private" selected="selected">{s name='RegisterPersonalLabelPrivate'}{/s}</option>
                              </select>
                          </div>
                      {/if}
                  </div>
              {/if}
          </div>
        {/block}

        {* Salutation *}
        {block name='frontend_register_personal_fieldset_salutation'}
            <div class="form-row">
                {getSalutations variable="salutations"}

                <div class="form-group col-md-12 col-lg-6">
                    <label for="salutation" 
                           class="col-form-label">
                            {s name='RegisterPlaceholderSalutation'}{/s}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                      <select name="register[personal][salutation]"
                              id="salutation"
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

        {* Title *}
        {block name='frontend_register_personal_fieldset_input_title'}
            {if {config name="displayprofiletitle"}}
                <div class="form-group">
                    <label for="title" 
                           class="col-form-label">
                            {s name='RegisterPlaceholderTitle'}{/s}</label>

                      <input autocomplete="section-personal title"
                             name="register[personal][title]"
                             type="text"
                             id="title"
                             value="{$form_data.title|escape}"
                             class="form-control
                             {if isset($error_flags.title)} is-invalid{/if}" />      
                </div>
            {/if}
        {/block}

        {* Firstname *}
        {block name='frontend_register_personal_fieldset_input_firstname'}
            <div class="form-group">
                <label for="firstname" 
                       class="col-form-label">
                        {s name='RegisterPlaceholderFirstname'}{/s}
                        {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                <input autocomplete="section-personal given-name"
                       name="register[personal][firstname]" 
                       type="text" 
                       id="firstname" 
                       value="{$form_data.firstname|escape}" 
                       class="form-control is-required
                       {if isset($error_flags.firstname)} is-invalid{/if}" 
                       required="required" aria-required="true" />
            </div>
        {/block}

        {* Lastname *}
        {block name='frontend_register_personal_fieldset_input_lastname'}
            <div class="form-group">
                <label for="lastname" 
                       class="col-form-label">
                        {s name='RegisterPlaceholderLastname'}{/s}
                        {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                <input autocomplete="section-personal family-name"
                        name="register[personal][lastname]" 
                        type="text" 
                        id="lastname" 
                        value="{$form_data.lastname|escape}" 
                        class="form-control is-required
                        {if isset($error_flags.lastname)} is-invalid{/if}"
                        required="required" aria-required="true" />
            </div>
        {/block}

        {* Skip login *}
        {if !$update}
            {block name='frontend_register_personal_fieldset_skip_login'}
                {if ($showNoAccount || $form_data.accountmode) && !$sEsd && !$form_data.sValidation && !{config name=NoAccountDisable}}
                    <div class="form-group register-check sw5-plugin">
                        <div class="form-check form-check-inline">
                          <label for="register_personal_skipLogin" class="form-check-label">
                              <input type="checkbox" 
                                     value="1" 
                                     id="register_personal_skipLogin"
                                     class="form-check-input" 
                                     name="register[personal][accountmode]" 
                                     {if $form_data.accountmode || $accountmode}checked {/if} /> 
                              <strong>{s name='RegisterLabelNoAccount'}{/s}</strong>
                          </label>
                        </div>
                    </div>
                {else}
                    <input type="hidden"
                           value="0"
                           id="register_personal_skipLogin"
                           name="register[personal][accountmode]"
                           {if $form_data.accountmode || $accountmode}checked="checked" {/if}/>
                {/if}
            {/block}

            {* E-Mail *}
            {block name='frontend_register_personal_fieldset_input_mail'}
                <div class="form-group">
                    <label for="register_personal_email"
                           class="col-form-label">
                            {s name='RegisterPlaceholderMail'}{/s}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                      <input autocomplete="section-personal email"
                             name="register[personal][email]" 
                             type="email" 
                             id="register_personal_email" 
                             value="{$form_data.email|escape}" 
                             class="form-control email sw5-plugin is-required
                             {if isset($error_flags.email)} is-invalid{/if}" 
                             required="required" aria-required="true"/>
                </div>
                {if {config name=doubleEmailValidation}}
                    <div class="form-group">
                        <label for="register_personal_emailConfirmation" 
                               class="col-form-label">
                                {s name='RegisterPlaceholderMailConfirmation'}{/s}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                          <input autocomplete="section-personal email"
                                 name="register[personal][emailConfirmation]" 
                                 type="email" 
                                 id="register_personal_emailConfirmation" 
                                 value="{$form_data.emailConfirmation|escape}" 
                                 class="form-control emailConfirmation sw5-plugin is-required
                                 {if isset($error_flags.emailConfirmation)} is-invalid{/if}" 
                                 required="required" aria-required="true" />
                    </div>
                {/if}
            {/block}
        {/if}

        {if !$update}
            <div id="register-password" class="register-account-information sw5-plugin{if $form_data.skipLogin || $form_data.accountmode || $skipLogin} collapse{else} collapse in{/if}">
                {* Password *}
                {block name='frontend_register_personal_fieldset_input_password'}
                    <div class="form-group">
                        <label for="register_personal_password" 
                               class="col-form-label">
                                {s name='RegisterPlaceholderPassword'}{/s}
                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                          <input name="register[personal][password]" 
                                 type="password" 
                                 id="register_personal_password" 
                                 class="form-control password sw5-plugin is-required
                                 {if isset($error_flags.password)} is-invalid{/if}" 
                                 required="required" aria-required="true" />
                    </div>
                {/block}

                {* Password confirmation *}
                {block name='frontend_register_personal_fieldset_input_password_confirm'}
                    {if {config name=doublePasswordValidation}}
                        <div class="form-group">
                            <label for="register_personal_passwordConfirmation" 
                                   class="col-form-label">
                                    {s name='RegisterPlaceholderPasswordRepeat'}{/s}
                                    {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                              <input name="register[personal][passwordConfirmation]" 
                                     type="password" 
                                     id="register_personal_passwordConfirmation" 
                                     class="form-control passwordConfirmation sw5-plugin is-required
                                     {if isset($error_flags.passwordConfirmation)} is-invalid{/if}" 
                                     required="required" aria-required="true" />
                        </div>
                    {/if}
                {/block}

                {* Password description *}
                {block name='frontend_register_personal_fieldset_password_description'}
                    <div class="form-group">
                        <span class="form-text text-muted small">{s name='RegisterInfoPassword'}{/s} {config name=MinPassword} {s name='RegisterInfoPasswordCharacters'}{/s} {s name='RegisterInfoPassword2'}{/s}</span>
                    </div>
                {/block}
            </div>
        {/if}

        {* Phone *}
        {block name='frontend_register_personal_fieldset_input_phone'}
            {if {config name=showPhoneNumberField}}
                <div class="form-group">
                    <label for="phone" 
                           class="col-form-label">
                            {s name='RegisterPlaceholderPhone'}{/s}
                            {if {config name=requirePhoneField}}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>

                      <input autocomplete="section-personal tel"
                             name="register[personal][phone]" 
                             type="tel" 
                             id="phone" 
                             value="{$form_data.phone|escape}" 
                             class="form-control{if {config name=requirePhoneField}} is-required{/if}
                             {if isset($error_flags.phone)} is-invalid{/if}" 
                             {if {config name=requirePhoneField}} required="required" aria-required="true"{/if}/>
                </div>
            {/if}
        {/block}

        {* Birthday *}
        {if {config name=showBirthdayField} && !$update}
            {block name='frontend_register_personal_fieldset_birthday'}
                <div class="form-group">
                    <label for="register_personal_birthdate" 
                           class="col-form-label">
                            {s name='RegisterPlaceholderBirthday'}{/s}
                            {if {config name=requireBirthdayField}}
                            {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}:</label>
                        <div class="form-row">
                            <div class="col">
                                <select id="register_personal_birthdate" name="register[personal][birthday][day]" class="form-control{if {config name=requireBirthdayField}} is-required{/if}" {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}>
                                    <option value=""{if {config name=requireBirthdayField}} disabled="disabled"{/if}>{s name='RegisterBirthdaySelectDay'}--{/s}</option>

                                    {for $day = 1 to 31}
                                        <option value="{$day}" {if $day == $form_data.birthday.day}selected{/if}>{$day}</option>
                                    {/for}
                                </select>
                            </div>

                            <div class="col">
                                <select name="register[personal][birthday][month]" class="form-control{if {config name=requireBirthdayField}} is-required{/if}" {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}>
                                    <option value=""{if {config name=requireBirthdayField}} disabled="disabled"{/if}>{s name='RegisterBirthdaySelectMonth'}--{/s}</option>
                                    
                                    {for $month = 1 to 12}
                                        <option value="{$month}" {if $month == $form_data.birthday.month}selected{/if}>{$month}</option>
                                    {/for}
                                </select>
                            </div>
                            <div class="col-6">
                                <select name="register[personal][birthday][year]" class="form-control{if {config name=requireBirthdayField}} is-required{/if}" {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}>
                                    <option value=""{if {config name=requireBirthdayField}} disabled="disabled"{/if}>{s name='RegisterBirthdaySelectYear'}----{/s}</option>
                                    
                                    {for $year = date("Y")-12 to date("Y")-120 step=-1}
                                        <option value="{$year}" {if $year == $form_data.birthday.year}selected{/if}>{$year}</option>
                                    {/for}
                                </select>
                            </div>
                        </div>
                    </div>
            {/block}
        {/if}
    {/block}
{/block}