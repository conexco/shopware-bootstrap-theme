{namespace name="frontend/detail/option"}

{block name="frontend_detail_swag_custom_products_options_select"}

    {* Field *}
    {block name="frontend_detail_swag_custom_products_options_select_field"}
        {$selectedValue = false}
        {foreach $option['values'] as $value}
            {if $value['is_default_value']}
                {$selectedValue = true}
                {break}
            {/if}
        {/foreach}

        <select id="custom-products-option-{$key}"
                class="wizard-input form-control"
                {if $option['required']} data-validate="true" data-validate-message="{s name='detail/validate/multiselect'}{/s}"{/if}
                data-field="true"
                name="custom-option-id--{$option['id']}[]">

            {* Placeholder is a disabled option *}
            {block name="frontend_detail_swag_custom_products_options_select_placeholder"}
                <option disabled="disabled" value=""{if !$selectedValue} selected="selected"{/if}>
                    {if $option['placeholder']}
                        {$option['placeholder']}
                    {else}
                        {s name="detail/option/select/placeholder"}Please choose...{/s}
                    {/if}
                </option>
            {/block}

            {* Values *}
            {block name="frontend_detail_swag_custom_products_options_select_values"}
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
        </select>
    {/block}
{/block}
