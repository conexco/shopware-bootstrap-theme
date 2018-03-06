{extends file="frontend/index/index.tpl"}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{block name="frontend_index_header"}
    {$toAccount = ($sTarget == "account" || $sTarget == "address")}
    {$smarty.block.parent}
{/block}

{*! Title *}
{block name='frontend_index_header_title'}
    {s name="RegisterTitle"}{/s} | {{config name=shopName}|escapeHtml}
{/block}

{* Step box *}
{block name='frontend_index_content_top'}
    {if $toAccount}
        {$smarty.block.parent}
    {else}
        {include file="frontend/register/steps.tpl" sStepActive="address"}
    {/if}
{/block}

{*! Hide sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Footer *}
{block name="frontend_index_footer"}
    {if !$theme.checkoutFooter || $toAccount}
        {$smarty.block.parent}
    {else}
        {block name="frontend_index_register_footer"}
            {include file="frontend/index/footer_minimal.tpl"}
        {/block}
    {/if}
{/block}

{*! Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{block name="frontend_index_content"}
    <div class="row">
        {* Login *}
        {block name='frontend_register_index_login'}
            <div class="col-md-5">
                {* Register login *}
                {include file="frontend/register/login.tpl"}
                {* Register advantages *}
                {block name='frontend_register_index_advantages'}
                    <div class="panel panel-default visible-md visible-lg">
                        {block name='frontend_register_index_advantages_title'}
                            <div class="panel-heading">
                                {s name='RegisterInfoAdvantagesTitle'}Meine Vorteile{/s}
                            </div>
                        {/block}
                        {block name='frontend_index_content_advantages_list'}
                            <div class="panel-body">
                                <ul>
                                    {block name='frontend_index_content_advantages_entry1'}
                                        <li class="register--advantages-entry">
                                            {s name='RegisterInfoAdvantagesEntry1'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry2'}
                                        <li class="register--advantages-entry">
                                            {s name='RegisterInfoAdvantagesEntry2'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry3'}
                                        <li class="register--advantages-entry">
                                            {s name='RegisterInfoAdvantagesEntry3'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry4'}
                                        <li class="register--advantages-entry">
                                            {s name='RegisterInfoAdvantagesEntry4'}{/s}
                                        </li>
                                    {/block}
                                </ul>
                            </div>
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
        {* Register *}
        {block name='frontend_register_index_registration'}
            <div class="col-md-7">
                <div id="registration" data-register="true">
                    {block name='frontend_register_index_dealer_register'}
                        {*! Included for compatibility reasons *}
                    {/block}

                    {block name='frontend_register_index_cgroup_header'}
                        {if $register.personal.sValidation}
                            {*! Include information related to registration for other customergroups then guest, this block get overridden by b2b essentials plugin *}
                            <div class="supplier_register">
                                <div class="inner_container">
                                    <div class="panel panel-default">
                                        {block name='frontend_register_index_cgroup_header_title'}
                                            <div class="panel-heading">
                                                {$sShopname|escapeHtml} {s name='RegisterHeadlineSupplier' namespace='frontend/register/index'}{/s}
                                            </div>
                                        {/block}
                                        {block name='frontend_register_index_cgroup_header_body'}
                                            <div class="panel-body">
                                                <h4 class="bold">{s name='RegisterInfoSupplier3' namespace='frontend/register/index'}{/s}</h4>

                                                <h5 class="bold">{s name='RegisterInfoSupplier4' namespace='frontend/register/index'}{/s}</h5>{s name='RegisterInfoSupplier5' namespace='frontend/register/index'}{/s}

                                                <h5 class="mtl bold">{s name='RegisterInfoSupplier6' namespace='frontend/register/index'}{/s}</h5>{s name='RegisterInfoSupplier7' namespace='frontend/register/index'}{/s}
                                            </div>
                                        {/block}
                                    </div>
                                </div>
                            </div>
                        {/if}
                    {/block}

                    {block name='frontend_register_index_form'}
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                {s name="LoginHeaderNew" namespace="frontend/account/login"}{/s} {$sShopname}
                            </div>
                            <div class="panel-body">
                                {block name="frontend_register_index_form_tag"}
                                <form method="post" action="{url action=saveRegister sTarget=$sTarget sTargetAction=$sTargetAction}" class="register-form form-horizontal">
                                    {/block}

                                    {block name='frontend_register_index_form_captcha_fieldset'}
                                        {include file="frontend/register/error_message.tpl" error_messages=$errors.captcha}
                                    {/block}

                                    {block name='frontend_register_index_form_personal_fieldset'}
                                        {include file="frontend/register/error_message.tpl" error_messages=$errors.personal}
                                        {include file="frontend/register/personal_fieldset.tpl" form_data=$register.personal error_flags=$errors.personal}
                                    {/block}

                                    {block name='frontend_register_index_form_billing_fieldset'}
                                        {include file="frontend/register/error_message.tpl" error_messages=$errors.billing}
                                        {include file="frontend/register/billing_fieldset.tpl" form_data=$register.billing error_flags=$errors.billing country_list=$countryList}
                                    {/block}

                                    {block name='frontend_register_index_form_shipping_fieldset'}
                                        {include file="frontend/register/error_message.tpl" error_messages=$errors.shipping}
                                        {include file="frontend/register/shipping_fieldset.tpl" form_data=$register.shipping error_flags=$errors.shipping country_list=$countryList}
                                    {/block}

                                    {*! Privacy checkbox *}
                                    {if !$update}
                                        {if {config name=ACTDPRCHECK}}
                                            {block name='frontend_register_index_input_privacy'}
                                                <div class="form-group{if isset($errors.personal.dpacheckbox)} has-error{/if}">
                                                    <div class="col-lg-6 col-lg-offset-4">
                                                    <label for="dpacheckbox" class="checkbox-inline">
                                                            <input name="register[personal][dpacheckbox]" type="checkbox" id="dpacheckbox"{if $form_data.dpacheckbox} checked="checked"{/if} value="1" class="is-required" required="required" aria-required="true" />
                                                            {s name='RegisterLabelDataCheckbox'}{/s}
                                                        </label>
                                                    </div>
                                                </div>
                                            {/block}
                                        {/if}
                                    {/if}

                                    {block name='frontend_register_index_form_bottom'}
                                        <div class="row">
                                            {*! Required fields hint *}
                                            {block name='frontend_register_index_form_required'}
                                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                                    <p class="help-block">
                                                        {s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}
                                                    </p>
                                                </div>
                                            {/block}

                                            {* Captcha *}
                                            {block name='frontend_register_index_form_captcha'}
                                                {$captchaHasError = $errors.captcha}
                                                {$captchaName = {config name=registerCaptcha}}
                                                {include file="widgets/captcha/custom_captcha.tpl" captchaName=$captchaName captchaHasError=$captchaHasError}
                                            {/block}

                                            {* Submit button *}
                                            {block name='frontend_register_index_form_submit'}
                                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                                    <input id="registerbutton" type="submit" class="btn btn-lg btn-primary register-submit sw5-plugin" value="{s name='RegisterIndexNewActionSubmit'}{/s}"/>
                                                </div>
                                            {/block}
                                        </div>
                                    {/block}
                                </form>
                            </div>
                        </div>
                    {/block}
                </div>
            </div>
        {/block}
    </div>
{/block}

{*! Hide sidebar left *}
{block name='frontend_index_content_right'}{/block}
