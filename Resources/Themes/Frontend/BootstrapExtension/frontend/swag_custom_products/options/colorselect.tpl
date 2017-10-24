{namespace name="frontend/detail/option"}

{block name="frontend_detail_swag_custom_products_options_colorselection_fields"}
    <div id="custom-products-option-{$key}" class="wizard-input custom-products-color-selection-wrapper" data-group-field="true"{if $option['required']} data-validate-group="true" data-validate-message="{s name='detail/validate/color_selection'}{/s}"{/if}>
        {foreach $option['values'] as $value}
            {block name="frontend_detail_swag_custom_products_options_colorselection_element"}
                <div class="custom-products-color-selection thumbnail pam mbm">

                    {block name="frontend_detail_swag_custom_products_options_colorselection_hidden_input"}
                        <input type="radio" id="custom-products-color-selection-{$key}-{$value@index}"
                               class="hidden"
                               name="custom-option-id--{$option['id']}"
                               value="{$value['id']}"
                            {if $value['is_default_value']}checked="checked" data-default-value="{$value['id']}"{/if}
                            {if $value['required']} required="required"{/if}
                            >
                    {/block}

                    {block name="frontend_detail_swag_custom_products_options_colorselection_label"}
                        <label class="custom-products-color-selection-label text-center" for="custom-products-color-selection-{$key}-{$value@index}">

                            {block name="frontend_detail_swag_custom_products_options_colorselection_color"}
                                <div class="custom-products-color-selection-display" style="background-color: {$value['value']}">
                                </div>
                            {/block}

                            {block name="frontend_detail_swag_custom_products_options_colorselection_description"}
                                <div class="custom-products-color-selection-description mts">
                                    {$value['name']}
                                </div>
                            {/block}

                            <div class="custom-products-color-selection-price">

                                {* Once price for the option *}
                                {if $value['is_once_surcharge']}
                                    {block name="frontend_detail_swag_custom_products_options_checkbox_once_price"}
                                        (+ {$value['surcharge']|currency}&nbsp;{s name="detail/option/once_price"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                    {/block}
                                {else}
                                    {* Surcharge price for the option *}
                                    {block name="frontend_detail_swag_custom_products_options_colorselection_surcharges_price"}
                                        {if $value['surcharge']}
                                            {$packUnit = $sArticle.packunit}

                                            {if !$packUnit}
                                                {$packUnit="{s name='detail/index/surcharge_price_unit'}{/s}"}
                                            {/if}

                                            (+ {$value['surcharge']|currency} / {$packUnit}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                        {/if}
                                    {/block}
                                {/if}
                            </div>
                        </label>
                    {/block}
                </div>
            {/block}
        {/foreach}
    </div>
{/block}