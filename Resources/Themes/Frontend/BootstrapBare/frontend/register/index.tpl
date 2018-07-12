{extends file="frontend/index/index.tpl"}

{block name="gridconfig" prepend}
    {assign "grid" "g010" scope="global"}
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
                    <div class="card mb-4 d-none d-md-block">
                        {block name='frontend_index_content_advantages_list'}
                            <div class="card-body">
                                {block name='frontend_register_index_advantages_title'}
                                    <div class="card-title">
                                        <h4>{s name='RegisterInfoAdvantagesTitle'}Meine Vorteile{/s}</h4>
                                    </div>
                                {/block}
                                <ul>
                                    {block name='frontend_index_content_advantages_entry1'}
                                        <li>
                                            {s name='RegisterInfoAdvantagesEntry1'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry2'}
                                        <li>
                                            {s name='RegisterInfoAdvantagesEntry2'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry3'}
                                        <li>
                                            {s name='RegisterInfoAdvantagesEntry3'}{/s}
                                        </li>
                                    {/block}

                                    {block name='frontend_index_content_advantages_entry4'}
                                        <li>
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
                                    <div class="card mb-4">
                                        {block name='frontend_register_index_cgroup_header_title'}
                                            <div class="card-header">
                                                {$sShopname|escapeHtml} {s name='RegisterHeadlineSupplier' namespace='frontend/register/index'}{/s}
                                            </div>
                                        {/block}
                                        {block name='frontend_register_index_cgroup_header_body'}
                                            <div class="card-body">
                                                <h4 class="bold">{s name='RegisterInfoSupplier3' namespace='frontend/register/index'}{/s}</h4>

                                                <h5 class="bold">{s name='RegisterInfoSupplier4' namespace='frontend/register/index'}{/s}</h5>{s name='RegisterInfoSupplier5' namespace='frontend/register/index'}{/s}

                                                <h5 class="bold">{s name='RegisterInfoSupplier6' namespace='frontend/register/index'}{/s}</h5>{s name='RegisterInfoSupplier7' namespace='frontend/register/index'}{/s}
                                            </div>
                                        {/block}
                                    </div>
                                </div>
                            </div>
                        {/if}
                    {/block}

                    {block name='frontend_register_index_form'}
                        <div class="card mb-5">
                            <div class="card-body">
                                {block name="frontend_register_index_form_tag"}
                                <form method="post" action="{url action=saveRegister sTarget=$sTarget sTargetAction=$sTargetAction}" class="register-form">
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
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <input name="register[personal][dpacheckbox]" 
                                                               type="checkbox" 
                                                               id="dpacheckbox"
                                                               {if $form_data.dpacheckbox}checked="checked"{/if} 
                                                               value="1" 
                                                               class="is-required form-check-input{if isset($errors.personal.dpacheckbox)} is-invalid{/if}" 
                                                               required="required" aria-required="true"/>

                                                        <label for="dpacheckbox" class="form-check-label">
                                                            {s name='RegisterLabelDataCheckbox'}{/s}
                                                        </label>
                                                    </div>
                                                </div>
                                            {/block}
                                        {/if}
                                    {/if}

                                    {block name='frontend_register_index_form_bottom'}
                                        {*! Required fields hint *}
                                        {block name='frontend_register_index_form_required'}
                                            <p class="text-muted small">
                                                {s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}
                                            </p>
                                        {/block}

                                        {* Captcha *}
                                        {block name='frontend_register_index_form_captcha'}
                                            {$captchaHasError = $errors.captcha}
                                            {$captchaName = {config name=registerCaptcha}}
                                            {include file="widgets/captcha/custom_captcha.tpl" captchaName=$captchaName captchaHasError=$captchaHasError}
                                        {/block}

                                        {block name='frontend_register_index_form_submit'}
                                            <button id="registerbutton" 
                                                    class="btn btn-lg btn-primary register-submit sw5-plugin" 
                                                    type="submit">
                                                {s name='RegisterIndexNewActionSubmit'}{/s}
                                            </button>
                                        {/block}
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
