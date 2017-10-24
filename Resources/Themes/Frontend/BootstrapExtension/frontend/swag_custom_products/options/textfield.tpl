{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_textfield_field"}
    <input class="wizard-input form-control" type="text" name="custom-option-id--{$option['id']}"
        id="custom-products-option-{$key}"
        data-field="true"
        {if $option['default_value']} data-default-value="{$option['default_value']}"{/if}
        {if $option['placeholder']}placeholder="{$option['placeholder']}"{/if}
        {if $option['default_value']}value="{$option['default_value']}"{/if}
        {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/textfield'}{/s}"{/if}
        {if $option['max_text_length']}maxlength="{$option['max_text_length']}"{/if}
    />
{/block}
