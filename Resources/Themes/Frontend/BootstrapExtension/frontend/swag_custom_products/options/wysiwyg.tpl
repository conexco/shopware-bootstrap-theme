{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_wysiwyg_field"}
    <textarea
        id="custom-products-option-{$key}"
        name="custom-option-id--{$option['id']}"
        data-swag-custom-products-wysiwyg="true"
        data-language="{s name='IndexXmlLang' namespace="frontend/index/index"}{/s}"
        data-class="wizard--input"
        class="is--hidden"
        data-field="true"
        {if $option['default_value']} data-default-value="{$option['default_value']}"{/if}
        {if $option['placeholder']} placeholder="{$option['placeholder']}"{/if}
        {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/wysiwyg'}{/s}"{/if}>
        {if $option['default_value']}{$option['default_value']}{/if}
    </textarea>
{/block}
