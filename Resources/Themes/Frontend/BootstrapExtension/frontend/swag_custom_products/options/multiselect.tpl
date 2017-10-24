{namespace name="frontend/detail/option"}

{block name="frontend_detail_swag_custom_products_options_multiselect"}

    {* Field *}
    {block name="frontend_detail_swag_custom_products_options_multiselect_field"}
        <select class="wizard-input form-control" id="custom-products-option-{$key}"
            {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/multiselect'}{/s}"{/if}
                data-field="true"
                multiple="multiple"
                size="5"
                data-no-custom-select="true"
                name="custom-option-id--{$option['id']}[]">

            {* Placeholder is a disabled option *}
            {block name="frontend_detail_swag_custom_products_options_multiselect_placeholder"}
                {if $option['placeholder']}
                    <optgroup label="{$option['placeholder']}">
                {/if}
            {/block}

            {* Values *}
            {block name="frontend_detail_swag_custom_products_options_multiselect_values"}
                {foreach $option['values'] as $value}

                    <option value="{$value['id']}"{if $value['is_default_value']} selected="selected"{/if}>
                        {$value['name']}
                        {* Once price for the option *}
                        {if $value['is_once_surcharge']}
                            {block name="frontend_detail_swag_custom_products_options_select_once_price"}
                                (+ {$value['surcharge']|currency}&nbsp;{s name="detail/option/once_price"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                            {/block}
                        {else}
                            {* Surcharge price for the option *}
                            {block name="frontend_detail_swag_custom_products_options_select_surcharges_price"}
                                {if $value['surcharge']}
                                    {$packUnit = $sArticle.packunit}

                                    {if !$packUnit}
                                        {$packUnit="{s name='detail/index/surcharge_price_unit'}{/s}"}
                                    {/if}

                                    (+ {$value['surcharge']|currency} / {$packUnit}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                {/if}
                            {/block}
                        {/if}
                    </option>
                {/foreach}
            {/block}

            {block name="frontend_detail_swag_custom_products_options_multiselect_placeholder_closing"}
                {if $option['placeholder']}
                    </optgroup>
                {/if}
            {/block}
        </select>
    {/block}
{/block}
