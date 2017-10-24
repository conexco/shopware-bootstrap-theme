{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_numberfield_field"}
    <input class="wizard-input form-control" type="number" name="custom-option-id--{$option['id']}"
           id="custom-products-option-{$key}"
           {if $option['placeholder']}placeholder="{$option['placeholder']}"{/if}
           data-field="true"
        {if $option['default_value']}value="{$option['default_value']}"{/if}
        {if $option['default_value']} data-default-value="{$option['default_value']}"{/if}
        {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/numberfield'}{/s}"{/if}
        {if $option['min_value']} min="{$option['min_value']}" {else} min="0"{/if} data-validate-message-min="{s name='detail/validate/numberfield/min'}{/s}"
        {if $option['max_value']} max="{$option['max_value']}" data-validate-message-max="{s name='detail/validate/numberfield/max'}{/s}"{/if}
        {if $option['interval']} step="{$option['interval']}" data-validate-message-step="{s name='detail/validate/numberfield/step'}{/s}"{/if}
    />
{/block}
