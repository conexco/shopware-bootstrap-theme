{extends file="frontend/address/form.tpl"}
{namespace name="frontend/address/index"}

{* Error messages *}
{block name="frontend_address_error_messages"}
    <div class="address-editor-errors hidden">
        {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace="frontend/account/internalMessages" name="ErrorFillIn"}{/s}"}
    </div>
{/block}

{block name="frontend_address_form_form_inner"}
    {assign "FormInputSize" "col-md-6" scope="global"}
    {assign "FormLabelSize" "col-md-4" scope="global"}
    {assign "FormLabelOffset" "col-md-offset-4" scope="global"}
    {$smarty.block.parent}
{/block}

{block name="frontend_address_action_buttons"}
    <div class="row">
        {if $formData.id}
            {block name="frontend_address_action_button_send"}
                <div class="{$FormLabelSize} address-form-submit-wrapper">
                    <button class="btn btn-default mbm-xs mbm-sm mbm-hd address-form-submit sw5-plugin" data-value="update" data-checkFormIsValid="false">{s name="AddressesActionButtonSend"}{/s}</button>
                </div>
            {/block}
        {/if}

        {block name="frontend_address_action_button_save_as_new"}
            <div class="{if !$formData.id}{$FormLabelOffset}{/if} {$FormInputSize}">
                <button class="btn btn-primary address-form-submit sw5-plugin" data-value="create" data-checkFormIsValid="false">{s name="AddressesActionButtonCreate"}{/s}</button>
            </div>
        {/block}

        {block name="frontend_address_action_button_save_action"}
            <input type="hidden" name="saveAction" value="update" />
        {/block}
    </div>
{/block}

{block name='frontend_address_form_input_set_default_shipping'}{/block}
{block name='frontend_address_form_input_set_default_billing'}{/block}