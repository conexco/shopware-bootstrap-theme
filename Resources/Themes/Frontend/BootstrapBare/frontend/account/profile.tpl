{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb[] = ['name'=>"{s name="ProfileHeadline"}{/s}", 'link'=>{url}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="row">

        <div class="col-12 mb-4">
            {block name="frontend_account_profile_profile_form"}
                <div class="card h-100">
                    <div class="card-header bg-transparent">
                        {block name="frontend_account_profile_profile_title"}
                            <h2 class="mb-0">{s name="ProfileHeadline"}Mein Profil{/s}</h2>
                        {/block}
                    </div>
                    <form class="card-body d-flex flex-column" name="profileForm" action="{url controller=account action=saveProfile}" method="post">

                        {block name="frontend_account_profile_profile_panel"}
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
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label for="profileSolutation"
                                                   class="col-form-label">
                                                {s name='RegisterPlaceholderSalutation' namespace="frontend/register/personal_fieldset"}{/s}
                                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                            <select name="profile[salutation]"
                                                    required="required"
                                                    aria-required="true"
                                                    class="form-control is-required
                                        {if $errorFlags.salutation} is-invalid{/if}"
                                                    id="profileSolutation">

                                                {foreach $salutations as $key => $label}
                                                    <option value="{$key}"{if $form_data.profile.salutation eq $key} selected="selected"{/if}>{$label}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                {/block}

                                {* Title *}
                                {block name='frontend_account_profile_profile_input_title'}
                                    <div class="form-row">
                                        {if {config name="displayprofiletitle"}}
                                            <div class="form-group col">
                                                <label for="profileTitle"
                                                       class="col-form-label">
                                                    {s name='RegisterPlaceholderTitle' namespace="frontend/register/personal_fieldset"}Titel{/s}</label>

                                                <input autocomplete="section-personal title"
                                                       name="profile[title]"
                                                       type="text"
                                                       value="{$form_data.profile.title|escape}"
                                                       class="form-control profile-field
                                               {if $errorFlags.title} is-invalid{/if}"
                                                       id="profileTitle" />
                                            </div>
                                        {/if}
                                    </div>
                                {/block}

                                {* Firstname *}
                                {block name='frontend_account_profile_profile_input_firstname'}
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label for="profileFirstname"
                                                   class="col-form-label">
                                                {s name='RegisterPlaceholderFirstname' namespace="frontend/register/personal_fieldset"}{/s}
                                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                            <input autocomplete="section-personal given-name"
                                                   name="profile[firstname]"
                                                   type="text"
                                                   required="required"
                                                   aria-required="true"
                                                   value="{$form_data.profile.firstname|escape}"
                                                   class="form-control is-required
                                           {if $errorFlags.firstname} is-invalid{/if}"
                                                   id="profileFirstname" />
                                        </div>
                                    </div>
                                {/block}

                                {* Lastname *}
                                {block name="frontend_account_profile_profile_input_lastname"}
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label for="profileLastname"
                                                   class="col-form-label">
                                                {s name='RegisterPlaceholderLastname' namespace="frontend/register/personal_fieldset"}{/s}
                                                {s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                            <input autocomplete="section-personal family-name"
                                                   name="profile[lastname]"
                                                   type="text"
                                                   required="required"
                                                   aria-required="true"
                                                   value="{$form_data.profile.lastname|escape}"
                                                   class="form-control is-required
                                       {if $errorFlags.lastname} is-invalid{/if}"
                                                   id="profileLastname" />
                                        </div>
                                    </div>
                                {/block}

                                {* Birthday *}
                                {block name="frontend_account_profile_profile_input_birthday"}
                                    {if {config name=showBirthdayField}}
                                        <div class="form-group">
                                            {block name="frontend_account_profile_profile_input_birthday_label"}
                                                <label for="register_personal_birthdate"
                                                       class="col-form-label">
                                                    {s name='RegisterPlaceholderBirthday' namespace="frontend/register/personal_fieldset"}{/s}
                                                    {if {config name=requireBirthdayField}}
                                                        {s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>
                                            {/block}

                                            <div class="form-row">
                                                {block name="frontend_account_profile_profile_input_birthday_day"}
                                                    <div class="col-3 col-md-2">
                                                        <div class="profile-birthday">
                                                            <select name="profile[birthday][day]"
                                                                    id="register_personal_birthdate"
                                                                    {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                    class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} is-invalid{/if}">

                                                                <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.day} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectDay' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                                {for $day = 1 to 31}
                                                                    <option value="{$day}" {if $day == $form_data.profile.birthday.day}selected{/if}>{$day}</option>
                                                                {/for}
                                                            </select>
                                                        </div>
                                                    </div>
                                                {/block}

                                                {block name="frontend_account_profile_profile_input_birthday_month"}
                                                    <div class="col-3 col-md-2">
                                                        <div class="profile-birthmonth">
                                                            <select name="profile[birthday][month]"
                                                                    {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                    class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} is-invalid{/if}">

                                                                <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.month} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectMonth' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                                {for $month = 1 to 12}
                                                                    <option value="{$month}" {if $month == $form_data.profile.birthday.month}selected{/if}>{$month}</option>
                                                                {/for}
                                                            </select>
                                                        </div>
                                                    </div>
                                                {/block}

                                                {block name="frontend_account_profile_profile_input_birthday_year"}
                                                    <div class="col-6 col-md-4">
                                                        <div class="profile-birthyear">
                                                            <select name="profile[birthday][year]"
                                                                    {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                                    class="form-control {if {config name=requireBirthdayField}}is-required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} is-invalid{/if}">

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
                                    {/if}
                                {/block}

                                {block name="frontend_account_profile_profile_required_info"}
                                    <div class="form-group required-info">
                                        <p class="text-muted">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                    </div>
                                {/block}
                            {/block}

                            {block name="frontend_account_profile_profile_actions"}
                                {block name="frontend_account_profile_profile_actions_submit"}
                                    <button class="btn btn-outline-primary mb-2 align-self-start mt-auto" type="submit">
                                        {s name="ProfileSaveButton"}Profil speichern{/s}
                                    </button>
                                {/block}
                            {/block}
                        {/block}
                    </form>
                </div>
            {/block}
        </div>

        <div class="col-lg-6 mb-4">
            {block name="frontend_account_profile_email_form"}
                <div class="card h-100">
                    <div class="card-header bg-transparent">
                        {block name="frontend_account_profile_email_title"}
                            <h2 class="mb-0">{s name="EmailHeadline"}Meine E-Mail{/s}</h2>
                        {/block}
                    </div>
                    <form class="card-body d-flex flex-column" name="emailForm" action="{url controller=account action=saveEmail}" method="post">
                        {block name="frontend_account_profile_email_panel"}
                            {block name="frontend_account_profile_email_body"}
                                {block name="frontend_account_profile_email_success"}
                                    {if $section == 'email' && $success}
                                        {$emailSaveSuccessMessage = 'Ihre E-Mail-Adresse wurde erfolgreich geändert.'|snippet:'EmailSaveSuccessMessage':'frontend/account/profile':''}
                                        {include file="frontend/_includes/messages.tpl" type="success" content=$emailSaveSuccessMessage}
                                    {/if}
                                {/block}

                                {* Error messages *}
                                {block name="frontend_account_profile_email_errors"}
                                    {if $section == 'email'}
                                        {include file="frontend/register/error_message.tpl" error_messages=$errorMessages}
                                    {/if}
                                {/block}

                                {block name="frontend_account_profile_email_current"}
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label class="col-form-label">{s name="EmailCurrentEmailLabel"}Aktuelle E-Mail-Adresse{/s}</label>
                                            {$sUserData.additional.user.email}
                                        </div>
                                    </div>
                                {/block}

                                {* Email *}
                                {block name='frontend_account_profile_email_input_email'}
                                    <div class="form-row">
                                        <div class="profile-email form-group col">
                                            <label for="profileEmail"
                                                   class="col-form-label">
                                                {s name="AccountLabelNewMail" namespace="frontend/account/index"}{/s}
                                                {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                            <input autocomplete="section-personal email"
                                                   required="required"
                                                   aria-required="true"
                                                   name="email[email]"
                                                   type="email"
                                                   value="{$form_data.email.email}"
                                                   class="form-control is-required
                                       {if $errorFlags.email} is-invalid{/if}"
                                                   id="profileEmail" />
                                        </div>
                                    </div>
                                {/block}

                                {* Email confirmation *}
                                {block name='frontend_account_profile_email_input_email_confirmation'}
                                    <div class="form-row">
                                        <div class="profile-email-confirmation form-group col">
                                            <label for="profileEmailConfirmation"
                                                   class="col-form-label">
                                                {s name="AccountLabelMail" namespace="frontend/account/index"}{/s}
                                                {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                            <input name="email[emailConfirmation]"
                                                   type="email"
                                                   required="required"
                                                   aria-required="true"
                                                   value="{$form_data.email.emailConfirmation}"
                                                   class="form-control is-required
                                       {if $errorFlags.emailConfirmation} is-invalid{/if}"
                                                   id="profileEmailConfirmation" />
                                        </div>
                                    </div>
                                {/block}

                                {block name='frontend_account_profile_email_input_current_password'}
                                    <div class="form-row">
                                        {if {config name=accountPasswordCheck}}
                                            <div class="profile-current-password form-group col">
                                                <label for="profileCurrentPassword"
                                                       class="col-form-label">
                                                    {s name="AccountLabelCurrentPassword2" namespace="frontend/account/index"}{/s}
                                                    {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                                <input name="email[currentPassword]"
                                                       type="password"
                                                       autocomplete="current-password"
                                                       required="required"
                                                       aria-required="true"
                                                       class="form-control is-required
                                               {if $section == 'email' && $errorFlags.currentPassword} is-invalid{/if}"
                                                       id="profileCurrentPassword" />
                                            </div>
                                        {/if}
                                    </div>
                                {/block}

                                {block name="frontend_account_profile_email_required_info"}
                                    <div class="form-group required-info">
                                        <p class="text-muted">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                    </div>
                                {/block}
                            {/block}

                            {block name="frontend_account_profile_email_actions"}
                                {block name="frontend_account_profile_email_actions_submit"}
                                    <button class="btn btn-outline-primary mb-2 align-self-start mt-auto" type="submit">
                                        {s name="EmailSaveButton"}E-Mail speichern{/s}
                                    </button>
                                {/block}
                            {/block}
                        {/block}
                    </form>
                </div>
            {/block}
        </div>

        <div class="col-lg-6 mb-4">
            {block name="frontend_account_profile_password_form"}
                <div class="card h-100">
                    <div class="card-header bg-transparent">
                        {block name="frontend_account_profile_password_title"}
                            <h2 class="mb-0">{s name="PasswordHeadline"}Mein Passwort{/s}</h2>
                        {/block}
                    </div>
                    <form class="card-body d-flex flex-column" name="passwordForm" action="{url controller=account action=savePassword}" method="post">
                        {block name="frontend_account_profile_password_panel"}
                            {block name="frontend_account_profile_password_body"}
                                {block name="frontend_account_profile_password_success"}
                                    {if $section == 'password' && $success}
                                        {$passwordSaveSuccessMessage = 'Ihr Passwort wurde erfolgreich geändert.'|snippet:'PasswordSaveSuccessMessage':'frontend/account/profile':''}
                                        {include file="frontend/_includes/messages.tpl" type="success" content=$passwordSaveSuccessMessage}
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
                                    <div class="form-row">
                                        <div class="profile-password form-group col">
                                            <label for="profilePassword"
                                                   class="col-form-label">
                                                {s name="AccountLabelNewPassword2" namespace="frontend/account/index"}{/s}
                                                {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                            <input name="password[password]"
                                                   type="password"
                                                   autocomplete="new-password"
                                                   required="required"
                                                   aria-required="true"
                                                   class="form-control is-required
                                           {if $errorFlags.password} is-invalid{/if}"
                                                   id="profilePassword" />
                                        </div>
                                    </div>
                                {/block}

                                {* Password confirmation *}
                                {block name='frontend_account_profile_password_input_password_confirmation'}
                                    <div class="form-row">
                                        <div class="profile-password-confirmation form-group col">
                                            <label for="profilePasswordConfirmation"
                                                   class="col-form-label">
                                                {s name="AccountLabelRepeatPassword2" namespace="frontend/account/index"}{/s}
                                                {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                            <input name="password[passwordConfirmation]"
                                                   type="password"
                                                   autocomplete="new-password"
                                                   required="required"
                                                   aria-required="true"
                                                   class="form-control is-required
                                           {if $errorFlags.passwordConfirmation} is-invalid{/if}"
                                                   id="profilePasswordConfirmation" />
                                        </div>
                                    </div>
                                {/block}

                                {block name='frontend_account_profile_password_input_current_password'}
                                    <div class="form-row">
                                        {if {config name=accountPasswordCheck}}
                                            <div class="profile-current-password form-group col">
                                                <label for="profileLatestPassword"
                                                       class="col-form-label">
                                                    {s name="AccountLabelCurrentPassword2" namespace="frontend/account/index"}{/s}
                                                    {s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                                <input name="password[currentPassword]"
                                                       type="password"
                                                       autocomplete="current-password"
                                                       required="required"
                                                       aria-required="true"
                                                       class="form-control is-required
                                               {if $section == 'password' && $errorFlags.currentPassword} is-invalid{/if}
                                               id="profileLatestPassword" />
                                            </div>
                                        {/if}
                                    </div>
                                {/block}

                                {block name="frontend_account_profile_password_required_info"}
                                    <div class="form-group required-info">
                                        <p class="text-muted">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                    </div>
                                {/block}
                            {/block}

                            {block name="frontend_account_profile_password_actions"}
                                {block name="frontend_account_profile_password_actions_submit"}
                                    <button class="btn btn-outline-primary mb-2 align-self-start mt-auto" type="submit">
                                        {s name="PasswordSaveButton"}Passwort speichern{/s}
                                    </button>
                                {/block}
                            {/block}
                        {/block}
                    </form>
                </div>
            {/block}
        </div>

    </div>
{/block}