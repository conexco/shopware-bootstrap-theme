{namespace name="frontend/detail/option"}

{* Output all fields *}
{block name="frontend_detail_swag_custom_products_options_checkbox_fields"}
    <div id="custom-products-option-{$key}" class="wizard-input custom-products-validation-wrapper" data-group-field="true"{if $option['required']} data-validate-group="true" data-validate-message="{s name='detail/validate/checkbox_group'}{/s}"{/if}>
        {foreach $option['values'] as $value}
            {* Output the actual field *}
            {block name="frontend_detail_swag_custom_products_options_checkbox_field"}
                <div class="checkbox custom-products-checkbox{if $value@first} mtn{/if}">
                    <label for="custom-products-checkbox-{$key}-{$value@index}">
                        <input type="checkbox" id="custom-products-checkbox-{$key}-{$value@index}"
                               name="custom-option-id--{$option['id']}[]"
                               value="{$value['id']}"
                               {if $value['is_default_value']} data-default-value="{$value['id']}"{/if}
                               {if $value['is_default_value']} checked="checked"{/if} />

                        {* Label value *}
                        {block name="frontend_detail_swag_custom_products_options_checkbox_label_value"}
                            {$value['name']}

                            {* Once price for the option *}
                            {if $value['is_once_surcharge']}
                                {block name="frontend_detail_swag_custom_products_options_checkbox_once_price"}
                                    (+ {$value['surcharge']|currency}&nbsp;{s name="detail/option/once_price"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                {/block}
                            {else}

                                {* Surcharge price for the option *}
                                {block name="frontend_detail_swag_custom_products_options_checkbox_surcharges_price"}
                                    {if $value['surcharge']}
                                        {$packUnit = $sArticle.packunit}

                                        {if !$packUnit}
                                            {$packUnit="{s name='detail/index/surcharge_price_unit'}{/s}"}
                                        {/if}

                                        (+ {$value['surcharge']|currency} / {$packUnit}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                    {/if}
                                {/block}
                            {/if}
                        {/block}
                    </label>
                </div>    
            {/block}
        {/foreach}
    </div>
{/block}
