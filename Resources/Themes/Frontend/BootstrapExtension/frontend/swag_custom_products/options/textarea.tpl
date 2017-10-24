{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_textarea_field"}
    <textarea class="wizard-input form-control"
        id="custom-products-option-{$key}"
        name="custom-option-id--{$option['id']}"
        data-field="true"
        {if $option['default_value']} data-default-value="{$option['default_value']}"{/if}
        {if $option['max_text_length']} maxlength="{$option['max_text_length']}"{/if}
        {if $option['placeholder']} placeholder="{$option['placeholder']}"{/if}
        {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/textarea'}{/s}"{/if}
        data-custom-products-autosize-textarea="true">
          {if $option['default_value']}{$option['default_value']}{/if}
    </textarea>
{/block}
