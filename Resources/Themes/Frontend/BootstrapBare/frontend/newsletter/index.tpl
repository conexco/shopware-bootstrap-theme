{extends file="frontend/index/index.tpl"}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb = [['name' => "{s name='NewsletterTitle'}{/s}", 'link' => {url}]]}
{/block}

{* Meta description *}
{block name='frontend_index_header_meta_description'}{s name='NewsletterMetaDescriptionStandard'}{/s}{/block}

{* Meta opengraph tags *}
{block name='frontend_index_header_meta_tags_opengraph'}
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="{{config name=sShopname}|escapeHtml}" />
    <meta property="og:title" content="{{config name=sShopname}|escapeHtml}" />
    <meta property="og:description" content="{s name='NewsletterMetaDescriptionStandard'}{/s}" />
    <meta property="og:image" content="{link file=$theme.desktopLogo fullPath}" />

    <meta name="twitter:card" content="website" />
    <meta name="twitter:site" content="{{config name=sShopname}|escapeHtml}" />
    <meta name="twitter:title" content="{{config name=sShopname}|escapeHtml}" />
    <meta name="twitter:description" content="{s name='NewsletterMetaDescriptionStandard'}{/s}" />
    <meta name="twitter:image" content="{link file=$theme.desktopLogo fullPath}" />
{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}
    {include file='frontend/index/sidebar.tpl'}
{/block}

{block name="frontend_index_content"}
    {* Newsletter headline *}
    {block name="frontend_newsletter_headline"}
        {block name="frontend_newsletter_headline_title"}
            <h1>{s name=NewsletterRegisterHeadline}{/s}</h1>
        {/block}
        {block name="frontend_newsletter_headline_info"}
            <p>{s name=sNewsletterInfo}{/s}</p>
        {/block}
    {/block}

    {* Error messages *}
    {block name="frontend_newsletter_error_messages"}
        {if $sStatus.code != 0}
            <div class="newsletter-error-messages">

                {$file = 'frontend/_includes/messages.tpl'}

                {if $sStatus.code === 7}
                    {$type = 'error'}
                    {$content ="{s namespace="widgets/captcha/custom_captcha" name="invalidCaptchaMessage"}{/s}"}
                {elseif $sStatus.code == 3}
                    {$type = 'success'}
                    {$content = $sStatus.message}
                {elseif $sStatus.code == 5}
                    {$type = 'error'}
                    {$content = $sStatus.message}
                {elseif $sStatus.code == 2}
                    {$type = 'warning'}
                    {$content = $sStatus.message}
                {elseif $sStatus.code != 0}
                    {$type = 'error'}
                    {$content = $sStatus.message}
                {/if}

                {include file=$file type=$type content=$content}
            </div>
        {/if}
    {/block}

    {* Newsletter content *}
    {block name="frontend_newsletter_content"}
        {if $voteConfirmed == false || $sStatus.code == 0}
            <div class="newsletter-form" data-newsletter="true">
                {* Newsletter form *}
                {block name="frontend_newsletter_form"}
                    <form action="{url controller='newsletter'}" method="post" id="letterForm" class="form-horizontal">
                        <fieldset>
                            {* Newsletter headline *}
                            {block name="frontend_newsletter_content_headline"}
                                <legend>{s name=NewsletterRegisterHeadline}{/s}</legend>
                            {/block}

                            {* Subscription option *}
                            {block name="frontend_newsletter_form_input_subscription"}
                                <div class="form-group">
                                    <div class="{$FormLabelOffset} {$FormInputSize}">
                                        <select name="subscribeToNewsletter" class="form-control newsletter-checkmail sw5-plugin">
                                            <option value="1">{s name=sNewsletterOptionSubscribe}{/s}</option>
                                            <option value="-1" {if $_POST.subscribeToNewsletter eq -1 || (!$_POST.subscribeToNewsletter && $sUnsubscribe == true)}selected{/if}>{s name=sNewsletterOptionUnsubscribe}{/s}</option>
                                        </select>
                                    </div>
                                </div>
                            {/block}

                            {* Email *}
                            {block name="frontend_newsletter_form_input_email"}
                                <div class="form-group{if $sStatus.sErrorFlag.newsletter} has-error{/if}">
                                    <label for="newsletter" class="control-label {$FormLabelSize}">{s name="sNewsletterPlaceholderMail"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                    <div class="{$FormInputSize}">
                                        <input name="newsletter" type="email" id="newsletter" value="{if $_POST.newsletter}{$_POST.newsletter}{elseif $_GET.sNewsletter}{$_GET.sNewsletter|escape}{/if}" class="form-control"/>
                                    </div>
                                </div>
                            {/block}

                            {* Additonal fields *}
                            {block name="frontend_newsletter_form_additionalfields"}
                                {if {config name=NewsletterExtendedFields}}
                                    <div class="newsletter-additional-form sw5-plugin">

                                        {getSalutations variable="salutations"}

                                        {* Salutation *}
                                        {block name="frontend_newsletter_form_input_salutation"}
                                            <div class="form-group{if $sStatus.sErrorFlag.salutation} has-error{/if}">
                                                <label for="salutation" class="control-label {$FormLabelSize}">{s name='NewsletterRegisterPlaceholderSalutation'}{/s}</label>
                                                <div class="{$FormInputSize}">
                                                    <select name="salutation" id="salutation" class="form-control">
                                                        <option value=""{if $_POST.salutation eq ""} selected="selected"{/if}>{s name='NewsletterRegisterPlaceholderSalutation'}{/s}</option>
                                                        {foreach $salutations as $key => $label}
                                                            <option value="{$key}"{if $_POST.salutation eq $key} selected="selected"{/if}>{$label}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        {/block}

                                        {* Firstname *}
                                        {block name="frontend_newsletter_form_input_firstname"}
                                            <div class="form-group{if $sStatus.sErrorFlag.firstname} has-error{/if}">
                                                <label for="firstname" class="control-label {$FormLabelSize}">{s name="NewsletterRegisterPlaceholderFirstname"}{/s}</label>

                                                <div class="{$FormInputSize}">
                                                    <input name="firstname" type="text" id="firstname" value="{$_POST.firstname|escape}" class="form-control"/>
                                                </div>
                                            </div>
                                        {/block}

                                        {* Lastname *}
                                        {block name="frontend_newsletter_form_input_lastname"}
                                            <div class="form-group{if $sStatus.sErrorFlag.lastname} has-error{/if}">
                                                <label for="lastname" class="control-label {$FormLabelSize}">{s name="NewsletterRegisterPlaceholderLastname"}{/s}</label>

                                                <div class="{$FormInputSize}">
                                                    <input name="lastname" type="text" id="lastname" value="{$_POST.lastname|escape}" class="form-control"/>
                                                </div>
                                            </div>
                                        {/block}

                                        {* Street *}
                                        {block name="frontend_newsletter_form_input_street"}
                                            <div class="form-group{if $sStatus.sErrorFlag.street || $sStatus.sErrorFlag.streetnumber} has-error{/if}">
                                                <label for="street" class="control-label {$FormLabelSize}">{s name="NewsletterRegisterBillingPlaceholderStreet"}{/s}</label>
                                                <div class="{$FormInputSize}">
                                                    <div class="row">
                                                        <div class="col-xs-12">
                                                            <input name="street" type="text" id="street" value="{$_POST.street|escape}" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/block}

                                        {* Zip + City *}
                                        {block name="frontend_newsletter_form_input_zip_and_city"}
                                            <div class="form-group{if $sStatus.sErrorFlag.zipcode || $sStatus.sErrorFlag.city} has-error{/if}">
                                                <label for="zipcode" class="control-label {$FormLabelSize}">{s name="NewsletterRegisterBillingPlaceholderZipcode"}{/s}{s name='RegisterBillingPlaceholderCityZipcodeDivider' namespace='frontend/register/billing_fieldset'}{/s}{s name="NewsletterRegisterBillingPlaceholderCityname"}{/s}</label>
                                                <div class="{$FormInputSize}">
                                                    <div class="row">
                                                        <div class="col-xs-4{if !{config name=showZipBeforeCity}} col-xs-push-8{/if}">
                                                            <input name="zipcode" type="text" id="zipcode" value="{$_POST.zipcode|escape}" maxlength="5" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-8{if !{config name=showZipBeforeCity}} col-xs-pull-4{/if}">
                                                            <input name="city" type="text" id="city" value="{$_POST.city|escape}" size="25" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/block}
                                    </div>
                                {/if}
                            {/block}

                            {* Captcha *}
                            {block name="frontend_newsletter_form_captcha"}
                                {if !({config name=noCaptchaAfterLogin} && $sUserLoggedIn)}
                                    {$newsletterCaptchaName = {config name=newsletterCaptcha}}
                                    <div class="form-group">
                                        <div class="newsletter-captcha-form col-md-offset-4 col-md-6">
                                            {if $newsletterCaptchaName === 'legacy'}
                                                <div class="newsletter-captcha">

                                                    {* Deferred loading of the captcha image *}
                                                    {block name='frontend_newsletter_form_captcha_placeholder'}
                                                        <div class="captcha-placeholder" {if $sErrorFlag.sCaptcha}
                                                             data-hasError="true"{/if}
                                                             data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"
                                                             data-autoload="true">
                                                        </div>
                                                    {/block}

                                                    {block name='frontend_newsletter_form_captcha_label'}
                                                        <strong class="captcha-notice">{s name="SupportLabelCaptcha" namespace="frontend/forms/elements"}{/s}</strong>
                                                    {/block}

                                                    {block name='frontend_newsletter_form_captcha_code'}
                                                        <div class="captcha-code">
                                                            <input type="text" name="sCaptcha" class="newsletter-field{if $sErrorFlag.sCaptcha} has-error{/if}" required="required" aria-required="true" />
                                                        </div>
                                                    {/block}
                                                </div>
                                            {elseif $newsletterCaptchaName !== 'nocaptcha'}
                                                <div class="captcha-placeholder"
                                                     data-src="{url module=widgets controller=Captcha action=getCaptchaByName captchaName=$newsletterCaptchaName}"{if isset($sErrorFlag) && count($sErrorFlag) > 0}
                                                     data-hasError="true"{/if} data-autoload="true"></div>
                                            {/if}
                                        </div>
                                    </div>
                                {/if}
                            {/block}

                            {* Submit button *}
                            {block name="frontend_newsletter_form_submit"}
                                <div class="form-group">
                                    <div class="{$FormLabelOffset} {$FormInputSize}">
                                        {* Data protection information *}
                                        {block name="frontend_newsletter_form_privacy"}
                                            {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                                {include file="frontend/_includes/privacy.tpl"}
                                            {/if}
                                        {/block}
                                        <span class="help-block required-info">{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</span>
                                        <button class="btn btn-primary" type="submit" name="submit">{s name=sNewsletterButton}{/s}</button>
                                    </div>
                                </div>
                            {/block}
                        </fieldset>
                    </form>
                {/block}
            </div>
        {/if}
    {/block}
{/block}
