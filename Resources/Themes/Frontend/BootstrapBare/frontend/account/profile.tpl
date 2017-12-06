{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb[] = ['name'=>"{s name="ProfileHeadline"}{/s}", 'link'=>{url}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="account-profile">

        {block name="frontend_account_profile_profile_form"}
            <form name="profileForm" action="{url controller=account action=saveProfile}" method="post" class="form-horizontal">

                {block name="frontend_account_profile_profile_panel"}
                    {block name="frontend_account_profile_profile_title"}
                        <h3>{s name="ProfileHeadline"}Mein Profil{/s}</h3>
                    {/block}

                    {block name="frontend_account_profile_profile_body"}
                        {block name="frontend_account_profile_profile_success"}
                            {if $section == 'profile' && $success}
                                {include file="frontend/_includes/messages.tpl" type="success" content="{s name="ProfileSaveSuccessMessage"}Ihr Profil wurde erfolgreich geändert.{/s}"}
                            {/if}
                        {/block}

                        {* Error messages *}
                        {block name="frontend_account_profile_profile_errors"}
                            {if $section == 'profile' && $errorMessages}
                                {include file="frontend/register/error_message.tpl" error_messages=["{s name="ErrorFillIn" namespace="frontend/account/internalMessages"}{/s}"]}
                            {/if}
                        {/block}

                        {* Salutation *}
                        {block name='frontend_account_profile_profile_input_salutation'}
                            {getSalutations variable="salutations"}

                            <div class="profile-salutation form-group {if $errorFlags.salutation} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name='RegisterPlaceholderSalutation' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <select name="profile[salutation]"
                                        required="required"
                                        aria-required="true"
                                        class="form-control is-required">

                                        {foreach $salutations as $key => $label}
                                            <option value="{$key}"{if $form_data.profile.salutation eq $key} selected="selected"{/if}>{$label}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        {/block}

                        {* Title *}
                        {block name='frontend_account_profile_profile_input_title'}
                            {if {config name="displayprofiletitle"}}
                                <div class="profile-title form-group{if $errorFlags.title} has-error{/if}">
                                    <label class="control-label {$FormLabelSize}">{s name='RegisterPlaceholderTitle' namespace="frontend/register/personal_fieldset"}Titel{/s}</label>

                                    <div class="{$FormInputSize}">
                                        <input autocomplete="section-personal title"
                                               name="profile[title]"
                                               type="text"
                                               value="{$form_data.profile.title|escape}"
                                               class="form-control profile-field" />
                                    </div>       
                                </div>
                            {/if}
                        {/block}

                        {* Firstname *}
                        {block name='frontend_account_profile_profile_input_firstname'}
                            <div class="profile-firstname form-group{if $errorFlags.firstname} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name='RegisterPlaceholderFirstname' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input autocomplete="section-personal given-name"
                                           name="profile[firstname]"
                                           type="text"
                                           required="required"
                                           aria-required="true"
                                           value="{$form_data.profile.firstname|escape}" 
                                           class="form-control is-required"
                                    />
                                </div>
                            </div>
                        {/block}

                        {* Lastname *}
                        {block name="frontend_account_profile_profile_input_lastname"}
                            <div class="profile-lastname form-group{if $errorFlags.lastname} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name='RegisterPlaceholderLastname' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input autocomplete="section-personal family-name"
                                           name="profile[lastname]"
                                           type="text"
                                           required="required"
                                           aria-required="true"
                                           value="{$form_data.profile.lastname|escape}"
                                           class="form-control is-required"
                                    />
                                </div>    
                            </div>
                        {/block}

                        {* Birthday *}
                        {block name="frontend_account_profile_profile_input_birthday"}
                            {if {config name=showBirthdayField}}
                                <div class="form-group profile-birthdate">
                                    {block name="frontend_account_profile_profile_input_birthday_label"}
                                        <label for="register_personal_birthdate" class="{$FormLabelSize} control-label">{s name='RegisterPlaceholderBirthday' namespace="frontend/register/personal_fieldset"}{/s}{if {config name=requireBirthdayField}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>
                                    {/block}

                                    <div class="{$FormInputSize}">
                                        <div class="row compressed-cols">
                                            {block name="frontend_account_profile_profile_input_birthday_day"}
                                                <div class="col-3">
                                                    <div class="profile-birthday">
                                                        <select name="profile[birthday][day]"
                                                                id="register_personal_birthdate"
                                                                {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has-error{/if}">

                                                            <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.day} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectDay' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                            {for $day = 1 to 31}
                                                                <option value="{$day}" {if $day == $form_data.profile.birthday.day}selected{/if}>{$day}</option>
                                                            {/for}
                                                        </select>
                                                    </div>
                                                </div>   
                                            {/block}

                                            {block name="frontend_account_profile_profile_input_birthday_month"}
                                                <div class="col-3">
                                                    <div class="profile-birthmonth">
                                                        <select name="profile[birthday][month]"
                                                                {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has-error{/if}">

                                                            <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.month} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectMonth' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                            {for $month = 1 to 12}
                                                                <option value="{$month}" {if $month == $form_data.profile.birthday.month}selected{/if}>{$month}</option>
                                                            {/for}
                                                        </select>
                                                    </div>
                                                </div>
                                            {/block}

                                            {block name="frontend_account_profile_profile_input_birthday_year"}
                                                <div class="col-6">
                                                    <div class="profile-birthyear">
                                                        <select name="profile[birthday][year]"
                                                                {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has-error{/if}">

                                                            <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.year} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectYear' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                            {for $year = date("Y")-12 to date("Y")-120 step=-1}
                                                                <option value="{$year}" {if $year == $form_data.profile.birthday.year}selected{/if}>{$year}</option>
                                                            {/for}
                                                        </select>
                                                    </div>
                                                </div>
                                            {/block}
                                        </div>
                                    </div>        
                                </div>
                            {/if}
                        {/block}

                        {block name="frontend_account_profile_profile_required_info"}
                            <div class="form-group required-info">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <p class="help-block">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                </div>
                            </div>
                        {/block}
                    {/block}

                    {block name="frontend_account_profile_profile_actions"}
                        <div class="form-group">
                            <div class="{$FormInputSize} {$FormLabelOffset}">
                                {block name="frontend_account_profile_profile_actions_submit"}
                                    <button class="btn btn-primary" type="submit">
                                        {s name="ProfileSaveButton"}Profil speichern{/s}
                                    </button>
                                {/block}
                            </div>
                        </div>        
                    {/block}
                {/block}
            </form>
        {/block}

        {block name="frontend_account_profile_email_form"}
            <form name="emailForm" action="{url controller=account action=saveEmail}" method="post" class="form-horizontal">

                {block name="frontend_account_profile_email_panel"}
                    {block name="frontend_account_profile_email_title"}
                        <h3>{s name="EmailHeadline"}Meine E-Mail{/s}</h3>
                    {/block}

                    {block name="frontend_account_profile_email_body"}
                        {block name="frontend_account_profile_email_success"}
                            {if $section == 'email' && $success}
                                {include file="frontend/_includes/messages.tpl" type="success" content="{s name="EmailSaveSuccessMessage"}Ihre E-Mail-Adresse wurde erfolgreich geändert.{/s}"}
                            {/if}
                        {/block}

                        {* Error messages *}
                        {block name="frontend_account_profile_email_errors"}
                            {if $section == 'email'}
                                {include file="frontend/register/error_message.tpl" error_messages=$errorMessages}
                            {/if}
                        {/block}

                        {block name="frontend_account_profile_email_current"}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}">{s name="EmailCurrentEmailLabel"}Aktuelle E-Mail-Adresse{/s}</label>
                                <div class="{$FormInputSize}">
                                    <div class="pts">{$sUserData.additional.user.email}</div>
                                </div>
                            </div>
                        {/block}

                        {* Email *}
                        {block name='frontend_account_profile_email_input_email'}
                            <div class="profile-email form-group{if $errorFlags.email} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name="AccountLabelNewMail" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input autocomplete="section-personal email"
                                       required="required"
                                       aria-required="true"
                                       name="email[email]"
                                       type="email"
                                       value="{$form_data.email.email}"
                                       class="form-control is-required" />
                                </div>    
                            </div>
                        {/block}

                        {* Email confirmation *}
                        {block name='frontend_account_profile_email_input_email_confirmation'}
                            <div class="profile-email-confirmation form-group{if $errorFlags.emailConfirmation} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name="AccountLabelMail" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input name="email[emailConfirmation]"
                                       type="email"
                                       required="required"
                                       aria-required="true"
                                       value="{$form_data.email.emailConfirmation}"
                                       class="form-control is-required" />
                                </div>    
                            </div>
                        {/block}

                        {block name='frontend_account_profile_email_input_current_password'}
                            {if {config name=accountPasswordCheck}}
                                <div class="profile-current-password form-group{if $section == 'email' && $errorFlags.currentPassword} has-error{/if}">
                                    <label class="control-label {$FormLabelSize}">{s name="AccountLabelCurrentPassword2" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                    <div class="{$FormInputSize}">
                                        <input name="email[currentPassword]"
                                               type="password"
                                               autocomplete="current-password"
                                               required="required"
                                               aria-required="true"
                                               class="form-control is-required" />
                                    </div>    
                                </div>
                            {/if}
                        {/block}

                        {block name="frontend_account_profile_email_required_info"}
                            <div class="form-group required-info">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <p class="help-block">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                </div>
                            </div>
                        {/block}
                    {/block}

                    {block name="frontend_account_profile_email_actions"}
                        <div class="form-group">
                            <div class="{$FormInputSize} {$FormLabelOffset}">
                                {block name="frontend_account_profile_email_actions_submit"}
                                    <button class="btn btn-primary" type="submit">
                                        {s name="EmailSaveButton"}E-Mail speichern{/s}
                                    </button>
                                {/block}
                            </div>
                        </div>       
                    {/block}
                {/block}
            </form>
        {/block}

        {block name="frontend_account_profile_password_form"}
            <form name="passwordForm" action="{url controller=account action=savePassword}" method="post" class="form-horizontal">

                {block name="frontend_account_profile_password_panel"}
                    {block name="frontend_account_profile_password_title"}
                        <h3>{s name="PasswordHeadline"}Mein Passwort{/s}</h3>
                    {/block}

                    {block name="frontend_account_profile_password_body"}
                        {block name="frontend_account_profile_password_success"}
                            {if $section == 'password' && $success}
                                {include file="frontend/_includes/messages.tpl" type="success" content="{s name="PasswordSaveSuccessMessage"}Ihr Passwort wurde erfolgreich geändert.{/s}"}
                            {/if}
                        {/block}

                        {* Error messages *}
                        {block name="frontend_account_profile_password_errors"}
                            {if $section == 'password'}
                                {include file="frontend/register/error_message.tpl" error_messages=$errorMessages}
                            {/if}
                        {/block}

                        {* Password *}
                        {block name='frontend_account_profile_password_input_password'}
                            <div class="profile-password form-group{if $errorFlags.password} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name="AccountLabelNewPassword2" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input name="password[password]"
                                           type="password"
                                           autocomplete="new-password"
                                           required="required"
                                           aria-required="true"
                                           class="form-control is-required"
                                        />
                                </div>    
                            </div>
                        {/block}

                        {* Password confirmation *}
                        {block name='frontend_account_profile_password_input_password_confirmation'}
                            <div class="profile-password-confirmation form-group{if $errorFlags.passwordConfirmation} has-error{/if}">
                                <label class="control-label {$FormLabelSize}">{s name="AccountLabelRepeatPassword2" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input name="password[passwordConfirmation]"
                                           type="password"
                                           autocomplete="new-password"
                                           required="required"
                                           aria-required="true"
                                           class="form-control is-required"
                                        />
                                </div>    
                            </div>
                        {/block}

                        {block name='frontend_account_profile_password_input_current_password'}
                            {if {config name=accountPasswordCheck}}
                                <div class="profile-current-password form-group{if $section == 'password' && $errorFlags.currentPassword} has-error{/if}">
                                    <label class="control-label {$FormLabelSize}">{s name="AccountLabelCurrentPassword2" namespace="frontend/account/index"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                    <div class="{$FormInputSize}">
                                        <input name="password[currentPassword]"
                                               type="password"
                                               autocomplete="current-password"
                                               required="required"
                                               aria-required="true"
                                               class="form-control is-required"
                                        />
                                    </div>    
                                </div>
                            {/if}
                        {/block}

                        {block name="frontend_account_profile_password_required_info"}
                            <div class="form-group required-info">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <p class="help-block">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                </div>
                            </div>
                        {/block}
                    {/block}

                    {block name="frontend_account_profile_password_actions"}
                        <div class="form-group">
                            <div class="{$FormInputSize} {$FormLabelOffset}">
                                {block name="frontend_account_profile_password_actions_submit"}
                                    <button class="btn btn-primary" type="submit">
                                        {s name="PasswordSaveButton"}Passwort speichern{/s}
                                    </button>
                                {/block}
                            </div>
                        </div>  
                    {/block}
                {/block}
            </form>
        {/block}
    </div>
{/block}