{namespace name="frontend/account/login"}

<div class="panel panel-default">
    <div class="panel-body">
        <form method="post" action="{$registerRedirectUrl}" class="register-form form-horizontal">
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

            {* Privacy checkbox *}
            {if !$update}
                {if {config name=ACTDPRCHECK}}
                    {block name='frontend_register_index_input_privacy'}
                        <div class="register-privacy">
                            <input name="register[personal][dpacheckbox]" type="checkbox" id="dpacheckbox"{if $form_data.dpacheckbox} checked="checked"{/if} required="required" aria-required="true" value="1" class="chkbox is-required" />
                            <label for="dpacheckbox" class="chklabel{if isset($errors.personal.dpacheckbox)} has-error{/if}">{s name='RegisterLabelDataCheckbox'}{/s}</label>
                        </div>
                    {/block}
                {/if}
            {/if}

            <div class="col-md-offset-4 col-md-6">
                {block name='frontend_register_index_form_required'}
                    {* Required fields hint *}
                    <div class="register-required-info required_fields help-block">
                        {s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}
                    </div>
                {/block}
            </div>
            <div class="col-md-offset-4 col-md-6">
                {block name='frontend_register_index_form_submit'}
                    {* Submit button *}
                    <div class="register-action">
                        <button type="submit" class="register-submit btn btn-primary btn-lg" name="Submit">{s namespace="frontend/register/index" name="RegisterIndexNewActionSubmit"}{/s}
                        </button>
                    </div>
                {/block}
            </div>
        </form>
    </div>
</div>
