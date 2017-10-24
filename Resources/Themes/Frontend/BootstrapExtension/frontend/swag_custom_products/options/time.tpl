{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_timefield_field"}
    <input class="wizard-input form-control" type="text" name="custom-option-id--{$option['id']}"
           id="custom-products-option-{$key}"
           data-custom-products-timepicker="true"
           data-parentWrapperSelector=".custom-products-option"
           data-field="true"
            {if $option['min_date']} data-min="{$option['min_date']}"{/if}
            {if $option['max_date']} data-max="{$option['max_date']}"{/if}
            {if $option['default_value']} data-default-value="{$option['default_value']}"{/if}
            {if $option['default_value']} value="{$option['default_value']}"{/if}
            {if $option['placeholder']} placeholder="{$option['placeholder']}"{/if}
            {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/time'}{/s}"{/if}
    />
{/block}