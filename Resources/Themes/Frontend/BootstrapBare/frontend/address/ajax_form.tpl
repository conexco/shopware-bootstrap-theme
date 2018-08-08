{extends file="frontend/address/form.tpl"}
{namespace name="frontend/address/index"}

{* Error messages *}
{block name="frontend_address_error_messages"}
    <div class="address-editor-errors d-none">
        {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace="frontend/account/internalMessages" name="ErrorFillIn"}{/s}"}
    </div>
{/block}

{block name="frontend_address_form_form_inner" prepend}
        {*{assign "FormInputSize" "col-md-6" scope="global"}*}
        {*{assign "FormLabelSize" "col-md-4" scope="global"}*}
        {*{assign "FormLabelOffset" "col-md-offset-4" scope="global"}*}
{/block}

{block name="frontend_address_action_buttons"}
    <div>
        {if $formData.id}
            {block name="frontend_address_action_button_send"}
                <button class="btn btn-outline-secondary address-form-submit mb-2 mr-2" data-value="update" data-checkFormIsValid="false">{s name="AddressesActionButtonSend"}{/s}</button>
            {/block}
        {/if}

        {block name="frontend_address_action_button_save_as_new"}
            <button class="btn btn-outline-primary address-form-submit mb-2" data-value="create" data-checkFormIsValid="false">{s name="AddressesActionButtonCreate"}{/s}</button>
        {/block}

        {block name="frontend_address_action_button_save_action"}
            <input type="hidden" name="saveAction" value="update" />
        {/block}
    </div>
{/block}

{block name='frontend_address_form_input_set_default_shipping'}{/block}
{block name='frontend_address_form_input_set_default_billing'}{/block}